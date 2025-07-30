/*
 * Copyright (c) 2003, The Regents of the University of California, through
 * Lawrence Berkeley National Laboratory (subject to receipt of any required
 * approvals from the U.S. Dept. of Energy). All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * (1) Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * 
 * (2) Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 * 
 * (3) Neither the name of the University of California, Lawrence Berkeley
 * National Laboratory, U.S. Dept. of Energy nor the names of its contributors
 * may be used to endorse or promote products derived from this software without
 * specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 * 
 * You are under no obligation whatsoever to provide any bug fixes, patches, or
 * upgrades to the features, functionality or performance of the source code
 * ("Enhancements") to anyone; however, if you choose to make your Enhancements
 * available either publicly, or directly to Lawrence Berkeley National
 * Laboratory, without imposing a separate written license agreement for such
 * Enhancements, then you hereby grant the following license: a non-exclusive,
 * royalty-free perpetual license to install, use, modify, prepare derivative
 * works, incorporate into other computer software, distribute, and sublicense
 * such enhancements or derivative works thereof, in binary and source code
 * form.
 */
package nux.xom.pool;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;

import javax.xml.bind.JAXBException;
import javax.xml.bind.MarshalException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.UnmarshalException;
import javax.xml.bind.Unmarshaller;
import javax.xml.parsers.DocumentBuilder;

import nu.xom.Attribute;
import nu.xom.Document;
import nu.xom.Element;
import nu.xom.Node;
import nu.xom.NodeFactory;
import nu.xom.Nodes;
import nu.xom.ParentNode;
import nu.xom.Serializer;
import nu.xom.Text;
import nu.xom.XMLException;
import nu.xom.canonical.Canonicalizer;
import nu.xom.converters.DOMConverter;

import org.w3c.dom.DOMImplementation;

/**
 * Various utilities avoiding redundant code in several classes.
 * 
 * @author whoschek.AT.lbl.DOT.gov
 * @author $Author: hoschek3 $
 * @version $Revision: 1.89 $, $Date: 2005-05-13 19:30:30 $
 */
public class XOMUtil {
	
	// for indentation substring sharing in toDebugString()
	private static final String TABS = repeatString("\t", 128);
	
	// trick to detect default platform charset
	private static final Charset DEFAULT_PLATFORM_CHARSET = 
		Charset.forName(new InputStreamReader(new ByteArrayInputStream(new byte[0])).getEncoding());	

	// constructing a new DocumentBuilder is VERY expensive, so we reuse it time and again
	// in a thread-safe way once it has been constructed.
	private static final ThreadLocal threadLocalDocBuilder = new SoftThreadLocal() {
		protected Object initialHardValue() { // lazy init
			javax.xml.parsers.DocumentBuilderFactory factory =
				javax.xml.parsers.DocumentBuilderFactory.newInstance();
			factory.setNamespaceAware(true);
			try {
				DocumentBuilder docBuilder = factory.newDocumentBuilder();
				//System.err.println("found DOM DocumentBuilder="+docBuilder.getClass().getName());
				return docBuilder;
			} catch (javax.xml.parsers.ParserConfigurationException e) {
				throw new XMLException("Can't find or create DOM DocumentBuilder", e);
			}
		}
	};
	
	// in toPrettyXML(), reusing the serializer in a thread-safe way is 5 times 
	// faster for tiny documents (due too setup cost of streams, encoders, etc.)
	private static final ThreadLocal threadlocalSerializer = new SoftThreadLocal() {
		protected Object initialHardValue() { // lazy init
			ResetableByteArrayOutputStream out = new ResetableByteArrayOutputStream(128);
			try {
				Serializer serializer = new Serializer(out, "UTF-8");
				serializer.setIndent(4);
				return new Object[] { serializer, out };
			} catch (IOException e) { // safe: UTF-8 support is required by JDK spec
				throw new RuntimeException("should never happen", e);
			}			
		}
	};
	
	/** 
	 * Enables giving excessive memory back to the garbage collector, 
	 * preventing "hidden" memory leaks. 
	 */
	private static final class ResetableByteArrayOutputStream extends ByteArrayOutputStream {
		public ResetableByteArrayOutputStream(int initialCapacity) { 
			super(initialCapacity); 
		}
		public synchronized void reset(int maxCapacity) {
			reset();
			if (buf.length > maxCapacity) buf = new byte[maxCapacity]; 
		}
	}
		
	private XOMUtil() {} // not instantiable

	/**
	 * Returns a namespace-aware DOMImplementation via the default JAXP lookup mechanism.
	 */
	public static DOMImplementation getDOMImplementation() {
		return ((DocumentBuilder) threadLocalDocBuilder.get()).getDOMImplementation();
	}
	
	/**
	 * Reads until end-of-stream and returns all read bytes, finally closes the stream.
	 * 
	 * @param input the input stream
	 * @throws IOException if an I/O error occurs while reading the stream
	 */
	public static byte[] toByteArray(InputStream input) throws IOException {
		try {
			// safe and fast even if input.available() behaves weird or buggy
			int len = Math.max(256, input.available());
			byte[] buffer = new byte[len];
			byte[] output = new byte[len];
			
			len = 0;
			int n;
			while ((n = input.read(buffer)) >= 0) {
				if (len + n > output.length) { // grow capacity
					byte tmp[] = new byte[Math.max(output.length << 1, len + n)];
					System.arraycopy(output, 0, tmp, 0, len);
					System.arraycopy(buffer, 0, tmp, len, n);
					buffer = output; // use larger buffer for future larger bulk reads
					output = tmp;
				} else {
					System.arraycopy(buffer, 0, output, len, n);
				}
				len += n;
			}

			if (len == output.length) return output;
			buffer = null; // help gc
			buffer = new byte[len];
			System.arraycopy(output, 0, buffer, 0, len);
			return buffer;
		} finally {
			if (input != null) input.close();
		}
	}

	/**
	 * Reads until end-of-stream and returns all read bytes as a string, finally
	 * closes the stream, converting the data with the given charset encoding, or
	 * the system's default platform encoding if <code>charset == null</code>.
	 * 
	 * @param input the input stream
	 * @param charset the charset to convert with, e.g. <code>Charset.forName("UTF-8")</code>
	 * @throws IOException if an I/O error occurs while reading the stream
	 */
	public static String toString(InputStream input, Charset charset) throws IOException {
		if (charset == null) charset = DEFAULT_PLATFORM_CHARSET;			
		byte[] data = toByteArray(input);
		return charset.decode(ByteBuffer.wrap(data)).toString();
	}

	/**
	 * Returns a pretty-printed String representation of the given node (subtree).
	 * 
	 * @param node the node (subtree) to convert.
	 * @see Serializer
	 */
	public static String toPrettyXML(Node node) {
		Document doc;
		if (node instanceof Document) {
			doc = (Document) node;
		}
		else if (node instanceof Element) {
			// do not modify elem's parent pointer
			doc = new Document((Element) node.copy()); 
		}
		else {
			// not really pretty-printed
			return node.toXML(); 
		}

		Object[] pair = (Object[]) threadlocalSerializer.get();
		Serializer serializer = (Serializer) pair[0];
		ResetableByteArrayOutputStream out = (ResetableByteArrayOutputStream) pair[1];
		String str;
		try {
			serializer.write(doc);
			serializer.flush();
			str = out.toString("UTF-8"); // safe: UTF-8 support is required by JDK spec
		} catch (IOException e) {
			throw new RuntimeException("should never happen", e);
		} finally {
			out.reset(1024); // avoid hidden memory leaks
		}
		
		// remove XML declaration header <?xml version="1.0" encoding="UTF-8"?>\r\n
		// remove trailing line break, if any
		int i = str.indexOf('\n');
		int j = str.length();
		if (str.endsWith("\r\n")) j = j - 2;
		else if (str.endsWith("\n")) j = j - 1;
		return str.substring(i+1, j);
	}
	
	/**
	 * Returns the W3C Canonical XML representation of the given document.
	 * 
	 * @param doc the document to convert.
	 * @see Canonicalizer
	 */
	public static byte[] toCanonicalXML(Document doc) {
		ByteArrayOutputStream out = new ByteArrayOutputStream(128);
		Canonicalizer canon = new Canonicalizer(out);
		try {
			canon.write(doc);
		} catch (IOException e) {
			throw new RuntimeException("should never happen", e);
		} catch (NoSuchMethodError e) {
			// work-around for xom-1.1.x
			// argument type to Canonicalizer.write() has changed in xom-1.1
			try {
				java.lang.reflect.Method method = canon.getClass().getMethod(
						"write", new Class[] { Node.class});
				method.invoke(canon, new Object[] {doc});
			} catch (Throwable t) {
				throw new Error(t);
			}
		}

		return out.toByteArray();
	}
	
	/**
	 * Returns a properly indented debug level string representation of the
	 * entire given XML node subtree, decorated with node types, node names,
	 * children, etc. For instance, this can be used to find structural diffs,
	 * to detect anomalies wrt. empty texts, whitespace text, etc.
	 * Applications could use this in combination with a {@link Normalizer}.
	 * 
	 * @param node
	 *            the subtree to display
	 * @return a string representation for debugging purposes.
	 */
	public static String toDebugString(Node node) {
		int depth = 0;
		String indent = TABS.substring(0, depth);
		StringBuffer result = new StringBuffer(128);
		
		result.append(indent);
		result.append(node); // also works if node == null
		result.append('\n');
		
		if (node instanceof ParentNode) { // print subtree contents
			toDebugString((ParentNode) node, depth+1, result);
		}
		
		result.deleteCharAt(result.length()-1); // remove trailing '\n'
		return result.toString();
	}

	private static void toDebugString(ParentNode node, int depth, StringBuffer result) {
		String indent = TABS.substring(0, depth); // substring sharing
		
		// print attributes
		if (node instanceof Element) {
			Element elem = (Element) node;
			for (int i=0; i < elem.getAttributeCount(); i++) {
				result.append(indent);
				result.append(elem.getAttribute(i).toString());
				result.append('\n');
			}
		}
		
		// omitting namespace declarations for now
		
		// print children
		for (int i=0; i < node.getChildCount(); i++) {
			Node child = node.getChild(i);
			result.append(indent);
			result.append(child.toString());
			result.append('\n');
			if (child instanceof Element) { // recurse
				toDebugString((Element)child, depth+1, result);
			}
		}
	}
	
	private static String repeatString(String str, int times) {
		StringBuffer buf = new StringBuffer(str.length() * times);
		for (int i=0; i < times; i++) buf.append(str);
		return buf.toString();
	}
	
	/**
	 * Returns a node factory that removes each {@link nu.xom.Text} node that
	 * is empty or consists of whitespace characters only. This method fully preserves
	 * narrative <code>Text</code> containing whitespace along with other characters.
	 * <p>
	 * Otherwise this factory behaves just like the standard {@link NodeFactory}.
	 * <p>
	 * Ignoring whitespace-only nodes reduces memory footprint for documents
	 * that are heavily pretty printed and indented, i.e. human-readable. Remember that
	 * without such a factory, <i>every </i> whitespace sequence occurring
	 * between element tags generates a mostly useless Text node.
	 * <p>
	 * Finally, note that this method's whitespace pruning is appropriate for
	 * many, but not all XML use cases (round-tripping).
	 * For example, the blank between 
	 * <code>&lt;p>&lt;strong>Hello&lt;/strong> &lt;em>World!&lt;/em>&lt;/p></code>
	 * will be removed, which might not be what you want. This is because this 
	 * method does not look across multiple Text nodes.
	 */
	public static NodeFactory getIgnoreWhitespaceOnlyTextNodeFactory() {
		return new NodeFactory() {
			private final Nodes NONE = new Nodes();
			
			public Nodes makeText(String text) {
				return Normalizer.isWhitespaceOnly(text) ?
					NONE :
					super.makeText(text); 	
			}			
		};
	}
	
	/**
	 * Returns a node factory that removes leading and trailing whitespaces in
	 * each {@link nu.xom.Text} node, altogether removing a Text node that becomes empty after
	 * said trimming. Trimming is done via {@link String#trim()}. For example a
	 * text node of <code>"  hello world   "</code> becomes
	 * <code>"hello world"</code>, and a text node of <code>"   "</code> is
	 * removed.
	 * <p>
	 * Otherwise this factory behaves just like the standard {@link NodeFactory}.
	 * <p>
	 * Finally, note that this method's whitespace pruning is appropriate for
	 * many, but not all XML use cases (round-tripping).
	 */
	public static NodeFactory getTextTrimmingNodeFactory() {
		return new NodeFactory() {
			private final Nodes NONE = new Nodes();
			
			public Nodes makeText(String text) {
				text = Normalizer.trim(text);
				return text.length() == 0 ? NONE : super.makeText(text);
			}
		};
	}
	
	/**
	 * Returns a node factory for pure document validation. This factory does
	 * not generate a document on <code>Builder.build(...)</code>, which is
	 * not required anyway for pure validation. Ignores all input and builds an
	 * empty document instead. This improves validation performance.
	 */
	public static NodeFactory getNullNodeFactory() {
		return new NodeFactory() {		
			private final Nodes NONE = new Nodes();
			
			public Nodes makeAttribute(String name, String URI, String value, Attribute.Type type) {
				return NONE;
			}
	
			public Nodes makeComment(String data) {
				return NONE;
			}
	
			public Nodes makeDocType(String rootElementName, String publicID, String systemID) {
				return NONE;
			}
	
			public Nodes makeProcessingInstruction(String target, String data) {
				return NONE;
			}
			
			public Element makeRootElement(String name, String namespace) {
				return new Element(name, namespace);
			}
	
			public Nodes makeText(String text) {
				return NONE;
			}
	
			public Element startMakingElement(String name, String namespace) {
				return null;
			}
		};
	}

	/** little helper for safe reading of string system properties */
	static String getSystemProperty(String key, String def) {
		try { 
			return System.getProperty(key, def);
		} catch (Throwable e) { // better safe than sorry (applets, security managers, etc.) ...
			return def; // we can live with that
		}		
	}

	/** little helper for safe reading of boolean system properties */
	static boolean getSystemProperty(String key, boolean def) {
		try { 
			return "true".equalsIgnoreCase(System.getProperty(key, String.valueOf(def)));
		} catch (Throwable e) { // better safe than sorry (applets, security managers, etc.) ...
			return def; // we can live with that
		}		
	}

	/** little helper for safe reading of int system properties */
	static int getSystemProperty(String key, int def) {
		try { 
			return Integer.getInteger(key, def).intValue();
		} catch (Throwable e) { // better safe than sorry (applets, security managers, etc.) ...
			return def; // we can live with that
		}		
	}

	/** little helper for safe reading of long system properties */
	static long getSystemProperty(String key, long def) {
		try { 
			return Long.getLong(key, def).longValue();
		} catch (Throwable e) { // better safe than sorry (applets, security managers, etc.) ...
			return def; // we can live with that
		}		
	}

	/**
	 * Marshals (serializes) the given JAXB object via the given marshaller
	 * into a new XOM Document (convenience method).
	 * <p>
	 * This implementation is somewhat inefficient but correctly does the job.
	 * There is no connection between the JAXB object tree and the XOM object tree;
	 * they are completely independent object trees without any cross-references.
	 * Hence, updates in one tree are not automatically reflected in the other tree.
	 * 
	 * @param marshaller
	 *            a JAXB serializer (note that a marshaller is typically
	 *            not thread-safe and expensive to construct; hence the recommendation 
	 *            is to use a {@link ThreadLocal} to make it thread-safe and efficient)
	 * @param jaxbObj
	 *            the JAXB object to serialize
	 * @return the new XOM document
	 * @throws JAXBException
	 *             If an unexpected problem occurred in the conversion.
	 * @throws MarshalException
	 *             If an error occurred while performing the marshal operation.
	 *             Whereever possible, one should prefer the
	 *             {@link MarshalException} over the {@link JAXBException}.
	 * @see Marshaller#marshal(java.lang.Object, org.w3c.dom.Node)
	 */
	public static Document jaxbMarshal(Marshaller marshaller, Object jaxbObj) 
			throws JAXBException {
		if (jaxbObj == null) 
			throw new IllegalArgumentException("jaxbObj must not be null");
		if (marshaller == null) 
			throw new IllegalArgumentException("marshaller must not be null");
		
		return DOMConverter.convert(jaxbMarshalDOM(marshaller, jaxbObj));
	}
	
	/**
	 * Unmarshals (deserializes) the given XOM node via the given unmarshaller
	 * into a new JAXB object (convenience method).
	 * <p>
	 * This implementation is somewhat inefficient but correctly does the job.
	 * There is no connection between the JAXB object tree and the XOM object tree;
	 * they are completely independent object trees without any cross-references.
	 * Hence, updates in one tree are not automatically reflected in the other tree.
	 * 
	 * @param unmarshaller
	 *            a JAXB deserializer (note that an unmarshaller is typically
	 *            not thread-safe and expensive to construct; hence the recommendation 
	 *            is to use a {@link ThreadLocal} to make it thread-safe and efficient)
	 * @param node
	 *            the XOM node to deserialize
	 * @return the new JAXB object
	 * @throws JAXBException
	 *             If an unexpected problem occurred in the conversion.
	 * @throws UnmarshalException
	 *             If an error occurred while performing the unmarshal operation.
	 *             Whereever possible, one should prefer the
	 *             {@link UnmarshalException} over the {@link JAXBException}.
	 * @see Unmarshaller#unmarshal(org.w3c.dom.Node)
	 */
	public static Object jaxbUnmarshal(Unmarshaller unmarshaller, ParentNode node)
			throws JAXBException {
		if (node == null) 
			throw new IllegalArgumentException("node must not be null");
		if (unmarshaller == null) 
			throw new IllegalArgumentException("unmarshaller must not be null");
		
		Document doc;
		if (node instanceof Document) {
			doc = (Document) node;
		}
		else if (node instanceof Element) {
			// do not modify elem's parent pointer
			doc = new Document((Element) node.copy());
		}
		else {
			throw new IllegalArgumentException("Illegal XOM node type" + node);
		}
		
		return jaxbUnmarshalDOM(unmarshaller, 
				DOMConverter.convert(doc, getDOMImplementation()));
	}
	
	private static org.w3c.dom.Document jaxbMarshalDOM(Marshaller marshaller, Object jaxbObj) throws JAXBException {
		DocumentBuilder docBuilder = (DocumentBuilder) threadLocalDocBuilder.get();
		org.w3c.dom.Document doc = docBuilder.newDocument();
		marshaller.marshal(jaxbObj, doc);
		return doc;
	}
	
	private static Object jaxbUnmarshalDOM(Unmarshaller unmarshaller, org.w3c.dom.Node node) throws JAXBException {
		return unmarshaller.unmarshal(node);
	}
	
	/**
	 * Returns a reasonable approximation of the main memory [bytes] consumed by the
	 * given XOM subtree. Assumes that qname Strings are interned, but Text
	 * values and Attribute values are not. For simplicity, assumes no VM word
	 * boundary alignment of instance vars. Useful for memory-sensitive caches.
	 */
	static int getMemorySize(Node node) {
		int HEADER = 12; // object header of any java object
		int PTR = 4; // pointer
		int STR = HEADER + 3*4 + PTR + HEADER + 4; // string
		int ARRLIST = HEADER + 4 + PTR + HEADER + 4; // ArrayList

		int size = HEADER + PTR + 4; // object header + parent + siblingPosition
		if (node instanceof ParentNode) {
			ParentNode parent = (ParentNode) node;
			size += PTR + PTR; // baseURI + childrenptr
			int count = parent.getChildCount();
			if (count > 0) size += ARRLIST + count*PTR;
			for (int i = count; --i >= 0; ) {
				size += getMemorySize(parent.getChild(i));
			}
			
			if (node instanceof Element) {
				Element elem = (Element) node;
				size += 5*PTR;
				count = elem.getAttributeCount();
				if (count > 0) size += ARRLIST + count*PTR;
				for (int i = count; --i >= 0; ) {
					size += getMemorySize(elem.getAttribute(i));
				}
				// for the moment assume no additional namespace declarations (common case)
			}
		} else if (node instanceof Attribute) {
			size += 5*PTR;
			size += STR + 2 * node.getValue().length();
		} else { // Text (and Comment, ProcessingInstruction, DocType)
			size += PTR;
			size += STR + 2 * node.getValue().length();
		}

		return size;
	}
	
	///////////////////////////////////////////////////////////////////////////////
	// Nested classes:
	///////////////////////////////////////////////////////////////////////////////
	
	/**
	 * Standard XML algorithms for text and whitespace normalization (but not
	 * for Unicode normalization); type safe enum. Example whitespace is
	 * <code>' ', '\t', '\r', '\n'</code>, and so on.
	 * <p>
	 * This class is rarely needed by applications, but when it is needed it's
	 * pretty useful.
	 */
	public static class Normalizer {
		
		/**
		 * Whitespace normalization returns the string unchanged; hence
		 * indicates no whitespace normalization should be performed at all;
		 * This is typically the default for applications.
		 */
		public static final Normalizer PRESERVE = new Normalizer();
		
		/**
		 * Whitespace normalization replaces <i>each</i> whitespace character in the
		 * string with a <code>' '</code> space character.
		 */
		public static final Normalizer REPLACE = new ReplaceNormalizer();
				
		/**
		 * Whitespace normalization replaces each
		 * sequence of whitespace in the string by a single <code>' '</code>
		 * space character; Further, leading and trailing whitespaces are removed,
		 * if present, ala <code>String.trim()</code>.
		 */
		public static final Normalizer COLLAPSE = new CollapseNormalizer();
		
		/**
		 * Whitespace normalization removes leading and trailing whitespaces,
		 * if present, ala <code>String.trim()</code>.
		 */
		public static final Normalizer TRIM = new TrimNormalizer();
		
		private Normalizer() {}
		
		/**
		 * Performs XML whitespace normalization according to the chosen
		 * algorithm implemented by this type.
		 * Also see http://www.xml.com/pub/a/2000/09/27/schemas1.html?page=2
		 * 
		 * @param str
		 *            the string to normalize
		 * @return a normalized string
		 */
		CharSequence normalizeWhitespace(CharSequence str) { 
			return str; // PRESERVE by default; override for other algorithms
		}
				
		/**
		 * Recursively walks the given node subtree and merges runs of consecutive
		 * (adjacent) {@link Text} nodes (if present) into a single Text node
		 * containing their string concatenation; Empty Text nodes are removed. 
		 * If present, CDATA nodes are treated as Text nodes.
		 * <p>
		 * <i>After</i> merging consecutive Text nodes into a single Text node, the given 
		 * whitespace normalization algorithm is applied to each <i>resulting</i> 
		 * Text node.
		 * The semantics of the PRESERVE algorithm are the same as with the DOM method
		 * {@link org.w3c.dom.Node#normalize() org.w3c.dom.Node.normalize()}.
		 * <p>
		 * Note that documents built by a {@link nu.xom.Builder} with the default
		 * {@link nu.xom.NodeFactory} are guaranteed to never have adjacent or empty
		 * Text nodes. However, subsequent manual removal or insertion of nodes to
		 * the tree can cause Text nodes to become adjacent, and updates can cause
		 * Text nodes to become empty.
		 * <p>
		 * Text normalization with the whitespace PRESERVE algorithm is necessary to 
		 * achieve strictly standards-compliant
		 * XPath and XQuery semantics if a query compares or extracts the value of
		 * individual Text nodes that (unfortunately) happen to be adjacent to
		 * other Text nodes. Luckily, such use cases are rare in practical
		 * real-world scenarios and thus a user hardly ever needs to call this method
		 * before passing a XOM tree into XQuery or XPath.
		 * <p>
		 * Example Usage:
		 * 
		 * <pre>
		 * Element foo = new Element("foo");
		 * foo.appendChild("");
		 * foo.appendChild("bar");
		 * foo.appendChild("");
		 * 
		 * Element elem = new Element("elem");
		 * elem.appendChild("");
		 * elem.appendChild(foo);
		 * elem.appendChild("hello   ");
		 * elem.appendChild("world");
		 * elem.appendChild(" \n");
		 * elem.appendChild(foo.copy());
		 * elem.appendChild("");
		 * 
		 * XOMUtil.Normalizer.PRESERVE.normalize(elem);
		 * System.out.println(XOMUtil.toDebugString(elem));
		 * </pre>
		 * 
		 * PRESERVE yields the following normalized output:
		 * 
		 * <pre>
		 * [nu.xom.Element: elem]
		 *     [nu.xom.Element: foo]
		 *         [nu.xom.Text: bar]
		 *     [nu.xom.Text: hello   world \n]
		 *     [nu.xom.Element: foo]
		 *         [nu.xom.Text: bar]
		 * </pre>
		 * 
		 * In contrast, REPLACE yields the following hello world form:
		 * 
		 * <pre>
		 * [nu.xom.Element: elem]
		 *     [nu.xom.Element: foo]
		 *         [nu.xom.Text: bar]
		 *     [nu.xom.Text: hello   world  ]
		 *     [nu.xom.Element: foo]
		 *         [nu.xom.Text: bar]
		 * </pre>
		 * 
		 * Whereas, COLLAPSE yields:
		 * 
		 * <pre>
		 * [nu.xom.Element: elem]
		 *     [nu.xom.Element: foo]
		 *         [nu.xom.Text: bar]
		 *     [nu.xom.Text: hello world]
		 *     [nu.xom.Element: foo]
		 *         [nu.xom.Text: bar]
		 * </pre>
		 * 
		 * Finally, TRIM yields:
		 * 
		 * <pre>
		 * [nu.xom.Element: elem]
		 *     [nu.xom.Element: foo]
		 *         [nu.xom.Text: bar]
		 *     [nu.xom.Text: hello   world]
		 *     [nu.xom.Element: foo]
		 *         [nu.xom.Text: bar]
		 * </pre>
		 * 
		 * @param node
		 *            the subtree to normalize
		 */
		public void normalize(ParentNode node) {
			// rather efficient implementation
			for (int i=node.getChildCount(); --i >= 0; ) {
				Node child = node.getChild(i);
				if (child instanceof Element) { // recursively walk the tree
					normalize((Element)child);
				}
				else if (child instanceof Text) {
					// scan to beginning of adjacent run, if any
					int j = i;
					while (--i >= 0 && node.getChild(i) instanceof Text) ;
					
					i++;
					if (j == i) { // remove isolated empty Text node
						String value = child.getValue();
						CharSequence seq = normalizeWhitespace(value);
						if (seq.length() == 0) { 
							node.removeChild(i);
						}
						else {
							String v = value;
							value = seq.toString();
							if (!(value.equals(v))) {
								((Text) child).setValue(value);
							}
						}
					}
					else { // found more than one adjacent Text node; merge them
						// append forwards and remove backwards to minimize memory copies of list elems 
						int k = i;
						StringBuffer buf = new StringBuffer(node.getChild(k++).getValue());
						while (k <= j) buf.append(node.getChild(k++).getValue());
						k = j;
						while (k >= i) node.removeChild(k--);
						
						// replace run with compact merged Text node unless empty
						CharSequence value = normalizeWhitespace(buf);
						if (value.length() > 0) {
							node.insertChild(new Text(value.toString()), i);
						}
					}
				}
			}
		}
		
		private static boolean isWhitespaceOnly(String str) {
			for (int i=str.length(); --i >= 0; ) {
				if (str.charAt(i) > ' ') // see String.trim() implementation 
					return false; 					
//				if (! Character.isWhitespace(text.charAt(i))) 
//					return false;
			}
			return true;
		}
		
		private static String trim(String str) {
			return str.trim();
		}
		
		///////////////////////////////////////////////////////////////////////////////
		// Doubly Nested classes:
		///////////////////////////////////////////////////////////////////////////////
		
		private static final class TrimNormalizer extends Normalizer {
			CharSequence normalizeWhitespace(CharSequence str) {
				return str.toString().trim();
			}			
		}
		
		private static final class ReplaceNormalizer extends Normalizer {
			CharSequence normalizeWhitespace(CharSequence str) {
				int len = str.length();
				StringBuffer buf = new StringBuffer(len);
				boolean modified = false; // keep identity and reduce memory if possible
				
				for (int i=0; i < len; i++) {
					char c = str.charAt(i);
					if (c < ' ') { 
						c = ' ';
						modified = true;
					}
					buf.append(c);
				}
				return modified ? buf : str;
			}			
		}
		
		private static final class CollapseNormalizer extends Normalizer {
			CharSequence normalizeWhitespace(CharSequence str) {
				int len = str.length();
				StringBuffer buf = new StringBuffer(len);
				boolean modified = false; // keep identity and reduce memory if possible
				
				for (int i=0; i < len; i++) {
					char c = str.charAt(i);
					if (c <= ' ') { 
						// skip to next non-whitespace
						int j = i;
						while (++i < len && str.charAt(i) <= ' ');
						
						i--;
						if (!modified && (c != ' ' || j != i)) modified = true;
						c = ' ';
					}
					buf.append(c);
				}
					
				/*
				 * Remove leading and trailing whitespace, if any.
				 * Consecutive leading and trailing runs have already been merged
				 * into a single space by above algorithm.
				 */
				len = buf.length();
				if (len > 0 && buf.charAt(len-1) == ' ') {
					buf.deleteCharAt(len-1);
					modified = true;
				}
				if (buf.length() > 0 && buf.charAt(0) == ' ') {
					buf.deleteCharAt(0);
					modified = true;
				}
				
				return modified ? buf : str;
			}
		}
	}
	
//	/**
//	 * Returns the XOM document obtained by parsing the given XML string.
//	 * Useful for quick'n dirty inline examples and tests.
//	 * The document is parsed with a non-validating Builder, 
//	 * and the baseURI of the document will be the empty string.
//	 * <p>
//	 * Example usage:
//	 * <pre>
//	 * String xml = 
//	 *     "&lt;foo>" +
//	 *         "&lt;bar size=\"123\">" +
//	 *         "&lt;/bar>" +
//	 *     "&lt;/foo>";
//	 * Document doc = toDocument(xml);
//	 * </pre>
//	 * 
//	 * @param xml the string to parse from
//	 * @return the corresponding XOM document
//	 * @throws XMLException if the string is not well-formed XML.
//	 * @see nu.xom.Builder#build(String, String)
//	 */
//	public static Document toDocument(String xml) {
//		try { // no need to be inefficient by default
//			return BuilderPool.GLOBAL_POOL.getBuilder(false).build(xml, "");
//		} catch (ValidityException e) {
//			throw new XMLException(e.getMessage(), e);
//		} catch (ParsingException e) {
//			throw new XMLException(e.getMessage(), e);
//		} catch (IOException e) {
//			throw new XMLException(e.getMessage(), e);
//		}
//	}
			
}