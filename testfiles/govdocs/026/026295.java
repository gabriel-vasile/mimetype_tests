 /*----------------------------------------------------------------------
 * Code written by Vijay Sekhri. Last Modified on 31th July 2001.
 * TableSorter class and TableMap class are copied from the internet.
 *----------------------------------------------------------------------*/




import java.io.IOException;
import java.io.BufferedReader;
import java.io.PrintStream;
import java.io.InputStreamReader;

import java.net.URL;
import java.net.Socket;
import java.net.UnknownHostException;

import java.util.StringTokenizer;
import java.util.Date;
import java.util.Vector;

import java.awt.TextField;
import java.awt.TextArea;
import java.awt.Label;
import java.awt.Color;
import java.awt.Choice;
import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;


import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.FocusListener;
import java.awt.event.FocusEvent;
import java.awt.event.ItemListener;
import java.awt.event.ItemEvent;
import java.awt.event.KeyListener;
import java.awt.event.KeyEvent;
import java.awt.event.InputEvent;


import javax.swing.ImageIcon;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.JLabel;
import javax.swing.JDialog;
import javax.swing.JButton;
import javax.swing.JScrollPane;
import javax.swing.JPanel;
import javax.swing.JCheckBox;
import javax.swing.JTabbedPane;
import javax.swing.JApplet;
import javax.swing.BorderFactory;
import javax.swing.table.AbstractTableModel;
import javax.swing.border.*;
import javax.swing.table.TableModel;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener; 
import javax.swing.table.JTableHeader;
import javax.swing.table.TableColumnModel;



public class MainApplet extends JApplet{		
   
     /*----------------------------------------------------------------------
     * This is the main public class which brings the applet up. It just 
     * makes an object of another class namely GUI and initializes few parameters.
     * There is just one methods in this class 
     * a) void init()  
         
     ---------------------------------------------------------------------*/
    
     
           
     
	public void init(){	
            /*----------------------------------------------------------------------
             * This method takes no parameters and is invoked automatically when this 
             * applet is loaded. It is a standard method and it returns void.
             ----------------------------------------------------------------------*/
            
            /*--------------------------------------------------------------------
             * This (jRunPort) is the port number where JRun server listen for connections to handle servlets.
             * If any day you change the port number of the JRun (servlets only) then you have to change
             * this port number too. There is no way by which this port number can be determined automatically.
             * So you have to hardcode it here. After changing it here recompile this file again.
             *--------------------------------------------------------------------- */
            int jRunPort=8100;  
            
            /*--------------------------------------------------------------------
             * This (port) is the port number  which we can get through the URL. Sometimes if we specify the port
             * number inside the URL then this line of code gets that port number. If no port number is specified then
             * we take the default port number which is 8100.
             *--------------------------------------------------------------------*/
            int port=getCodeBase().getPort();
            
            /*--------------------------------------------------------------------
             * Here we are retriving the person id from the cookie. Actually inside the MainApplet.html file we are retriving
             * the personid and keeping it in a new varible viz. cookie. So the following line of code is just fetching the value 
             * from that new varible.
             *--------------------------------------------------------------------*/
            String personId=getParameter("cookie");

            /*--------------------------------------------------------------------
             * Following three lines of code determine wether port number is provided in the URL or not. If not then default port is
             * taken as the port for JRun servlets which is usually 8100.
             *--------------------------------------------------------------------*/
            if(port==-1){
                port=jRunPort;
            }
            
            /*--------------------------------------------------------------------
             * Here I am making an object of the GUI class. This class handles everthing relating to User Interface 
             * does all the actions as per the response from the user. The view and controller are loosely integrated.
             * The actionPerformed method along with all the methods it calls in the GUI class is the controller and 
             * the rest is the view. While making an object of this class I pass four parameters namely
             * a) The main JApplet
             * b) IpAddress from the URL
             * c) Port number for JRun servlets
             * d) The person Id of the person who has logged in.
             *--------------------------------------------------------------------*/
            GUI gui=new GUI(this,getCodeBase().getHost(),port,personId);
    
	}
	
	
		
	
}
			
class SelectTab extends Thread{
    /*----------------------------------------------------------------------
     * This class is a thread. The one and only purpose of this class is to 
     * select the tab on the applet while other things are still being executed.
     * The main reason of making this class as a thread is that tab are swing components
     * on the tabs we have awt text areas (for system cut paste facility). Now
     * since swing components are light weight as compared to awt components, therefore
     * these tabs are not able to hide the awt text area behind one another. This occurs 
     * only while loading fo the first time. Then if you select the tabs with mouse, 
     * then thses text fileds fall back in place and are hidden behind. In other words 
     * they dont overlap npw. Since I dont want the user to select differnt tabs when 
     * the applet is loaded therfore I made this class as a thread which select the second
     * tab at the start and after the applet is loaded it selects the first tab again.
     * It has just two methods
     * a)  SelectTab(int ,JTabbedPane) which is constructer itself.
     * b)  public void run()
     
     ----------------------------------------------------------------------*/
        int tabNumber=0;
        JTabbedPane baseAppletTabbedPane;
        SelectTab(int tabNumber,JTabbedPane baseAppletTabbedPane){
            /*--------------------------------------------------------------------
             * The purpose of this constructer is to initialize the tab number
             * to the value which is passed as a parameter. This value indicated the
             * which tab index to select. The second parameter is jsut the TabbbedPane 
             * itself on which the tabs exists.
             *--------------------------------------------------------------------*/
		this.tabNumber=tabNumber;
                this.baseAppletTabbedPane=baseAppletTabbedPane;
	}
        
        public void run(){
                /*-------------------------------------------------------------------- 
                 * This thread just selects the tab from the tabbed pane.
                  *--------------------------------------------------------------------*/
                baseAppletTabbedPane.setSelectedIndex(tabNumber);
            
        }
	    
}


class GUI implements ActionListener,MouseListener{
/*----------------------------------------------------------------------    
 * This class is the main Class which handles all The GUI and does all
 * the actions required. 
 *----------------------------------------------------------------------*/
		
	private int noOfColumnsInGenericTable=0; // This is the varaible for number of columns for the Table which displays query results.
	private int headerLength=0; // This is vary important field. This specifies the header length of the http response header from the JRun server. Note this length is not constant.
        private int fixedHeaderLength=0; // This variable is has the header length of the http response header when product line query is made. This remains fixed throughout.
        private int globalNumberOfNotes=0; // This indicated the number of notes for the specified case. When a new case is made this is incremented by one.
        private int MAX=500; // This is maximum number of rows for the table to display notes information.
        private int portNumber=0; // This is the port number where JRun listens for servlets connections.
	private short byOrForFlag=1; // This variable if 0 indicates Reported For ,if 1 indicated Reported By and if 2 indicated AssignedTo. This information is used while poplating data in the right text fields when mouse clicks.
	private boolean newOrOld=true; // This boolean variable shows weather this is a new case or an old one.
        private boolean newOrOldNotes=true; // This boolean variable shows weather this is a new note or an old one.
	private boolean keyPressedBy=false; // This variable if true indicates that data in reportedBy textFields have been modified so disable other textfileds and do repeat this procees more than once.
	private boolean keyPressedFor=false; // This variable if true indicates that data in reportedFor textFields have been modified so disable other textfileds and do repeat this procees more than once.
	private boolean keyPressedTo=false; // This variable if true indicates that data in assignedTo textFields have been modified so disable other textfileds and do repeat this procees more than once.
	private boolean keyPressedCompany=false; //This variable if true indicates that data in company textField have been modified so disable other textfileds and do repeat this procees more than once.
        private String hostName=""; // This variables has the IP address of the JRun server machine.
	private String caseNumber=""; // This indicates the current case number on which the user is working.
	private String tableCase=""; // This variable tells weather the table to be populated is for company name query or for person name query.
	private String oldByLast=""; // This variable has the previous value of the Reported by last name on which the person name query was made. If this value is the same as the new value for reported By last name then this query is not executed again when tab key is pressed. The only way to execute the same query again is to press return.
	private String oldForLast=""; // This variable has the previous value of the Reported For last name on which the person name query was made. If this value is the same as the new value for reported For last name then this query is not executed again when tab key is pressed. The only way to execute the same query again is to press return.
	private String oldToLast=""; // This variable has the previous value of the Assigned To last name on which the person name query was made. If this value is the same as the new value for Assigned To last name then this query is not executed again when tab key is pressed. The only way to execute the same query again is to press return.
	private String oldCompany=""; // This variable has the previous value of the company name on which the company name query was made. If this value is the same as the new value for company name then this query is not executed again when tab key is pressed. The only way to execute the same query again is to press return.
	private String oldByFirst=""; // This variable has the previous value of the Reported by first name on which the person name query was made. If this value is the same as the new value for reported By first name then this query is not executed again when tab key is pressed. The only way to execute the same query again is to press return.
	private String oldForFirst=""; // This variable has the previous value of the Reported For first name on which the person name query was made. If this value is the same as the new value for reported For firstt name then this query is not executed again when tab key is pressed. The only way to execute the same query again is to press return.
	private String oldToFirst=""; // This variable has the previous value of the Assigned To first name on which the person name query was made. If this value is the same as the new value for Assigned To first name then this query is not executed again when tab key is pressed. The only way to execute the same query again is to press return.
	private String newByLast=""; // This variable has the latest value of the reported by last text field. If this value is different from the old value of reported by last field, only then the person name query is executed when tab key is pressed. In order to get this query executed again you have to press enter on reported by last field.
	private String newForLast=""; // This variable has the latest value of the reported for last text field. If this value is different from the old value of reported for last field, only then the person name query is executed when tab key is pressed. In order to get this query executed again you have to press enter on reported for last field.
	private String newToLast=""; // This variable has the latest value of the assigned to last text field. If this value is different from the old value of assigned to last field, only then the person name query is executed when tab key is pressed. In order to get this query executed again you have to press enter on assigned to last field.
	private String newCompany=""; // This variable has the latest value of the company text field. If this value is different from the old value of company field, only then the person name query is executed when tab key is pressed. In order to get this query executed again you have to press enter on company field.
	private String newByFirst=""; // This variable has the latest value of the reported by first text field. If this value is different from the old value of reported by first field, only then the person name query is executed when tab key is pressed. In order to get this query executed again you have to press enter on reported by first field.
	private String newForFirst=""; // This variable has the latest value of the reported for first text field. If this value is different from the old value of reported for first field, only then the person name query is executed when tab key is pressed. In order to get this query executed again you have to press enter on reported for first field.
	private String newToFirst=""; // This variable has the latest value of the assigned to first text field. If this value is different from the old value of assigned to first field, only then the person name query is executed when tab key is pressed. In order to get this query executed again you have to press enter on assigned to first field.
        private String globalCustomerId=""; // This indicated the current value of the customer id as per the selected company.
	private String globalEmailAddressBy=""; // This valiable has the reported by person's email address.
	private String globalEmailAddressFor=""; // This valiable has the reported for person's email address.
	private String globalEmailAddressTo=""; // This valiable has the assigned to person's email address.
        private String globalLoggedInLastName=""; // This is the last name of the pwerson who has logged in.
        private String globalLoggedInFirstName=""; // This is the first name of the pwerson who has logged in.
        private String globalLoggedInRugMember=""; //This variable indicated weather the logged in person is a rug member or not.
        private String globalLoggedInEmailAddress=""; // This valiable has the logged in person's email address.
        private String globalLoggedInPersonId=""; // This is the person id of the person who has logged in.
        private String globalEvSupportType=""; // This varaible has the evsupporttype value of the person who has logged in.
        private String globalOldProductName=""; // This variable has the product name for the particular case.
        private String globalOldStatus=""; // This variable has the status value for the particular case.
        private String globalLoggedInEmployeeFlag="1"; // This indicated weather the logged in person is i2 employee or not.
	private String globalNotes[]; // This is an array of string which has all the information regarding the notes for the particular case.
        private String globalCustomerIds[]; // This is an array of string which has all the customer id for all the companies which are displayed on the table after executing the company query.
	private String globalStringAtEachCellOfGenericTable[][]; // This variable is a two dimension array of string which has the information of each cell of the table which is currently displayed.
	private String[] productLineId; // This is an array of strings which has all the product name and the corresponding ids stored in it.
        private String[] globalWorkLogId; // This array has all the work log ids of the notes for the particular case.
	static JApplet baseApplet=null; // This is the main applet which is passed as a parameter from the MainApplet class.
	private SendAndRecieve sendAndRecieve=null; // This is an object for which has methods for handling all the transmission on the net.
	private String directorySQL="/servlet/GenericQuery"; // This is very important field which indicated the directory where the servlets are stored in JRun and the filename of the servlet. 
        private String directoryEmail="/servlet/Email"; // indicated the directory where the servlets are stored in JRun and the filename of the servlet. This field is not used now. This Email servlet is responsible for sending emails through i2 smptp server. But now I am just inserting the records in Ev_Mail_Queue where the trigger send sall the email.
                
                
	private Socket appletSocket=null; // This is an object of  the Socket class which is used to make socket connections to the servlets.
	AlertMessages alertMessage=new AlertMessages(); // This object is to display all the error messages to the user if something wrong is entered.
                
		
		
	private JTable genericTable; // This is a Table to display all the information of the person or the company.
        private JTable notesTable; // This table is to display all the information regarding the notes for the particular case.
	private JDialog dialogForTable; // This is the container for the table to display all the information of the person or the company.
	private JTabbedPane baseAppletTabbedPane = new JTabbedPane(); // This is the main tabbed pane where all the GUI components resides.
	private ImageIcon imageIcon=null;	
        private URL urlOfImage=null;
               










                /*----------------------------------------------------------------------    
                 * Here I am declaring all the text fields which are used for displaying and
                 * enetering the information. The names of the text field specifies clearly the
                 * objective of it. All these text fields are awt text fields.
                 *----------------------------------------------------------------------    */
                
               	private TextField gotoCaseNumberTextField=new TextField(6);	
		private TextField parentCaseNumberTextField=new TextField(5);
		private TextField caseNumberTextField=new TextField(6);
		private TextField hoursTextField=new TextField(4);
		private TextField reportedByLastTextField=new TextField(18);
		private TextField reportedByFirstTextField=new TextField(18);
		private TextField emailAddressByTextField=new TextField(20);
		private TextField countryByTextField=new TextField(3);
		private TextField areaByTextField=new TextField(4);
		private TextField localByTextField=new TextField(6);
		private TextField extentionByTextField=new TextField(4);
		private TextField reportedForLastTextField=new TextField(18);
		private TextField reportedForFirstTextField=new TextField(18);
		private TextField emailAddressForTextField=new TextField(20);
		private TextField countryForTextField=new TextField(3);
		private TextField areaForTextField=new TextField(4);
		private TextField localForTextField=new TextField(6);
		private TextField extentionForTextField=new TextField(4);
		private TextField companyTextField=new TextField(18);
		private TextField assignedToLastTextField=new TextField(18);
		private TextField assignedToFirstTextField=new TextField(18);
		private TextField subjectTextField=new TextField(60);
		private TextField dueDateTextField=new TextField(10);
		private TextField resolutionTextField=new TextField(10);
	        private TextField alsoEmailTextField=new TextField(10);
               	private TextField enteredByNotesTextField=new TextField(15);
		private TextField dateEnteredNotesTextField=new TextField(15);
		private TextField subjectNotesTextField=new TextField(64);
		
                /*--------------------------------------------------------------------
                 * Here I am decalring all the text fields which are swing components.
                 *--------------------------------------------------------------------*/
                
                private JTextField statusEligibilityTextField=new JTextField(13);
                private JTextField availabilityEligibilityTextField=new JTextField(13);
                private JTextField sgpEligibilityTextField=new JTextField(13);
                private JTextField typeEligibilityTextField=new JTextField(13);
                private JTextField dateEnteredEligibilityTextField=new JTextField(14);
                private JTextField enteredByEligibilityTextField=new JTextField(14);
                private JTextField lastModifiedEligibilityTextField=new JTextField(14);
                private JTextField lastModifiedByEligibilityTextField=new JTextField(14);
                private JTextField dateClosedEligibilityTextField=new JTextField(14);
                
                /*--------------------------------------------------------------------
                 * There are only two text areas. Both for description. One for descrition of notes
                 * and other for decritption of case. The main reason for using awt instead of swing
                 * here is to get access to the system clipboard and enhance cut/paste facility.
                * --------------------------------------------------------------------*/
                
                private TextArea descriptionNotesTextArea=new TextArea("",7,65,TextArea.SCROLLBARS_VERTICAL_ONLY);
                private TextArea discriptionTextArea=new TextArea("",7,60,TextArea.SCROLLBARS_VERTICAL_ONLY);
                
                
                /*--------------------------------------------------------------------
                 * Here I am declaring all the ComboBoxes which are used for displaying and
                 * selecting the items. The names of the ComboBox specifies clearly the
                 * objective of it. All these ComboBoxes are awt components again.
                 *--------------------------------------------------------------------*/
                
                	
		private Choice emailDetailsComboBox = new Choice();
		private Choice visibilityComboBox = new Choice();
		private Choice siteComboBox = new Choice();
		private Choice marketplaceComboBox = new Choice();
		private Choice solutionComboBox = new Choice();
		private Choice serviceComboBox = new Choice();
		private Choice productLineComboBox = new Choice();
		private Choice productReleaseComboBox = new Choice();
		private Choice versionComboBox = new Choice();
		private Choice statusComboBox = new Choice();
		private Choice typeComboBox = new Choice();
		private Choice sourceComboBox = new Choice();
		private Choice severityComboBox = new Choice();
		private Choice priorityComboBox = new Choice();
		private Choice visibilityNotesComboBox = new Choice();
                
                
                /*--------------------------------------------------------------------
                 * There is only one check box on this GUI namely the billable check box.
                 * This specifies wether the particular case is billable or not. This is 
                 * a swing component.
                 *--------------------------------------------------------------------*/
		private JCheckBox billableCheckBox=new JCheckBox("Billable?");
		
		
                /*--------------------------------------------------------------------
                 * There are four swing buttons here. The objective of each of
                 * them can be well understood by the names of respective buttons.
                 *--------------------------------------------------------------------*/
                
		private JButton newButton;//=new JButton("New");
		private JButton saveButton;//=new JButton("Save");
	        private JButton newNotesButton;//=new JButton("New Note");
               	private JButton saveNotesButton;//=new JButton("Save Note");
                private JButton deleteNotesButton;
                private JButton saveAndEmailNotesButton;    
		
		
		GUI(JApplet baseApplet,String hostName,int portNumber,String personId){
                    
                    /*----------------------------------------------------------------------
                     * This is the constructer of the main GUI class. It takes four parameters namely
                     * a) baseApplet which is the mainApplet component.
                     * b) hostName which is the ipAddress of the JRun server fetched from the URL itself.
                     * c) portNumber which is the port number on which JRun server listens for the servlets connections.
                     * d) personId which is the personId of the person who has logged in.
                     * The first four lines of code just make these four variable global to this whole class.
                      ----------------------------------------------------------------------*/
                    
                    
			this.baseApplet=baseApplet;
                        this.hostName=hostName;
                        this.portNumber=portNumber;
                        globalLoggedInPersonId=personId;
                
                       
                        /*--------------------------------------------------------------------
                         * The following line just calls a method of this class which puts all
                         * the components in the appopiate place on the applet and displays it.
                         *--------------------------------------------------------------------*/
			buildGUI();
                        
                        /*--------------------------------------------------------------------
                         * The following two lines of code just makes thread which selects
                         * the tab number one on the tabbed pane. The reason for doing so is to get 
                         * all the components to fall back in place. For more information about this 
                         * go to SelectTab class.
                         *--------------------------------------------------------------------*/
                        SelectTab selectTab=new SelectTab(1,baseAppletTabbedPane);
                        selectTab.start();
                        
                        
                        /*--------------------------------------------------------------------
                         * The following line calls a method getLoggedInPersonInfo() which retrives 
                         * the information of the person who has logged in. It does so by sql statement.
                         * The information includes the email address, first name ,last name , rug information 
                         * and employye or not.
                         *--------------------------------------------------------------------*/
						//getLoggedInPersonInfo();
                        
                        /*--------------------------------------------------------------------
                         * This method is used for initializing some of the text fields and combo boxes
                         * to some default values. So know which values please see the method itself.
                         *--------------------------------------------------------------------*/
						initialize(false);
                        
                        /*--------------------------------------------------------------------
                         * This line calls another method which gets all the product names and the 
                         * product Ids and displays it in the Product Line combo box. The product Ids 
                         * are kept in global variable, not displyed. This is done by sql statement.
                        *-------------------------------------------------------------------- */
						//getProductLine();
                        
                        /*--------------------------------------------------------------------
                         * This method (getProductRelease) gets the product release for the selected 
                         * product. This is done by sql statement.
                         *--------------------------------------------------------------------*/
						//getProductRelease(productLineId[(2*productLineComboBox.getSelectedIndex()+fixedHeaderLength+2)]);
                        
                        /*--------------------------------------------------------------------
                         * This method gets all the version for the particular product release selected.
                         * This is done by sql statement.
                         *--------------------------------------------------------------------*/
						//getVersion((String)productReleaseComboBox.getSelectedItem());
                       
                        
                         /*--------------------------------------------------------------------
                         * The following two lines of code just makes thread which selects
                         * the tab number zero again on the tabbed pane. The reason for doing so is to get 
                         * all the components to fall back in place. For more information about this 
                         * go to SelectTab class.
                         *--------------------------------------------------------------------*/
                        SelectTab selectTab1=new SelectTab(0,baseAppletTabbedPane);
                        selectTab1.start();
			   
		
		}
		
		
		void buildGUI(){
		
	           /*----------------------------------------------------------------------
                         * This method simple calls two anohter methods makeInfoPanel() and
                         * makeNotesPanel() which bulids the graphical components on Information
                         * and notes tab respectively. Futher these two methods return a panel 
                         * which contains all the GUI components. These panels are added onto the
                         * tabbed pane and the tabbed pane is added in the applet.
                         *----------------------------------------------------------------------*/
                        
                        urlOfImage=getURL("info.gif");
                        imageIcon=new ImageIcon(urlOfImage);
                        baseAppletTabbedPane.addTab("Information",imageIcon,makeInfoPanel());
                        
                        urlOfImage=getURL("notes.gif");
                        imageIcon=new ImageIcon(urlOfImage);
                        baseAppletTabbedPane.addTab("Notes",imageIcon,makeNotesPanel());
                        baseApplet.getContentPane().add(baseAppletTabbedPane);
		
		
		}
		
		
		JPanel makeInfoPanel(){
                    	/*----------------------------------------------------------------------
                         * This mathod returns a JPanel which contain all the components in the information 
                         * tab. On the information tab there are futher seven panels which are described in
                         * the followin seven lines of code. The info panel is the main panel which is
                         * returned after all the Components have been addded on to it. The top panel 
                         * has the case information like case number, visibility, email detials etc.The middle 
                         * panel is  responsible for containing the user name and email etc information. Bottom
                         * panel contains the information regarding the product name ,status ,productline etc.
                         * The button panel exist on the top which conatins the button for saving and new.
                         * Last panel has information like status,availibility,SGP and type. The final last
                         * panel has components for date entered, enetered by etc.
                         ----------------------------------------------------------------------*/
                    
                        urlOfImage=getURL("new.gif");
                        imageIcon=new ImageIcon(urlOfImage);
                        newButton=new JButton("New",imageIcon);
                        newNotesButton=new JButton("New Note",imageIcon);
                        urlOfImage=getURL("save.gif");
                        imageIcon=new ImageIcon(urlOfImage);
                        saveButton=new JButton("Save",imageIcon);
                        saveNotesButton=new JButton("Save Note",imageIcon);
                        urlOfImage=getURL("trash.gif");
                        imageIcon=new ImageIcon(urlOfImage);
                        deleteNotesButton=new JButton("Delete Note",imageIcon);    
                        urlOfImage=getURL("email.gif");
                        imageIcon=new ImageIcon(urlOfImage);
                        saveAndEmailNotesButton=new JButton("Save Note and Email",imageIcon);    
	
                        
                    
                    
                    
			JPanel infoPanel=new JPanel(new GridBagLayout());
			JPanel topPanel=new JPanel(new GridBagLayout());
			JPanel middlePanel=new JPanel(new GridBagLayout());
			JPanel buttonPanel=new JPanel(new GridBagLayout());
			JPanel bottomPanel=new JPanel(new GridBagLayout());
                    	JPanel lastPanel=new JPanel(new GridBagLayout());
			JPanel lastFinalPanel=new JPanel(new GridBagLayout());
                        
                        
			GridBagConstraints gbc; 
                        /*----------------------------------------------------------------------
                         * The following lines of codes makes objects of all the labels which
                         * are supposed to be displayed on the information tab.
                         *----------------------------------------------------------------------*/
                        
			JLabel gotoCaseNumberLabel=new JLabel("     Goto Case # >>>");
			JLabel parentCaseNumberLabel=new JLabel("Parent Case #");
			JLabel caseNumberLabel=new JLabel("     Case #");
			JLabel hoursLabel=new JLabel("     Hours");
			JLabel emailDetailsLabel=new JLabel("     Email Details");
			JLabel visibilityLabel=new JLabel("     Visibility");
			JLabel emailAddressLabel=new JLabel("Email Address");
			JLabel countryLabel=new JLabel("Cntry");
			JLabel areaLabel=new JLabel("Area/City");
			JLabel localLabel=new JLabel("Local");
			JLabel extentionLabel=new JLabel("Ext");
			JLabel reportedByLastLabel=new JLabel("Reported By (Last)");
			JLabel reportedByFirstLabel=new JLabel("(First)");
			JLabel reportedForLastLabel=new JLabel("Reported For (Last)");
			JLabel reportedForFirstLabel=new JLabel("(First)");
			JLabel companyLabel=new JLabel("Company");
			JLabel siteLabel=new JLabel("Site");
			JLabel marketplaceLabel=new JLabel("Marketplace");
			JLabel assignedToLastLabel=new JLabel("Assigned To (Last)");
			JLabel assignedToFirstLabel=new JLabel("Assigned To (First)");
			JLabel solutionLabel=new JLabel("Solution");
			JLabel serviceLabel=new JLabel("Service");
			JLabel productLineLabel=new JLabel("Product Line");
			JLabel productReleaseLabel=new JLabel("Product Release");
			JLabel versionLabel=new JLabel("Version");
			JLabel statusLabel=new JLabel("Status");
			JLabel subjectLabel=new JLabel("Subject");
			JLabel typeLabel=new JLabel("Type");
			JLabel discriptionLabel=new JLabel("Description");
			JLabel sourceLabel=new JLabel("Source");
			JLabel severityLabel=new JLabel("Severity");
			JLabel priorityLabel=new JLabel("Priority");
			JLabel dueDateLabel=new JLabel("Due emailDate");
			JLabel resolutionLabel=new JLabel("Resolution");
                        JLabel alsoEmailLabel=new JLabel("Also Email");
			JLabel statusEligibilityLabel=new JLabel("Status");
	                JLabel availabilityEligibilityLabel=new JLabel("      Availability");
               	        JLabel sgpEligibilityLabel=new JLabel("      SGP");
   	 	        JLabel typeEligibilityLabel=new JLabel("      Type");
                        JLabel dateEnteredEligibilityLabel=new JLabel("Date Entered");
                        JLabel enteredByEligibilityLabel=new JLabel("Entered By");
                        JLabel lastModifiedEligibilityLabel=new JLabel("Modified By");
                        JLabel lastModifiedByEligibilityLabel=new JLabel("Last Modified By");
			JLabel dateClosedEligibilityLabel=new JLabel("Date Closed");
			
                        
                        /*----------------------------------------------------------------------
                         * The following lines of code just initializes the GUI componenst to dafault
                         * color and status (Enabled or not).
                         *----------------------------------------------------------------------*/
                        
	        caseNumberTextField.setEditable(false);
		caseNumberTextField.setBackground(Color.white);
		caseNumberTextField.setForeground(Color.gray);
		hoursLabel.setForeground(Color.red);
		emailDetailsLabel.setForeground(Color.red);
		reportedByLastLabel.setForeground(Color.red);
		reportedByFirstLabel.setForeground(Color.red);
		companyLabel.setForeground(Color.red);
		siteLabel.setForeground(Color.red);
		productLineLabel.setForeground(Color.red);
		productReleaseLabel.setForeground(Color.red);
		versionLabel.setForeground(Color.red);
		statusLabel.setForeground(Color.red);
		subjectLabel.setForeground(Color.red);
		typeLabel.setForeground(Color.red);
		discriptionLabel.setForeground(Color.red);
		sourceLabel.setForeground(Color.red);
		severityLabel.setForeground(Color.red);
                statusEligibilityTextField.setEditable(false);
                statusEligibilityTextField.setBackground(Color.white);
                statusEligibilityTextField.setForeground(Color.gray);
                availabilityEligibilityTextField.setEditable(false);
                availabilityEligibilityTextField.setBackground(Color.white);
                availabilityEligibilityTextField.setForeground(Color.gray);
                sgpEligibilityTextField.setEditable(false);
                sgpEligibilityTextField.setBackground(Color.white);
                sgpEligibilityTextField.setForeground(Color.gray);
                typeEligibilityTextField.setEditable(false);
                typeEligibilityTextField.setBackground(Color.white);
                typeEligibilityTextField.setForeground(Color.gray);
                dateEnteredEligibilityTextField.setEditable(false);
                dateEnteredEligibilityTextField.setBackground(Color.white);
                dateEnteredEligibilityTextField.setForeground(Color.gray);
                enteredByEligibilityTextField.setEditable(false);
                enteredByEligibilityTextField.setBackground(Color.white);
                enteredByEligibilityTextField.setForeground(Color.gray);
                lastModifiedEligibilityTextField.setEditable(false);
                lastModifiedEligibilityTextField.setBackground(Color.white);
                lastModifiedEligibilityTextField.setForeground(Color.gray);
                lastModifiedByEligibilityTextField.setEditable(false);
                lastModifiedByEligibilityTextField.setBackground(Color.white);
                lastModifiedByEligibilityTextField.setForeground(Color.gray);
                dateClosedEligibilityTextField.setEditable(false);
                dateClosedEligibilityTextField.setBackground(Color.white);
                dateClosedEligibilityTextField.setForeground(Color.gray);
                billableCheckBox.setForeground(dateClosedEligibilityLabel.getForeground());
                        
                        
                        
                       	
                       /*----------------------------------------------------------------------
                         * Here I am adding all the required items in the combo boxes. Some are hard 
                         * coded like visibility etc and some are retrived dynamically from the database
                         * queries like product line etc.
                         *----------------------------------------------------------------------*/
                        
			emailDetailsComboBox.addItem("Verbose");
			emailDetailsComboBox.addItem("None");
			
			visibilityComboBox.addItem("All");
			visibilityComboBox.addItem("Internal");
			visibilityComboBox.addItem("Rug");
                        
                      	visibilityNotesComboBox.addItem("All");
			visibilityNotesComboBox.addItem("Internal");
			visibilityNotesComboBox.addItem("Rug");
			
                        /*----------------------------------------------------------------------
                         * The following combo box is not displayed on the interface. If ever you need to display
                         * just add it on to middle panel.
                         *----------------------------------------------------------------------*/
                        
			 
                      	marketplaceComboBox.addItem("");
			marketplaceComboBox.addItem("TradeMatrix");
			marketplaceComboBox.addItem("ATT CanadaMarketplace");
			marketplaceComboBox.addItem("AutoMatrix");
			marketplaceComboBox.addItem("ChemicalsWorld.com");
			marketplaceComboBox.addItem("eServiceMatrix");
			marketplaceComboBox.addItem("e-gateMatrix");
			marketplaceComboBox.addItem("FrightMatrix");
			marketplaceComboBox.addItem("HitechMatrix");
			marketplaceComboBox.addItem("HomeElectronicsMatrix");
			marketplaceComboBox.addItem("IStarXchange");
			marketplaceComboBox.addItem("MyAircraft.com");
			marketplaceComboBox.addItem("SoftgoodsMatrix");
			marketplaceComboBox.addItem("N/A (Enterprise)");
			marketplaceComboBox.addItem("Other");
			
			
			statusComboBox.addItem("Open");
			statusComboBox.addItem("Cancelled");
			statusComboBox.addItem("Open - Implemenatation Team");
			statusComboBox.addItem("Open - Pending DTS");
			statusComboBox.addItem("Unassigned");
			statusComboBox.addItem("Closed");
			statusComboBox.addItem("Open - Pending Customer Input");
			statusComboBox.addItem("Open - Customer Verification");
			statusComboBox.addItem("Open - Pending Release");
			statusComboBox.addItem("Closed - Rejected");
			statusComboBox.addItem("Open - PM Review");
			
			typeComboBox.addItem("Documentation Question");
			typeComboBox.addItem("Enhancement Request");
			typeComboBox.addItem("FAQ");
			typeComboBox.addItem("How To");
			typeComboBox.addItem("Modeling Request");
			typeComboBox.addItem("Possible Defect");
			typeComboBox.addItem("Pre - Deployment");
			typeComboBox.addItem("System Issue");
			typeComboBox.addItem("Test Plan Issue");
			typeComboBox.addItem("License Key Request");
			typeComboBox.addItem("Web Logic Request");
			typeComboBox.addItem("Shipping Request");
			typeComboBox.addItem("Shipping Problem");
			typeComboBox.addItem("Feedback");
			typeComboBox.addItem("Alert");
			typeComboBox.addItem("Y2K Issue");
			typeComboBox.addItem("Vantive Login Request");
			typeComboBox.addItem("Matrix Login Request");
			typeComboBox.addItem("Upload Docs");
			typeComboBox.addItem("Implementation Issue");
			typeComboBox.addItem("PreSales Question");
			typeComboBox.addItem("Training");
			typeComboBox.addItem("Content Research Request");
			
			sourceComboBox.addItem("Phone");
			sourceComboBox.addItem("Email");
			sourceComboBox.addItem("Direct");
			sourceComboBox.addItem("Web");
			
			
			severityComboBox.addItem("S1 - Fatal");
			severityComboBox.addItem("S2 - Critical");
			severityComboBox.addItem("S3 - Important");
			severityComboBox.addItem("S4 - Minor");
			
			priorityComboBox.addItem("P1 - Now");
			priorityComboBox.addItem("P2 - High");
			priorityComboBox.addItem("P3 - Medium");
			priorityComboBox.addItem("P4 - Low");

                        /*----------------------------------------------------------------------
                         * The following two combo boxes are not displayed on the interface. If ever you need to display
                         * just add it on to middle panel. You donet even have to change the sql queries.
                         * This information is updated already through sql queries for the particular case.
                         * The only thing is that it is not added on the GUI for the resons well known to Veena or 
                         * Chris.
                         *----------------------------------------------------------------------*/
                        
			solutionComboBox.addItem("N/A (Enterprise)");
			solutionComboBox.addItem("Design");
			solutionComboBox.addItem("Buy");
			solutionComboBox.addItem("Plan");
			solutionComboBox.addItem("Sell");
			solutionComboBox.addItem("Fulfill");
			solutionComboBox.addItem("Service");
			solutionComboBox.addItem("Unknown");
			

			serviceComboBox.addItem("N/A (Enterprise)");
			serviceComboBox.addItem("Other");
			serviceComboBox.addItem("eProcurement");
			serviceComboBox.addItem("Customer Care");
			serviceComboBox.addItem("Product Development");
			serviceComboBox.addItem("Planning Services");
			serviceComboBox.addItem("Content Management");
			serviceComboBox.addItem("Commerce");
			serviceComboBox.addItem("eFullfilment");
			
                        /*----------------------------------------------------------------------
                         * In the following line of code I am adding action listener to text field and 
                         * buttons which require some action to be performed when ever user changes 
                         * information on these components.
                         * ----------------------------------------------------------------------*/
			
                        gotoCaseNumberTextField.addActionListener((ActionListener)this);
			reportedByLastTextField.addActionListener((ActionListener)this);
			reportedByFirstTextField.addActionListener((ActionListener)this);
			reportedForLastTextField.addActionListener((ActionListener)this);
			reportedForFirstTextField.addActionListener((ActionListener)this);
			assignedToLastTextField.addActionListener((ActionListener)this);
			assignedToFirstTextField.addActionListener((ActionListener)this);
			companyTextField.addActionListener((ActionListener)this);
			saveButton.addActionListener((ActionListener)this);
			newButton.addActionListener((ActionListener)this);
			
                        /*----------------------------------------------------------------------
                         * Here I am adding key listener to reported by last field. When ever user hits a 
                         * tab on this field then getNameTable method is called which displays all
                         * the people with specified last name. If once a query has been made with the 
                         * same name then if the user again hits the tab with the same name then the query 
                         * is not repeated. EIther he has to change the name or hit return. And once the user
                         * modifies this field then it disables other fields which are related to this one.
                         * Only when the user populates the data those other fields are enabled again.
                         *----------------------------------------------------------------------*/
			reportedByLastTextField.addKeyListener(new KeyListener() {
					public void keyTyped(KeyEvent e) {}
				    public void keyPressed(KeyEvent e) {
						if(e.getKeyCode()==KeyEvent.VK_TAB){
							newByLast=reportedByLastTextField.getText();
							if (!newByLast.equals(oldByLast)){
								getNameTable(newByLast,false,(short)1);
							}
							oldByLast=newByLast;
								
						}
						if(!keyPressedBy){
							if((e.getKeyCode()!=KeyEvent.VK_ALT)&&(e.getKeyCode()!=KeyEvent.VK_CAPS_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_CONTROL)&&(e.getKeyCode()!=KeyEvent.VK_COPY)&&(e.getKeyCode()!=KeyEvent.VK_DOWN)&&(e.getKeyCode()!=KeyEvent.VK_END)&&(e.getKeyCode()!=KeyEvent.VK_ENTER)&&(e.getKeyCode()!=KeyEvent.VK_ESCAPE)&&(e.getKeyCode()!=KeyEvent.VK_F1)&&(e.getKeyCode()!=KeyEvent.VK_F2)&&(e.getKeyCode()!=KeyEvent.VK_F3)&&(e.getKeyCode()!=KeyEvent.VK_F4)&&(e.getKeyCode()!=KeyEvent.VK_F5)&&(e.getKeyCode()!=KeyEvent.VK_F6)&&(e.getKeyCode()!=KeyEvent.VK_F7)&&(e.getKeyCode()!=KeyEvent.VK_F8)&&(e.getKeyCode()!=KeyEvent.VK_F9)&&(e.getKeyCode()!=KeyEvent.VK_F10)&&(e.getKeyCode()!=KeyEvent.VK_F11)&&(e.getKeyCode()!=KeyEvent.VK_F12)&&(e.getKeyCode()!=KeyEvent.VK_HOME)&&(e.getKeyCode()!=KeyEvent.VK_INSERT)&&(e.getKeyCode()!=KeyEvent.VK_LEFT)&&(e.getKeyCode()!=KeyEvent.VK_NUM_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_PAGE_DOWN)&&(e.getKeyCode()!=KeyEvent.VK_PAGE_UP)&&(e.getKeyCode()!=KeyEvent.VK_RIGHT)&&(e.getKeyCode()!=KeyEvent.VK_SHIFT)&&(e.getKeyCode()!=KeyEvent.VK_SCROLL_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_TAB)&&(e.getKeyCode()!=KeyEvent.VK_UP)){
								disableTextFields((short)0);
								keyPressedBy=true;
							
							}
						}
				   }
				   public void keyReleased(KeyEvent e) {}				   
				   			   
			});
                        
                        /*----------------------------------------------------------------------
                         * Here I am adding key listener to reported for last field. When ever user hits a 
                         * tab on this field then getNameTable method is called which displays all
                         * the people with specified last name. If once a query has been made with the 
                         * same name then if the user again hits the tab with the same name then the query 
                         * is not repeated. EIther he has to change the name or hit return. And once the user
                         * modifies this field then it disables other fields which are related to this one.
                         * Only when the user populates the data those other fields are enabled again.
                         *----------------------------------------------------------------------*/
			
                        
			reportedForLastTextField.addKeyListener(new KeyListener() {
					public void keyTyped(KeyEvent e) {}
				    public void keyPressed(KeyEvent e) {
						if (e.getKeyCode()==KeyEvent.VK_TAB){
							newForLast=reportedForLastTextField.getText();
							if (!newForLast.equals(oldForLast)){
								getNameTable(newForLast,false,(short)0);
							}
							oldForLast=newForLast;
							//getNameTable(reportedForLastTextField.getText(),false,(short)0);
						}
						if(!keyPressedFor){
							if((e.getKeyCode()!=KeyEvent.VK_ALT)&&(e.getKeyCode()!=KeyEvent.VK_CAPS_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_CONTROL)&&(e.getKeyCode()!=KeyEvent.VK_COPY)&&(e.getKeyCode()!=KeyEvent.VK_DOWN)&&(e.getKeyCode()!=KeyEvent.VK_END)&&(e.getKeyCode()!=KeyEvent.VK_ENTER)&&(e.getKeyCode()!=KeyEvent.VK_ESCAPE)&&(e.getKeyCode()!=KeyEvent.VK_F1)&&(e.getKeyCode()!=KeyEvent.VK_F2)&&(e.getKeyCode()!=KeyEvent.VK_F3)&&(e.getKeyCode()!=KeyEvent.VK_F4)&&(e.getKeyCode()!=KeyEvent.VK_F5)&&(e.getKeyCode()!=KeyEvent.VK_F6)&&(e.getKeyCode()!=KeyEvent.VK_F7)&&(e.getKeyCode()!=KeyEvent.VK_F8)&&(e.getKeyCode()!=KeyEvent.VK_F9)&&(e.getKeyCode()!=KeyEvent.VK_F10)&&(e.getKeyCode()!=KeyEvent.VK_F11)&&(e.getKeyCode()!=KeyEvent.VK_F12)&&(e.getKeyCode()!=KeyEvent.VK_HOME)&&(e.getKeyCode()!=KeyEvent.VK_INSERT)&&(e.getKeyCode()!=KeyEvent.VK_LEFT)&&(e.getKeyCode()!=KeyEvent.VK_NUM_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_PAGE_DOWN)&&(e.getKeyCode()!=KeyEvent.VK_PAGE_UP)&&(e.getKeyCode()!=KeyEvent.VK_RIGHT)&&(e.getKeyCode()!=KeyEvent.VK_SHIFT)&&(e.getKeyCode()!=KeyEvent.VK_SCROLL_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_TAB)&&(e.getKeyCode()!=KeyEvent.VK_UP)){
								disableTextFields((short)2);
								keyPressedFor=true;
							
							}
						}
				   }
				   public void keyReleased(KeyEvent e) {}				   
				   			   
			});
                        
                        /*----------------------------------------------------------------------
                         * Here I am adding key listener to assigned to field. When ever user hits a 
                         * tab on this field then getNameTable method is called which displays all
                         * the people with specified last name. If once a query has been made with the 
                         * same name then if the user again hits the tab with the same name then the query 
                         * is not repeated. EIther he has to change the name or hit return. And once the user
                         * modifies this field then it clears other fields which are related to this one.
                         * Only when the user populates the data those other fields are written again.
                         *----------------------------------------------------------------------*/
			
                        
			assignedToLastTextField.addKeyListener(new KeyListener() {
					public void keyTyped(KeyEvent e) {}
				    public void keyPressed(KeyEvent e) {
						if (e.getKeyCode()==KeyEvent.VK_TAB){
							newToLast=assignedToLastTextField.getText();
							if (!newToLast.equals(oldToLast)){
								getNameTable(newToLast,false,(short)2);
							}
							oldToLast=newToLast;
							//getNameTable(assignedToLastTextField.getText(),false,(short)2);
						}
						if(!keyPressedTo){
							if((e.getKeyCode()!=KeyEvent.VK_ALT)&&(e.getKeyCode()!=KeyEvent.VK_CAPS_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_CONTROL)&&(e.getKeyCode()!=KeyEvent.VK_COPY)&&(e.getKeyCode()!=KeyEvent.VK_DOWN)&&(e.getKeyCode()!=KeyEvent.VK_END)&&(e.getKeyCode()!=KeyEvent.VK_ENTER)&&(e.getKeyCode()!=KeyEvent.VK_ESCAPE)&&(e.getKeyCode()!=KeyEvent.VK_F1)&&(e.getKeyCode()!=KeyEvent.VK_F2)&&(e.getKeyCode()!=KeyEvent.VK_F3)&&(e.getKeyCode()!=KeyEvent.VK_F4)&&(e.getKeyCode()!=KeyEvent.VK_F5)&&(e.getKeyCode()!=KeyEvent.VK_F6)&&(e.getKeyCode()!=KeyEvent.VK_F7)&&(e.getKeyCode()!=KeyEvent.VK_F8)&&(e.getKeyCode()!=KeyEvent.VK_F9)&&(e.getKeyCode()!=KeyEvent.VK_F10)&&(e.getKeyCode()!=KeyEvent.VK_F11)&&(e.getKeyCode()!=KeyEvent.VK_F12)&&(e.getKeyCode()!=KeyEvent.VK_HOME)&&(e.getKeyCode()!=KeyEvent.VK_INSERT)&&(e.getKeyCode()!=KeyEvent.VK_LEFT)&&(e.getKeyCode()!=KeyEvent.VK_NUM_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_PAGE_DOWN)&&(e.getKeyCode()!=KeyEvent.VK_PAGE_UP)&&(e.getKeyCode()!=KeyEvent.VK_RIGHT)&&(e.getKeyCode()!=KeyEvent.VK_SHIFT)&&(e.getKeyCode()!=KeyEvent.VK_SCROLL_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_TAB)&&(e.getKeyCode()!=KeyEvent.VK_UP)){
								disableTextFields((short)4);
								keyPressedTo=true;
							
							}
						}
				   }
				   public void keyReleased(KeyEvent e) {}				   
				   			   
			});
                        
                        
                        /*----------------------------------------------------------------------
                         * Here I am adding key listener to reported by first field. When ever user hits a 
                         * tab on this field then getNameTable method is called which displays all
                         * the people with specified first name. If once a query has been made with the 
                         * same name then if the user again hits the tab with the same name then the query 
                         * is not repeated. EIther he has to change the name or hit return. And once the user
                         * modifies this field then it disables other fields which are related to this one.
                         * Only when the user populates the data those other fields are enabled again.
                         *----------------------------------------------------------------------*/
			
                        
			reportedByFirstTextField.addKeyListener(new KeyListener() {
					public void keyTyped(KeyEvent e) {}
				    public void keyPressed(KeyEvent e) {
						if (e.getKeyCode()==KeyEvent.VK_TAB){
							newByFirst=reportedByFirstTextField.getText();
							if (!newByFirst.equals(oldByFirst)){
								getNameTable(newByFirst,true,(short)1);
							}
							oldByFirst=newByFirst;
							//getNameTable(reportedByFirstTextField.getText(),true,(short)1);
						}
						if(!keyPressedBy){
							if((e.getKeyCode()!=KeyEvent.VK_ALT)&&(e.getKeyCode()!=KeyEvent.VK_CAPS_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_CONTROL)&&(e.getKeyCode()!=KeyEvent.VK_COPY)&&(e.getKeyCode()!=KeyEvent.VK_DOWN)&&(e.getKeyCode()!=KeyEvent.VK_END)&&(e.getKeyCode()!=KeyEvent.VK_ENTER)&&(e.getKeyCode()!=KeyEvent.VK_ESCAPE)&&(e.getKeyCode()!=KeyEvent.VK_F1)&&(e.getKeyCode()!=KeyEvent.VK_F2)&&(e.getKeyCode()!=KeyEvent.VK_F3)&&(e.getKeyCode()!=KeyEvent.VK_F4)&&(e.getKeyCode()!=KeyEvent.VK_F5)&&(e.getKeyCode()!=KeyEvent.VK_F6)&&(e.getKeyCode()!=KeyEvent.VK_F7)&&(e.getKeyCode()!=KeyEvent.VK_F8)&&(e.getKeyCode()!=KeyEvent.VK_F9)&&(e.getKeyCode()!=KeyEvent.VK_F10)&&(e.getKeyCode()!=KeyEvent.VK_F11)&&(e.getKeyCode()!=KeyEvent.VK_F12)&&(e.getKeyCode()!=KeyEvent.VK_HOME)&&(e.getKeyCode()!=KeyEvent.VK_INSERT)&&(e.getKeyCode()!=KeyEvent.VK_LEFT)&&(e.getKeyCode()!=KeyEvent.VK_NUM_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_PAGE_DOWN)&&(e.getKeyCode()!=KeyEvent.VK_PAGE_UP)&&(e.getKeyCode()!=KeyEvent.VK_RIGHT)&&(e.getKeyCode()!=KeyEvent.VK_SHIFT)&&(e.getKeyCode()!=KeyEvent.VK_SCROLL_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_TAB)&&(e.getKeyCode()!=KeyEvent.VK_UP)){
								disableTextFields((short)1);
								keyPressedBy=true;
							
							}
						}
				   }
				   public void keyReleased(KeyEvent e) {}				   
				   			   
			});
                        
                        /*----------------------------------------------------------------------
                         * Here I am adding key listener to reported for first field. When ever user hits a 
                         * tab on this field then getNameTable method is called which displays all
                         * the people with specified first name. If once a query has been made with the 
                         * same name then if the user again hits the tab with the same name then the query 
                         * is not repeated. EIther he has to change the name or hit return. And once the user
                         * modifies this field then it disables other fields which are related to this one.
                         * Only when the user populates the data those other fields are enabled again.
                         *----------------------------------------------------------------------*/
			
			reportedForFirstTextField.addKeyListener(new KeyListener() {
					public void keyTyped(KeyEvent e) {}
				    public void keyPressed(KeyEvent e) {
						if (e.getKeyCode()==KeyEvent.VK_TAB){
							newForFirst=reportedForFirstTextField.getText();
							if (!newForFirst.equals(oldForFirst)){
								getNameTable(newForFirst,true,(short)0);
							}
							oldForFirst=newForFirst;
							//getNameTable(reportedForFirstTextField.getText(),true,(short)0);
						}
						if(!keyPressedFor){
							if((e.getKeyCode()!=KeyEvent.VK_ALT)&&(e.getKeyCode()!=KeyEvent.VK_CAPS_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_CONTROL)&&(e.getKeyCode()!=KeyEvent.VK_COPY)&&(e.getKeyCode()!=KeyEvent.VK_DOWN)&&(e.getKeyCode()!=KeyEvent.VK_END)&&(e.getKeyCode()!=KeyEvent.VK_ENTER)&&(e.getKeyCode()!=KeyEvent.VK_ESCAPE)&&(e.getKeyCode()!=KeyEvent.VK_F1)&&(e.getKeyCode()!=KeyEvent.VK_F2)&&(e.getKeyCode()!=KeyEvent.VK_F3)&&(e.getKeyCode()!=KeyEvent.VK_F4)&&(e.getKeyCode()!=KeyEvent.VK_F5)&&(e.getKeyCode()!=KeyEvent.VK_F6)&&(e.getKeyCode()!=KeyEvent.VK_F7)&&(e.getKeyCode()!=KeyEvent.VK_F8)&&(e.getKeyCode()!=KeyEvent.VK_F9)&&(e.getKeyCode()!=KeyEvent.VK_F10)&&(e.getKeyCode()!=KeyEvent.VK_F11)&&(e.getKeyCode()!=KeyEvent.VK_F12)&&(e.getKeyCode()!=KeyEvent.VK_HOME)&&(e.getKeyCode()!=KeyEvent.VK_INSERT)&&(e.getKeyCode()!=KeyEvent.VK_LEFT)&&(e.getKeyCode()!=KeyEvent.VK_NUM_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_PAGE_DOWN)&&(e.getKeyCode()!=KeyEvent.VK_PAGE_UP)&&(e.getKeyCode()!=KeyEvent.VK_RIGHT)&&(e.getKeyCode()!=KeyEvent.VK_SHIFT)&&(e.getKeyCode()!=KeyEvent.VK_SCROLL_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_TAB)&&(e.getKeyCode()!=KeyEvent.VK_UP)){
								disableTextFields((short)3);
								keyPressedFor=true;
							
							}
						}
				   }
				   public void keyReleased(KeyEvent e) {}				   
				   			   
			});
                        
                        
                        /*----------------------------------------------------------------------
                         * Here I am adding key listener to assigned to first field. When ever user hits a 
                         * tab on this field then getNameTable method is called which displays all
                         * the people with specified first name. If once a query has been made with the 
                         * same name then if the user again hits the tab with the same name then the query 
                         * is not repeated. EIther he has to change the name or hit return. And once the user
                         * modifies this field then it disables other fields which are related to this one.
                         * Only when the user populates the data those other fields are enabled again.
                         *----------------------------------------------------------------------*/
                        
			assignedToFirstTextField.addKeyListener(new KeyListener() {
					public void keyTyped(KeyEvent e) {}
				    public void keyPressed(KeyEvent e) {
						if (e.getKeyCode()==KeyEvent.VK_TAB){
							newToFirst=assignedToFirstTextField.getText();
							if (!newToFirst.equals(oldToFirst)){
								getNameTable(newToFirst,true,(short)2);
							}
							oldToFirst=newToFirst;
							//getNameTable(assignedToFirstTextField.getText(),true,(short)2);
						}
						if(!keyPressedTo){
							if((e.getKeyCode()!=KeyEvent.VK_ALT)&&(e.getKeyCode()!=KeyEvent.VK_CAPS_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_CONTROL)&&(e.getKeyCode()!=KeyEvent.VK_COPY)&&(e.getKeyCode()!=KeyEvent.VK_DOWN)&&(e.getKeyCode()!=KeyEvent.VK_END)&&(e.getKeyCode()!=KeyEvent.VK_ENTER)&&(e.getKeyCode()!=KeyEvent.VK_ESCAPE)&&(e.getKeyCode()!=KeyEvent.VK_F1)&&(e.getKeyCode()!=KeyEvent.VK_F2)&&(e.getKeyCode()!=KeyEvent.VK_F3)&&(e.getKeyCode()!=KeyEvent.VK_F4)&&(e.getKeyCode()!=KeyEvent.VK_F5)&&(e.getKeyCode()!=KeyEvent.VK_F6)&&(e.getKeyCode()!=KeyEvent.VK_F7)&&(e.getKeyCode()!=KeyEvent.VK_F8)&&(e.getKeyCode()!=KeyEvent.VK_F9)&&(e.getKeyCode()!=KeyEvent.VK_F10)&&(e.getKeyCode()!=KeyEvent.VK_F11)&&(e.getKeyCode()!=KeyEvent.VK_F12)&&(e.getKeyCode()!=KeyEvent.VK_HOME)&&(e.getKeyCode()!=KeyEvent.VK_INSERT)&&(e.getKeyCode()!=KeyEvent.VK_LEFT)&&(e.getKeyCode()!=KeyEvent.VK_NUM_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_PAGE_DOWN)&&(e.getKeyCode()!=KeyEvent.VK_PAGE_UP)&&(e.getKeyCode()!=KeyEvent.VK_RIGHT)&&(e.getKeyCode()!=KeyEvent.VK_SHIFT)&&(e.getKeyCode()!=KeyEvent.VK_SCROLL_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_TAB)&&(e.getKeyCode()!=KeyEvent.VK_UP)){
								disableTextFields((short)5);
								keyPressedTo=true;
							
							}
						}
				   }
				   public void keyReleased(KeyEvent e) {}				   
				   			   
			});
                        
                        
                        /*----------------------------------------------------------------------
                         * Here I am adding key listener to company field. When ever user hits a 
                         * tab on this field then getCompanyTable method is called which displays all
                         * the companies with specified  name. If once a query has been made with the 
                         * same name then if the user again hits the tab with the same name then the query 
                         * is not repeated. EIther he has to change the name or hit return. 
                         *----------------------------------------------------------------------*/
                        
			companyTextField.addKeyListener(new KeyListener() {
					public void keyTyped(KeyEvent e) {}
				    public void keyPressed(KeyEvent e) {
						if (e.getKeyCode()==KeyEvent.VK_TAB){
							newCompany=companyTextField.getText();
							if (!newCompany.equals(oldCompany)){
								getCompanyTable();
							}
							oldCompany=newCompany;
							
						}
						if(!keyPressedCompany){
							if((e.getKeyCode()!=KeyEvent.VK_ALT)&&(e.getKeyCode()!=KeyEvent.VK_CAPS_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_CONTROL)&&(e.getKeyCode()!=KeyEvent.VK_COPY)&&(e.getKeyCode()!=KeyEvent.VK_DOWN)&&(e.getKeyCode()!=KeyEvent.VK_END)&&(e.getKeyCode()!=KeyEvent.VK_ENTER)&&(e.getKeyCode()!=KeyEvent.VK_ESCAPE)&&(e.getKeyCode()!=KeyEvent.VK_F1)&&(e.getKeyCode()!=KeyEvent.VK_F2)&&(e.getKeyCode()!=KeyEvent.VK_F3)&&(e.getKeyCode()!=KeyEvent.VK_F4)&&(e.getKeyCode()!=KeyEvent.VK_F5)&&(e.getKeyCode()!=KeyEvent.VK_F6)&&(e.getKeyCode()!=KeyEvent.VK_F7)&&(e.getKeyCode()!=KeyEvent.VK_F8)&&(e.getKeyCode()!=KeyEvent.VK_F9)&&(e.getKeyCode()!=KeyEvent.VK_F10)&&(e.getKeyCode()!=KeyEvent.VK_F11)&&(e.getKeyCode()!=KeyEvent.VK_F12)&&(e.getKeyCode()!=KeyEvent.VK_HOME)&&(e.getKeyCode()!=KeyEvent.VK_INSERT)&&(e.getKeyCode()!=KeyEvent.VK_LEFT)&&(e.getKeyCode()!=KeyEvent.VK_NUM_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_PAGE_DOWN)&&(e.getKeyCode()!=KeyEvent.VK_PAGE_UP)&&(e.getKeyCode()!=KeyEvent.VK_RIGHT)&&(e.getKeyCode()!=KeyEvent.VK_SHIFT)&&(e.getKeyCode()!=KeyEvent.VK_SCROLL_LOCK)&&(e.getKeyCode()!=KeyEvent.VK_TAB)&&(e.getKeyCode()!=KeyEvent.VK_UP)){
								disableTextFields((short)6);
								keyPressedCompany=true;
							
							}
						}
				   }
				   public void keyReleased(KeyEvent e) {}				   
				   			   
			});
			
                        
                        
                        /*----------------------------------------------------------------------
                         * Here I am adding focus listener to assigned to first field. When the user 
                         * changes the focus from this filed and this field along with assigned to last
                         * are empty then status is changes to Unassigned.
                         *----------------------------------------------------------------------*/
                        
			assignedToFirstTextField.addFocusListener(new FocusListener() {
				public void focusGained(FocusEvent e){
				}	
				public void focusLost(FocusEvent e){
                                    if((assignedToFirstTextField.getText().equals(""))&&(assignedToLastTextField.getText().equals(""))){
                                         statusComboBox.select("Unassigned");  
                                    }
				}
			});
			
                        /*----------------------------------------------------------------------
                         * Here I am adding focus listener to assigned to last field. When the user 
                         * changes the focus from this filed and this field along with assigned to first
                         * are empty then status is changes to Unassigned.
                         *----------------------------------------------------------------------*/
                        
			assignedToLastTextField.addFocusListener(new FocusListener() {
				public void focusGained(FocusEvent e){
				}	
				public void focusLost(FocusEvent e){
                                    if((assignedToLastTextField.getText().equals(""))&&(assignedToFirstTextField.getText().equals(""))){
                                         statusComboBox.select("Unassigned");  
                                    }
				}
			});
			
			
	          /*----------------------------------------------------------------------
                         * Here I am adding item listener to product line combo box. When the user 
                         * changes the item in this box getProductRelease and getVersion methods are 
                         * called which updates the product release and version combo boxes according
                         * to the chosen product.
                         *----------------------------------------------------------------------*/
			
	
			productLineComboBox.addItemListener(new ItemListener() {
			   
				public void itemStateChanged(ItemEvent e) {
					getProductRelease(productLineId[(2*productLineComboBox.getSelectedIndex()+fixedHeaderLength+2)]);
					getVersion((String)productReleaseComboBox.getSelectedItem());
				}
			});
			
                        
	          /*----------------------------------------------------------------------
                         * Here I am adding item listener to product release combo box. When the user 
                         * changes the item in this box getVersion method is called which updates version 
                         * combo box according to the chosen product release.
                         *----------------------------------------------------------------------*/
                        
			productReleaseComboBox.addItemListener(new ItemListener() {
			   
				public void itemStateChanged(ItemEvent e) {
					getVersion((String)productReleaseComboBox.getSelectedItem());
					
				}
			});
			
                        /*----------------------------------------------------------------------
                         * Here I am adding item listener to status combo box. When the user 
                         * changes the item to Unassigned then  assignedToLast and  assignedToFirst
                         * text fields are cleared. If the status changes to open the these fileds are
                         * set with logged in person name. If the status is changed to Close or Cancelled
                         * or Closed - Rejected then date closed field in the last final panel is set 
                         * to system date.
                         *----------------------------------------------------------------------*/
                        
                        statusComboBox.addItemListener(new ItemListener() {
			    public void itemStateChanged(ItemEvent e) {
                                String status=(String)statusComboBox.getSelectedItem();
				if(status.equals("Unassigned")){
                                    assignedToLastTextField.setText("");
                                    assignedToFirstTextField.setText("");
                                }
                                if((status.equals("Open"))&&(assignedToLastTextField.getText().equals(""))){
                                    assignedToLastTextField.setText(globalLoggedInLastName);
                                    assignedToFirstTextField.setText(globalLoggedInFirstName);
                                    globalEmailAddressTo=globalLoggedInEmailAddress;
                                    keyPressedTo=false;
                                }
                                if((status.equals("Cancelled"))||(status.equals("Closed"))||(status.equals("Closed - Rejected"))){
                                    //dateClosedEligibilityTextField.setText(getSystemDate());
                                    dateClosedEligibilityTextField.setText(getSystemDate()+" "+getSystemTime());
                                }else{
                                    dateClosedEligibilityTextField.setText("NONE");
                                }
                            }
			});
                        
                        /*----------------------------------------------------------------------
                         * Here I am adding key listener to goto case number field. When ever user hits a 
                         * tab on this field then fetchCaseInfo method is called which displays all
                         * information for this case.
                         *----------------------------------------------------------------------*/
                        
                        gotoCaseNumberTextField.addKeyListener(new KeyListener() {
                                    public void keyTyped(KeyEvent e) {}
				    public void keyPressed(KeyEvent e) {
                                        if (e.getKeyCode()==KeyEvent.VK_TAB){
						fetchCaseInfo();		
                                        }
				   }
				   public void keyReleased(KeyEvent e) {}				   
				   			   
			});
                        
                        
                        /*----------------------------------------------------------------------
                         * Here I am making a border for three panels which are visible on the inforamtion
                         * tab. Futhere I a setting the size oof all the panels in this tab. Please do not
                         * change these parameters as they will ruin the whole GUI.
                         *----------------------------------------------------------------------*/
                        
			Border raisedBevel = BorderFactory.createRaisedBevelBorder();
			Border loweredBevel = BorderFactory.createLoweredBevelBorder();
			Border compoundBorder=BorderFactory.createCompoundBorder(raisedBevel, loweredBevel);
			infoPanel.setSize(1450,550);
			buttonPanel.setSize(1450,50);
			topPanel.setSize(1450,100);
			middlePanel.setSize(1450,150);
			bottomPanel.setSize(1450,250);
                        lastPanel.setSize(1450,150);
                        lastFinalPanel.setSize(1450,100);
                        
			topPanel.setBorder(compoundBorder);
			middlePanel.setBorder(compoundBorder);
			bottomPanel.setBorder(compoundBorder);
                        lastPanel.setBorder(compoundBorder);
                            
                        /*----------------------------------------------------------------------
                         * Now I start  adding the components in the top panel. Since there is just one
                         * row in this panel I just vary the x cordinate only. Note changing these parameters
                         * will make effect on the position of these components on the information tab.
                         * Do so cautiously.
                         *----------------------------------------------------------------------*/
                        
		
			gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			topPanel.add(parentCaseNumberLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =1;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			topPanel.add(parentCaseNumberTextField,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =2;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			topPanel.add(caseNumberLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			topPanel.add(caseNumberTextField,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =4;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			topPanel.add(hoursLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =5;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
                        		topPanel.add(hoursTextField,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =6;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			topPanel.add(billableCheckBox,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =7;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			topPanel.add(emailDetailsLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =8;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			topPanel.add(emailDetailsComboBox,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =9;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			topPanel.add(visibilityLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =10;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			topPanel.add(visibilityComboBox,gbc);
			
			
			
			
                    /*----------------------------------------------------------------------
                         * Now I start  adding the components in the middle panel. There are five rows
                         * in this panel. After inseriting each row a commented dotted line exists which marks
                         * the end of that row. Note changing these parameters will make effect on 
                         * the position of these components on the information tab.
                         * Do so cautiously.
                         *----------------------------------------------------------------------*/
                        
			
			
			
			
			
			
			gbc = new GridBagConstraints();
			gbc.gridx =4;
			gbc.gridy=0;
			middlePanel.add(emailAddressLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =5;
			gbc.gridy=0;
			middlePanel.add(countryLabel,gbc);
	
			gbc = new GridBagConstraints();
			gbc.gridx =6;
			gbc.gridy=0;
			middlePanel.add(areaLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =7;
			gbc.gridy=0;
			middlePanel.add(localLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =8;
			gbc.gridy=0;
			middlePanel.add(extentionLabel,gbc);
			
			//------------------------------------
			
			gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=1;
			gbc.anchor=GridBagConstraints.EAST;
			middlePanel.add(reportedByLastLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =1;
			gbc.gridy=1;
			middlePanel.add(reportedByLastTextField,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =2;
			gbc.gridy=1;
			gbc.anchor=GridBagConstraints.EAST;
			middlePanel.add(reportedByFirstLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=1;
			middlePanel.add(reportedByFirstTextField,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =4;
			gbc.gridy=1;
			middlePanel.add(emailAddressByTextField,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =5;
			gbc.gridy=1;
			middlePanel.add(countryByTextField,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =6;
			gbc.gridy=1;
			middlePanel.add(areaByTextField,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =7;
			gbc.gridy=1;
			middlePanel.add(localByTextField,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =8;
			gbc.gridy=1;
			middlePanel.add(extentionByTextField,gbc);
			
			//----------------------------------------
			
			gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=2;
			gbc.anchor=GridBagConstraints.EAST;
			middlePanel.add(reportedForLastLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =1;
			gbc.gridy=2;
			middlePanel.add(reportedForLastTextField,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =2;
			gbc.gridy=2;
			gbc.anchor=GridBagConstraints.EAST;
			middlePanel.add(reportedForFirstLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=2;
			middlePanel.add(reportedForFirstTextField,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =4;
			gbc.gridy=2;
			middlePanel.add(emailAddressForTextField,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =5;
			gbc.gridy=2;
			middlePanel.add(countryForTextField,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =6;
			gbc.gridy=2;
			middlePanel.add(areaForTextField,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =7;
			gbc.gridy=2;
			middlePanel.add(localForTextField,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =8;
			gbc.gridy=2;
			middlePanel.add(extentionForTextField,gbc);
			
			//-------------------------------------------			
						
			gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=3;
			gbc.anchor=GridBagConstraints.EAST;
			middlePanel.add(companyLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =1;
			gbc.gridy=3;
			middlePanel.add(companyTextField,gbc);
			
			
			
			
			gbc = new GridBagConstraints();
			gbc.gridx =2;
			gbc.gridy=3;
			gbc.anchor=GridBagConstraints.EAST;
			middlePanel.add(siteLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=3;
			gbc.gridwidth=2;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			middlePanel.add(siteComboBox,gbc);
			
						
			//------------------------------------------
			
			gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=4;
			gbc.anchor=GridBagConstraints.EAST;
			middlePanel.add(assignedToLastLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =1;
			gbc.gridy=4;
			middlePanel.add(assignedToLastTextField,gbc);
			
			
			
			gbc = new GridBagConstraints();
			gbc.gridx =2;
			gbc.gridy=4;
			gbc.gridwidth=GridBagConstraints.REMAINDER;
			gbc.anchor=GridBagConstraints.WEST;
			middlePanel.add(assignedToFirstLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=4;
			gbc.gridwidth=GridBagConstraints.RELATIVE;
			middlePanel.add(assignedToFirstTextField,gbc);
						
				
                    /*----------------------------------------------------------------------
                         * Now I start  adding the components in the bottom panel. There are nine rows
                         * in this panel. After inseriting each row a commented dotted line exists which marks
                         * the end of that row. Note changing these parameters will make effect on 
                         * the position of these components on the information tab.
                         * Do so cautiously. Please note that here I am adding the components in a column wise
                         * manner. The purpose of doing so is to have the proper order of tabs.
                         *----------------------------------------------------------------------*/
                        
			
			
			gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=1;
			gbc.anchor=GridBagConstraints.EAST;
			bottomPanel.add(productLineLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =1;
			gbc.gridy=1;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			bottomPanel.add(productLineComboBox,gbc);
			
			
			//--------------------------------
			
			gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=2;
			gbc.anchor=GridBagConstraints.EAST;
			bottomPanel.add(productReleaseLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =1;
			gbc.gridy=2;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			bottomPanel.add(productReleaseComboBox,gbc);
			
			
			//--------------------------------
			
			gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=3;
			gbc.anchor=GridBagConstraints.EAST;
			bottomPanel.add(versionLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =1;
			gbc.gridy=3;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			bottomPanel.add(versionComboBox,gbc);
					
			
			
			//--------------------------------
			
                       		 gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=4;
			gbc.anchor=GridBagConstraints.EAST;
			bottomPanel.add(subjectLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =1;
			gbc.gridy=4;
			gbc.gridwidth=2;
			gbc.anchor=GridBagConstraints.WEST;
			bottomPanel.add(subjectTextField,gbc);
			
					
			
			//--------------------------
			
			gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=5;
			gbc.anchor=GridBagConstraints.EAST;
			bottomPanel.add(discriptionLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =1;
			gbc.gridy=5;
			gbc.gridheight=4;
			gbc.gridwidth=2;
			gbc.anchor=GridBagConstraints.WEST;
			bottomPanel.add(discriptionTextArea,gbc);
			
			
			
			//--------------------------------
			
			
			gbc = new GridBagConstraints();
			gbc.gridx =2;
			gbc.gridy=1;
			gbc.anchor=GridBagConstraints.EAST;
			bottomPanel.add(statusLabel,gbc);
						
			gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=1;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.gridwidth=2;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			bottomPanel.add(statusComboBox,gbc);
			
			
			gbc = new GridBagConstraints();
			gbc.gridx =2;
			gbc.gridy=2;
			gbc.anchor=GridBagConstraints.EAST;
			bottomPanel.add(typeLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=2;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.gridwidth=2;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			bottomPanel.add(typeComboBox,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =2;
			gbc.gridy=3;
			gbc.anchor=GridBagConstraints.EAST;
			bottomPanel.add(severityLabel,gbc);
			
			
			gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=3;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			gbc.gridwidth=2;
			bottomPanel.add(severityComboBox,gbc);			
			
			gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=4;
			gbc.anchor=GridBagConstraints.EAST;
			bottomPanel.add(priorityLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =4;
			gbc.gridy=4;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			bottomPanel.add(priorityComboBox,gbc);
			
			
			
			gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=5;
			gbc.anchor=GridBagConstraints.EAST;
			bottomPanel.add(sourceLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =4;
			gbc.gridy=5;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			bottomPanel.add(sourceComboBox,gbc);
			
						
			
			//--------------------------
			
				
			
			gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=6;
			gbc.anchor=GridBagConstraints.EAST;
			bottomPanel.add(dueDateLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =4;
			gbc.gridy=6;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			bottomPanel.add(dueDateTextField,gbc);
			
			//--------------------------------------
			
			gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=7;
			gbc.anchor=GridBagConstraints.EAST;
			bottomPanel.add(resolutionLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =4;
			gbc.gridy=7;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			bottomPanel.add(resolutionTextField,gbc);
			
			
                        //-------------------------------------------
                        
                       	 gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=8;
			gbc.anchor=GridBagConstraints.EAST;
			bottomPanel.add(alsoEmailLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =4;
			gbc.gridy=8;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			bottomPanel.add(alsoEmailTextField,gbc);
                        
                        
                        /*----------------------------------------------------------------------
                         * Now I start  adding the components in the last final panel. There are two rows
                         * in this panel. After inseriting each row a commented dotted line exists which marks
                         * the end of that row. Note changing these parameters will make effect on 
                         * the position of these components on the information tab.
                         * Do so cautiously.
                         *----------------------------------------------------------------------*/
                        
			
                        
               gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.CENTER;
			lastFinalPanel.add(dateEnteredEligibilityLabel,gbc);
                        
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =1;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.CENTER;
			lastFinalPanel.add(enteredByEligibilityLabel,gbc);
                        
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =2;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.CENTER;
			lastFinalPanel.add(lastModifiedEligibilityLabel,gbc);
                        
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.CENTER;
			lastFinalPanel.add(lastModifiedByEligibilityLabel,gbc);
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =4;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.CENTER;
			lastFinalPanel.add(dateClosedEligibilityLabel,gbc);
                        
                        //-----------------------------------------------------------
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=1;
			gbc.anchor=GridBagConstraints.EAST;
			lastFinalPanel.add(dateEnteredEligibilityTextField,gbc);
                        
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =1;
			gbc.gridy=1;
			gbc.anchor=GridBagConstraints.EAST;
			lastFinalPanel.add(enteredByEligibilityTextField,gbc);
                        
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =2;
			gbc.gridy=1;
			gbc.anchor=GridBagConstraints.EAST;
			lastFinalPanel.add(lastModifiedEligibilityTextField,gbc);
                        
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=1;
			gbc.anchor=GridBagConstraints.EAST;
			lastFinalPanel.add(lastModifiedByEligibilityTextField,gbc);
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =4;
			gbc.gridy=1;
			gbc.anchor=GridBagConstraints.EAST;
			lastFinalPanel.add(dateClosedEligibilityTextField,gbc);
                        
                        
                        
                        
                        
                        /*----------------------------------------------------------------------
                         * Now I start adding the components in the last panel. There is just one row
                         * in this panel. Note changing these parameters will make effect on 
                         * the position of these components on the information tab.
                         * Do so cautiously.
                         *----------------------------------------------------------------------*/
                        
			
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.EAST;
			lastPanel.add(statusEligibilityLabel,gbc);
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =1;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			lastPanel.add(statusEligibilityTextField,gbc);
                        
                       		 gbc = new GridBagConstraints();
			gbc.gridx =2;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.EAST;
			lastPanel.add(availabilityEligibilityLabel,gbc);
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			lastPanel.add(availabilityEligibilityTextField,gbc);
                        
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =4;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.EAST;
			lastPanel.add(sgpEligibilityLabel,gbc);
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =5;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			lastPanel.add(sgpEligibilityTextField,gbc);
                        
                       		 gbc = new GridBagConstraints();
			gbc.gridx =6;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.EAST;
			lastPanel.add(typeEligibilityLabel,gbc);
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =7;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			lastPanel.add(typeEligibilityTextField,gbc);
                        
                        //--------------------------------------------------
                        
                        
                        		gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=1;
                        		gbc.gridwidth=8;
			gbc.anchor=GridBagConstraints.WEST;
			lastPanel.add(lastFinalPanel,gbc);
                        
                        
                        
	         /*----------------------------------------------------------------------
                         * Now I start  adding the components in the button panel. There is just one row
                         * in this panel.  Note changing these parameters will make effect on 
                         * the position of these components on the information tab.
                         * Do so cautiously.
                         *----------------------------------------------------------------------*/
                        
			
			
			gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			buttonPanel.add(newButton,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =1;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			buttonPanel.add(saveButton,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =2;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			buttonPanel.add(gotoCaseNumberLabel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =3;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			buttonPanel.add(gotoCaseNumberTextField,gbc);
                        
                        
			
	         /*----------------------------------------------------------------------
                         * Now I start adding the components in the main info panel. The order of this 
                         * panel is very important as it displays all the group of components at the right
                         * location. Changing the cordinate will have very larger effect on the whole 
                         * GUI placements.
                         *----------------------------------------------------------------------*/
                        
			
			
			gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=0;
			gbc.anchor=GridBagConstraints.WEST;
			infoPanel.add(buttonPanel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=1;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			infoPanel.add(topPanel,gbc);
			
			gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=2;
			gbc.anchor=GridBagConstraints.WEST;
			infoPanel.add(middlePanel,gbc);

			gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=3;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			infoPanel.add(bottomPanel,gbc);			
			
			gbc = new GridBagConstraints();
			gbc.gridx =0;
			gbc.gridy=4;
			gbc.anchor=GridBagConstraints.WEST;
			gbc.fill=GridBagConstraints.HORIZONTAL;
			infoPanel.add(lastPanel,gbc);			
			
		return(infoPanel);
	}
	
	
	JPanel makeNotesPanel(){
         
            
            /*----------------------------------------------------------------------
             * This mathod returns a JPanel which contain all the components in the notes 
             * tab. On the notes tab there are futher two panels which are described in
             * the followin there lines of code. The notes panel is the main panel which is
             * returned after all the Components have been addded on to it. The top panel 
             * has the table which displays all the notes and the buttons for saving
             * and new.  Bottom panel contains the information regarding visibility,subject,
             * description etc.
             *----------------------------------------------------------------------*/
            
            JPanel notesPanel=new JPanel(new GridBagLayout());
            JPanel topPanel=new JPanel(new GridBagLayout());
            JPanel bottomPanel=new JPanel(new GridBagLayout());
            
            
            /*----------------------------------------------------------------------
            * The following lines of codes makes objects of all the labels which
            * are supposed to be displayed on the notes tab.
            *----------------------------------------------------------------------*/
            
            JLabel visibilityLabel=new JLabel("Visibility");
            JLabel enteredByLabel=new JLabel("  Entered By");
            JLabel dateEnteredLabel=new JLabel("  Date Entered");
            JLabel subjectLabel=new JLabel("Subject");
            JLabel noteLabel=new JLabel("Note");
            
            
            /*----------------------------------------------------------------------
            * The following lines of code just initializes the GUI componenst to dafault
            * color and status (Enabled or not).
            *----------------------------------------------------------------------*/
            
            subjectLabel.setForeground(Color.red);
            enteredByNotesTextField.setEditable(false);
            enteredByNotesTextField.setBackground(Color.white);
            enteredByNotesTextField.setForeground(Color.gray);
            dateEnteredNotesTextField.setEditable(false);
            dateEnteredNotesTextField.setBackground(Color.white);
            dateEnteredNotesTextField.setForeground(Color.gray);
            visibilityLabel.setForeground(Color.red);
            noteLabel.setForeground(Color.red);
		
            
            int i=0;
            int j=0;
            
            GridBagConstraints gbc; 
                     
            /*----------------------------------------------------------------------
            * The following lines of code adds actionlistener to the two buttons on this tab.
            *----------------------------------------------------------------------*/
            
            newNotesButton.addActionListener((ActionListener)this);
            saveNotesButton.addActionListener((ActionListener)this);
            deleteNotesButton.addActionListener((ActionListener)this);
            saveAndEmailNotesButton.addActionListener((ActionListener)this);
            
            
            /*----------------------------------------------------------------------
             * The following lines of code makes a JTable with specified column names
             * and initializes the string at each cell to empty. Futher it adds the table 
             * in the scroll pane and then set the size of each column.
             *----------------------------------------------------------------------*/
            
            String[] columnNames = {"Visibility","Subject","Entered By","Date Entered"};	
            String stringAtEachCellOfNotesTable[][]=new String[MAX][columnNames.length];
            for(i=0;i<MAX;i++){
                for(j=0;j<columnNames.length;j++){
                    stringAtEachCellOfNotesTable[i][j]="";
                }
            }
            
            MyTableModel myModel = new MyTableModel(columnNames,stringAtEachCellOfNotesTable);
            notesTable=new JTable(myModel);            
            JScrollPane scrollPaneForNotesTable = new JScrollPane(notesTable);
            notesTable.setPreferredScrollableViewportSize(new Dimension(700,200));		
            notesTable.addMouseListener((MouseListener)this);	
            notesTable.setGridColor(Color.blue);
            notesTable.setForeground(Color.gray);
            
            notesTable.getColumnModel().getColumn(0).setPreferredWidth(25);
            notesTable.getColumnModel().getColumn(1).setPreferredWidth(175);
            notesTable.getColumnModel().getColumn(2).setPreferredWidth(50);
            notesTable.getColumnModel().getColumn(3).setPreferredWidth(65);
            
            /*----------------------------------------------------------------------
             * Here I am adding the key listener to the notes table. And whenever arrow
             * keys (up and down only) are hit, setValuesForNotes method is called which 
             * displays the data in the bottom panel also.
             *----------------------------------------------------------------------*/
            
            notesTable.addKeyListener(new KeyListener() {
		public void keyTyped(KeyEvent e) {}
		public void keyPressed(KeyEvent e) {
                }
                public void keyReleased(KeyEvent e) {
                    if ((e.getKeyCode()==KeyEvent.VK_UP)||(e.getKeyCode()==KeyEvent.VK_DOWN)){
                        setValuesForNotes(notesTable.getSelectedRow());
                    }
                 }				   
		});
            
            
             /*----------------------------------------------------------------------
              * Now I start  adding the components in the top panel. There is just one 
              * row in this panel.  Note changing these parameters
              * will make effect on the position of these components on the notes tab.
              * Do so cautiously.
              *----------------------------------------------------------------------*/
               
            
            gbc = new GridBagConstraints();
            gbc.gridx =0;
            gbc.gridy=1;
            gbc.gridwidth=4;
            gbc.anchor=GridBagConstraints.WEST;
            topPanel.add(scrollPaneForNotesTable,gbc);
            
            gbc = new GridBagConstraints();
            gbc.gridx =0;
            gbc.gridy=0;
            gbc.anchor=GridBagConstraints.WEST;
            topPanel.add(newNotesButton,gbc);
            
            
            gbc = new GridBagConstraints();
            gbc.gridx =1;
            gbc.gridy=0;
            gbc.anchor=GridBagConstraints.WEST;
            topPanel.add(saveNotesButton,gbc);
            
            gbc = new GridBagConstraints();
            gbc.gridx =2;
            gbc.gridy=0;
            gbc.anchor=GridBagConstraints.WEST;
            topPanel.add(deleteNotesButton,gbc);
            
            gbc = new GridBagConstraints();
            gbc.gridx =3;
            gbc.gridy=0;
            gbc.anchor=GridBagConstraints.WEST;
            topPanel.add(saveAndEmailNotesButton,gbc);
            
            
            /*----------------------------------------------------------------------
              * Now I start  adding the components in the bottom panel. There are three 
              * rows in this panel.  After inseriting each row a commented dotted line 
              * exists which marks the end of that row. Note changing these parameters
              * will make effect on the position of these components on the notes tab.
              * Do so cautiously.
              *----------------------------------------------------------------------*/
             
            
            gbc = new GridBagConstraints();
            gbc.gridx =0;
            gbc.gridy=0;
            gbc.anchor=GridBagConstraints.EAST;
            bottomPanel.add(visibilityLabel,gbc);
            
            gbc = new GridBagConstraints();
            gbc.gridx =1;
            gbc.gridy=0;
            gbc.anchor=GridBagConstraints.WEST;
            bottomPanel.add(visibilityNotesComboBox,gbc);
                       
            gbc = new GridBagConstraints();
            gbc.gridx =2;
            gbc.gridy=0;
            gbc.anchor=GridBagConstraints.EAST;
            bottomPanel.add(enteredByLabel,gbc);
            
            gbc = new GridBagConstraints();
            gbc.gridx =3;
            gbc.gridy=0;
            gbc.anchor=GridBagConstraints.WEST;
            bottomPanel.add(enteredByNotesTextField,gbc);
            
            
            gbc = new GridBagConstraints();
            gbc.gridx =4;
            gbc.gridy=0;
            gbc.anchor=GridBagConstraints.EAST;
            bottomPanel.add(dateEnteredLabel,gbc);
            
            gbc = new GridBagConstraints();
            gbc.gridx =5;
            gbc.gridy=0;
            gbc.anchor=GridBagConstraints.WEST;
            bottomPanel.add(dateEnteredNotesTextField,gbc);
            
            
            
            //--------------------------------------------------------
            
            gbc = new GridBagConstraints();
            gbc.gridx =0;
            gbc.gridy=1;
            gbc.anchor=GridBagConstraints.EAST;
            bottomPanel.add(subjectLabel,gbc);
            
            
            gbc = new GridBagConstraints();
            gbc.gridx =1;
            gbc.gridy=1;
            gbc.gridwidth=5;
            gbc.anchor=GridBagConstraints.WEST;
            bottomPanel.add(subjectNotesTextField,gbc);
            
            
            //--------------------------------------------------------
            
            gbc = new GridBagConstraints();
            gbc.gridx =0;
            gbc.gridy=2;
            gbc.anchor=GridBagConstraints.NORTHEAST;
            bottomPanel.add(noteLabel,gbc);
            
            
            gbc = new GridBagConstraints();
            gbc.gridx =1;
            gbc.gridy=2;
            gbc.gridwidth=5;
            gbc.anchor=GridBagConstraints.WEST;
            bottomPanel.add(descriptionNotesTextArea,gbc);
            


            /*----------------------------------------------------------------------
             * Now I start  adding the components in the main notes panel. There are two 
             * rows in this panel.  After inseriting each row a commented dotted line 
             * exists which marks the end of that row. Changing the cordinate will have
             * very larger effect on the whole  GUI placements. Do so cautiously.
             *----------------------------------------------------------------------*/
             
            
            gbc = new GridBagConstraints();
            gbc.gridx =0;
            gbc.gridy=0;
            gbc.fill=GridBagConstraints.HORIZONTAL;
            gbc.anchor=GridBagConstraints.WEST;
            notesPanel.add(topPanel,gbc);
            
            gbc = new GridBagConstraints();
            gbc.gridx =0;
            gbc.gridy=1;
            gbc.anchor=GridBagConstraints.WEST;
            notesPanel.add(bottomPanel,gbc);
                        
            return(notesPanel);
	}	
        
        
    protected URL getURL(String filename){
        URL codeBase = baseApplet.getCodeBase();
        URL url = null;

        try {
            url = new URL(codeBase, filename);
        } catch (java.net.MalformedURLException e) {
            System.err.println("Couldn't create image: " +"badly specified URL");
            return null;
        }
    
        return url;
    }
    
	void displayTable(String stringAtEachCellOfGenericTable[][],String[] columnNamesOfGenericTable,int numberOfRows,int numberOfColumns){

            /*----------------------------------------------------------------------
             * This method displays a table which contains all the data regarding a people with
             * a particular name or regarding companies with particular name.
             * This method takes four parameters viz.
             * a) stringAtEachCellOfGenericTable[][] which is an 2 dimensional array that has all
             * the values of each cell in the table to be displayed.
             * b) columnNamesOfGenericTable is a arrat of string that has the column names for
             * this table.
             * c) numberOfRows is an integer that has the total number of rows to be displayed
             * in this table.
             *d) numberOfColumns is again an integer that has total number of column to be 
             * displayed in this table.
             * The table is displayed in a dialog box. So first three lines of the code
             * specifies that dialog box object and sets it's size and location.
             *----------------------------------------------------------------------*/

		
		dialogForTable=new JDialog();
		dialogForTable.setSize(800,300);
		dialogForTable.setLocation(200,300);
		int i=0;
		int j=0;
                
		String tempStringAtEachCellOfGenericTable[][]=new String[numberOfRows][numberOfColumns-2];
		String tempColumnNamesOfGenericTable[]=new String[numberOfColumns-2];
                
	/*----------------------------------------------------------------------
                 * The following if condition determines weather this is a person table or
                 * a company table. Since there are differnt columns in each table so different
                 * modifications are required.
                 * In the nested for do loop I am fetching all the string for each cell 
                 * that has been passed  down to this method. The reason if storing it in 
                 * temperary variable with two less than passes is that we dont want to display
                 * site id and customer id which is passed. So i just store those id's in global 
                 * array varibles and dont display them on the table. 
                 *----------------------------------------------------------------------*/
		if(columnNamesOfGenericTable[0].equals("Last Name")){
		
			for(i=0;i<numberOfRows;i++){
				for(j=0;j<(numberOfColumns-2);j++){
					tempStringAtEachCellOfGenericTable[i][j]=stringAtEachCellOfGenericTable[i][j];
			
				}
				
				
			}
		
			for(j=0;j<(numberOfColumns-2);j++){
				tempColumnNamesOfGenericTable[j]=columnNamesOfGenericTable[j];
			}
			globalStringAtEachCellOfGenericTable=stringAtEachCellOfGenericTable;
		}else{
			tempStringAtEachCellOfGenericTable=stringAtEachCellOfGenericTable;
			tempColumnNamesOfGenericTable=columnNamesOfGenericTable;
		}
		
                /*----------------------------------------------------------------------
                 * The following lines of code adds the sorting capability onthe table columns.
                 * TableSorter is the main class which does all this sorting. MyTableModel is
                 * another class that determines what parameters are to be assigned with this table
                 * like wether it should be editable or not. etc. For more information about these
                 * classes look in the classes itself.
                 *----------------------------------------------------------------------*/
                
                MyTableModel myModel = new MyTableModel(tempColumnNamesOfGenericTable,tempStringAtEachCellOfGenericTable);
                TableSorter sorter = new TableSorter(myModel);
                genericTable = new JTable(sorter);            
                sorter.addMouseListenerToHeaderInTable(genericTable);
		genericTable.addMouseListener((MouseListener)this);	
                genericTable.addKeyListener(new KeyListener(){
                    public void keyTyped(KeyEvent e){} 
                    public void keyPressed(KeyEvent e) {
                        if (e.getKeyCode()==KeyEvent.VK_ENTER){
                            if(tableCase.equals("name")){
                                doActionsWhenTableName();
                            }
		
                            if(tableCase.equals("company")){
                                doActionsWhenTableCompany();
                            }
					
                        }
                    }
                    public void keyReleased(KeyEvent e) {}
                });	
                
		genericTable.setGridColor(Color.blue);
		
                /*----------------------------------------------------------------------
                 * Here I am setting the exact width of each column in the table if table
                 * is for displaying the person information.
                 *----------------------------------------------------------------------*/
		
		if(columnNamesOfGenericTable[0].equals("Last Name")){
			for(i=0;i<(numberOfColumns-2);i++){
			   if((i==6)||(i==7)||(i==8))
			   		genericTable.getColumnModel().getColumn(i).setPreferredWidth(150);
			   else{
				   	if((i==2)||(i==3)||(i==5)){
						genericTable.getColumnModel().getColumn(i).setPreferredWidth(35);
					}else{
				  		genericTable.getColumnModel().getColumn(i).setPreferredWidth(75);
					}
                            }
			}
		}
		
                
	/*----------------------------------------------------------------------
                 * In the following lines of code I am making a scroll pane in which the 
                 * table is added, which in turn is added into the dialog box.
                 *----------------------------------------------------------------------*/
                JScrollPane scrollPaneFortable = new JScrollPane(genericTable);
		dialogForTable.getContentPane().add(scrollPaneFortable);
		dialogForTable.setVisible(true);

	
	}
	
	void disableTextFields(short byOrFor){
	/*----------------------------------------------------------------------
         * This method disables the text field according to particular conditions.
         * It takes only one parameter byOrFor which if 0 means reported By last text field 
         * is changed, if 1 means reported by  first text field  is changed,
         * if 2 means reported for last text field  is changed
         * if 3 means reported  for first text field is changed
         * if 4 means assigned to last text field  is changed
         * if 5 means assigned to first text field  is changed
         * and if 6 means company text field  is changed
         * different text fields are disabled when this variable has different value.
         *----------------------------------------------------------------------*/
            if((byOrFor==0)||(byOrFor==1)){
			emailAddressByTextField.setEditable(false);
			emailAddressByTextField.setBackground(Color.white);
			countryByTextField.setEditable(false);
			countryByTextField.setBackground(Color.white);
			areaByTextField.setEditable(false);
			areaByTextField.setBackground(Color.white);
			localByTextField.setEditable(false);
			localByTextField.setBackground(Color.white);
			extentionByTextField.setEditable(false);
			extentionByTextField.setBackground(Color.white);
			reportedForLastTextField.setEditable(false);
			reportedForLastTextField.setBackground(Color.white);
			reportedForFirstTextField.setEditable(false);
			reportedForFirstTextField.setBackground(Color.white);
			emailAddressForTextField.setEditable(false);
			emailAddressForTextField.setBackground(Color.white);
			countryForTextField.setEditable(false);
			countryForTextField.setBackground(Color.white);
			areaForTextField.setEditable(false);
			areaForTextField.setBackground(Color.white);
			localForTextField.setEditable(false);
			localForTextField.setBackground(Color.white);
			extentionForTextField.setEditable(false);
			extentionForTextField.setBackground(Color.white);
			companyTextField.setEditable(false);
			companyTextField.setBackground(Color.white);
			assignedToLastTextField.setEditable(false);
			assignedToLastTextField.setBackground(Color.white);
			assignedToFirstTextField.setEditable(false);
			assignedToFirstTextField.setBackground(Color.white);
			
			siteComboBox.removeAll();
			if(byOrFor==0){
				reportedByFirstTextField.setText("");
			}else{
				reportedByLastTextField.setText("");
			}
			
			reportedForLastTextField.setText("");
			reportedForFirstTextField.setText("");
			emailAddressByTextField.setText("");
			countryByTextField.setText("");
			areaByTextField.setText("");
			localByTextField.setText("");
			extentionByTextField.setText("");
			emailAddressForTextField.setText("");
			countryForTextField.setText("");
			areaForTextField.setText("");
			localForTextField.setText("");
			extentionForTextField.setText("");
			companyTextField.setText("");
	
	
		}
		
		if((byOrFor==2)||(byOrFor==3)){
		
			emailAddressForTextField.setEditable(false);
			emailAddressForTextField.setBackground(Color.white);
			countryForTextField.setEditable(false);
			countryForTextField.setBackground(Color.white);
			areaForTextField.setEditable(false);
			areaForTextField.setBackground(Color.white);
			localForTextField.setEditable(false);
			localForTextField.setBackground(Color.white);
			extentionForTextField.setEditable(false);
			extentionForTextField.setBackground(Color.white);
			
	
			
			siteComboBox.removeAll();

			if(byOrFor==2){
				reportedForFirstTextField.setText("");
			}else{
				reportedForLastTextField.setText("");
			}
			
			
			emailAddressForTextField.setText("");
			countryForTextField.setText("");
			areaForTextField.setText("");
			localForTextField.setText("");
			extentionForTextField.setText("");
			companyTextField.setText("");
		}
		
		if(byOrFor==4){
			assignedToFirstTextField.setText("");
		}
		if(byOrFor==5){
			assignedToLastTextField.setText("");
		}
		
		if(byOrFor==6){
			siteComboBox.removeAll();
		}
		
		
		
	
	}
	

	void clearTextFields(){
            
            /*----------------------------------------------------------------------
             * This method nither returns anything nor takes any parameter. Its main purpose
             * is to clear all the text fields on the applet. This method is called when we 
             * want to initialize the whole applet by clicking the new button or fetching 
             * a new case information.
             *----------------------------------------------------------------------*/
            
		int i=0;
                int j=0;
                gotoCaseNumberTextField.setText("");
		parentCaseNumberTextField.setText("");
		caseNumberTextField.setText("");
		hoursTextField.setText("");
                reportedByLastTextField.setText("");
		reportedByFirstTextField.setText("");
                emailAddressByTextField.setText("");
		countryByTextField.setText("");
		areaByTextField.setText("");
		localByTextField.setText("");
		extentionByTextField.setText("");
		reportedForLastTextField.setText("");
		reportedForFirstTextField.setText("");
		emailAddressForTextField.setText("");
		countryForTextField.setText("");
		areaForTextField.setText("");
		localForTextField.setText("");
		extentionForTextField.setText("");
		companyTextField.setText("");
		assignedToLastTextField.setText("");
		assignedToFirstTextField.setText("");
		subjectTextField.setText("");
		dueDateTextField.setText("");
		resolutionTextField.setText("");
                alsoEmailTextField.setText("");
                enteredByNotesTextField.setText(globalLoggedInFirstName+" "+globalLoggedInLastName);
                dateEnteredNotesTextField.setText("");
                subjectNotesTextField.setText("");
                statusEligibilityTextField.setText("");
                availabilityEligibilityTextField.setText("");
                sgpEligibilityTextField.setText("");
                typeEligibilityTextField.setText("");
                dateEnteredEligibilityTextField.setText("");
                enteredByEligibilityTextField.setText("");
                lastModifiedEligibilityTextField.setText("");
                lastModifiedByEligibilityTextField.setText("");
                dateClosedEligibilityTextField.setText("");
                
                billableCheckBox.setSelected(false);
		discriptionTextArea.setText("");
                descriptionNotesTextArea.setText("");
                for(i=0;i<MAX;i++){
                    for(j=0;j<4;j++){
                        notesTable.setValueAt("",i,j);
                    }
                }
                
		
	
	}
	
	void initialize(boolean flag){
            /*----------------------------------------------------------------------
             * This method returs nothing but takes one parameter flag which tells
             * wether to update the product line and product release combo box or not.
             * The man purpose of this method is to set initial values to some of the text 
             * fields. This initial value can be changed as per your requirements.
             * The second line of code calls a method getCaseNumber() which gets 
             * a new case number form the database. Evertime this method is called case 
             * number is automatically incremented.
             *----------------------------------------------------------------------*/
            
		String currentDate=getSystemDate();
		//getCaseNumber();
               	globalNumberOfNotes=0;
                globalNotes=null;
		oldByLast="";
		oldForLast="";
		oldToLast="";
		oldCompany="";
		oldByFirst="";
		oldForFirst="";
		oldToFirst="";
		newByLast="";
		newForLast="";
		newToLast="";
		newCompany="";
		newByFirst="";
		newForFirst="";
		newToFirst="";
		hoursTextField.setText("0.25");
                dateEnteredNotesTextField.setText(currentDate+" "+getSystemTime());
                assignedToLastTextField.setText(globalLoggedInLastName);
                assignedToFirstTextField.setText(globalLoggedInFirstName);
                
                dateEnteredEligibilityTextField.setText(currentDate+" "+getSystemTime());
                enteredByEligibilityTextField.setText(globalLoggedInFirstName+" "+globalLoggedInLastName);
                lastModifiedEligibilityTextField.setText(currentDate+" "+getSystemTime());
                lastModifiedByEligibilityTextField.setText(globalLoggedInFirstName+" "+globalLoggedInLastName);
                dateClosedEligibilityTextField.setText("NONE");
                
                globalEmailAddressTo=globalLoggedInEmailAddress;
                
                billableCheckBox.setSelected(false);
                emailDetailsComboBox.select("Verbose");
                visibilityComboBox.select("All");
               siteComboBox.removeAll(); 
                solutionComboBox.select("N/A (Enterprise)");
                serviceComboBox.select("N/A (Enterprise)");
                if(flag){
                    productLineComboBox.select("i2 Customer Support Website"); 
                    productReleaseComboBox.select("Esupport"); 
                }
                statusComboBox.select("Open");
                typeComboBox.select("Documentation Question");
                sourceComboBox.select("Phone");
                severityComboBox.select("S3 - Important");
                priorityComboBox.select("P4 - Low");
		
		
                /*----------------------------------------------------------------------
                 * Here we have some few dynamically updating fields which has to be 
                 * set enables or disabled as per the user inputs. In this method all those
                 * fields are being set disabled.
                 *----------------------------------------------------------------------*/
                
        emailAddressByTextField.setEditable(false);
	emailAddressByTextField.setBackground(Color.white);
	countryByTextField.setEditable(false);
	countryByTextField.setBackground(Color.white);
	areaByTextField.setEditable(false);
	areaByTextField.setBackground(Color.white);
	localByTextField.setEditable(false);
	localByTextField.setBackground(Color.white);
	extentionByTextField.setEditable(false);
	extentionByTextField.setBackground(Color.white);
	reportedForLastTextField.setEditable(false);
	reportedForLastTextField.setBackground(Color.white);
	reportedForFirstTextField.setEditable(false);
	reportedForFirstTextField.setBackground(Color.white);
	emailAddressForTextField.setEditable(false);
	emailAddressForTextField.setBackground(Color.white);
	countryForTextField.setEditable(false);
	countryForTextField.setBackground(Color.white);
	areaForTextField.setEditable(false);
	areaForTextField.setBackground(Color.white);
	localForTextField.setEditable(false);
	localForTextField.setBackground(Color.white);
	extentionForTextField.setEditable(false);
	extentionForTextField.setBackground(Color.white);
	companyTextField.setEditable(false);
	companyTextField.setBackground(Color.white);
	assignedToLastTextField.setEditable(false);
	assignedToLastTextField.setBackground(Color.white);
	assignedToFirstTextField.setEditable(false);
	assignedToFirstTextField.setBackground(Color.white);
               
        saveNotesButton.setEnabled(false);
        newNotesButton.setEnabled(false);
        deleteNotesButton.setEnabled(false);
        saveAndEmailNotesButton.setEnabled(false);
		
		
		
	
	
		
		
	}
	
        int getHeaderLength(String[] dataRecieved){
        /*----------------------------------------------------------------------
         * This is a very important method. Please dont change this method.
         * It calculates the exact header length of the http header from the server.
         * Different servers may have different header lengths as they have some
         * extra fileds in it. So the header length has to be retrived dynamically.
         * In JRun itself if the data is too large then a header field content length 
         * is omitted while if the data is small then this field is added. On every sql
         * query through the servlet, this method is called to retrive the updated length.
         * Finally it returns the header length. It takes the array of string as the 
         * parameter. This string is the one fetched completely through the socket connection.
         *----------------------------------------------------------------------*/
            
            int headerLength=0;
            while(!dataRecieved[headerLength].equals("")){
                //System.out.println(dataRecieved[headerLength]);
                headerLength++;
                
            }
            //System.out.println(dataRecieved[headerLength+1]);
            //System.out.println(dataRecieved[headerLength+2]);
            
            return(headerLength+1);
        }
        
        
        
	String[] genericConnection(String sqlQuery){
        /*----------------------------------------------------------------------
         * This method takes one parameter sqlQuery and returns an array od string.
         * The sqlQuery is the http form of the sql query which is supposed to be
         * sent to the servlet. This method first makes a socket connection to that servlet
         * and then sends the http header by calling the method sendPostHeader and 
         * then sends the actual data by calling the method sendData. This data is 
         * sent to the servlet which makes the database connection through jdbc-odbc
         * and sends the retrived data back. When the method recieveData is called all the data 
         * which has been sent by the servlet is recieved from the socket and returned 
         * from this method. Please do not change this method. directorySQL is the location and 
         * the name of the servlet which has to be called.
         *----------------------------------------------------------------------*/
                String[] dataRecieved;
		appletSocket= SendAndRecieve.makeSocketConnection(hostName,portNumber);
		try{
			//sendAndRecieve=new SendAndRecieve(new BufferedReader(new InputStreamReader(appletSocket.getInputStream())),new PrintStream(appletSocket.getOutputStream()));
                    sendAndRecieve=new SendAndRecieve(new BufferedReader(new InputStreamReader(appletSocket.getInputStream())),new PrintStream(appletSocket.getOutputStream()),hostName);
		}catch(IOException ioe){
			System.out.println("io exception "+ioe);
		}
               //System.out.println(sqlQuery);
		sendAndRecieve.sendPostHeader(directorySQL,sqlQuery.length());
		sendAndRecieve.sendData(sqlQuery);
		dataRecieved=sendAndRecieve.recieveData();
		return(dataRecieved);
	
	
	}
        
        String[] sendEmail(String emailAddress){
        /*----------------------------------------------------------------------
         * This method is not used. It is still here to add the functionality whenever 
         * needed. The whole purpose of this method is to call another servlet namely 
         * Email which uses i2 smtp server and sends the email through it. But this
         * funcion is already done by triggers in the evmailqueue table in the database.
         * So all what is being done now instead of this method is to insert records 
         * in the databse and the triggers does the rest. You can you use this method also
         * if reuired anytime.
         * This method takes one parameter sqlQuery and returns an array od string.
         * The email is the http form of the email which is supposed to be
         * sent to the servlet. This method first makes a socket connection to that servlet
         * and then sends the http header by calling the method sendPostHeader and 
         * then sends the actual data by calling the method sendData. This data is 
         * sent to the servlet which makes the  connection through smtp server at i2
         * and sends the retrived data back. When the method recieveData is called all the data 
         * which has been sent by the servlet is recieved from the socket and returned 
         * from this method. Please do not change this method. directoryEmail is the location and 
         * the name of the servlet which has to be called.
         *----------------------------------------------------------------------*/    
                String[] dataRecieved;
		appletSocket= SendAndRecieve.makeSocketConnection(hostName,portNumber);
		
		try{
			//sendAndRecieve=new SendAndRecieve(new BufferedReader(new InputStreamReader(appletSocket.getInputStream())),new PrintStream(appletSocket.getOutputStream()));
                    sendAndRecieve=new SendAndRecieve(new BufferedReader(new InputStreamReader(appletSocket.getInputStream())),new PrintStream(appletSocket.getOutputStream()),hostName);
		}catch(IOException ioe){
			System.out.println("io exception "+ioe);
		}
		sendAndRecieve.sendPostHeader(directoryEmail,emailAddress.length());
		sendAndRecieve.sendData(emailAddress);
		dataRecieved=sendAndRecieve.recieveData();
		return(dataRecieved);
	
	
	}
        
        String getSystemDate(){
        /*----------------------------------------------------------------------
         * This method as the name suggest takes no parameter and returns the system
         * date in the format dd-mmm-yyyy. If you are well aware of java date format
         * only then try to change this method.
         *----------------------------------------------------------------------*/
            String toReturn="";
            String temp="";
            Date systemDate=new Date();
            StringTokenizer tokenizerForDate=new StringTokenizer(systemDate.toString());
            temp=tokenizerForDate.nextToken();
            temp=tokenizerForDate.nextToken();
            toReturn=tokenizerForDate.nextToken();
            toReturn=toReturn+"-"+temp+"-";
            temp=tokenizerForDate.nextToken();
            temp=tokenizerForDate.nextToken();
            temp=tokenizerForDate.nextToken();
            if(temp.length()==3){
                temp="20"+temp.substring(1);
            }
            toReturn=toReturn+temp;
            return(toReturn);
            
        }
        
        String getSystemDay(){
         /*----------------------------------------------------------------------
         * This method as the name suggest takes no parameter and returns the system
         * day represented as an integer. If you are well aware of java date format
         * only then try to change this method.
         *----------------------------------------------------------------------*/
            Date systemDate=new Date();
            StringTokenizer tokenizerForDate=new StringTokenizer(systemDate.toString());
            return(tokenizerForDate.nextToken());
                      
        }
        
        String getSystemHour(){
        /*----------------------------------------------------------------------
         * This method  takes no parameter and returns the system 
         *  hours . If you are well aware of java date format
         * only then try to change this method.
         *----------------------------------------------------------------------*/
            Date systemDate=new Date();
            StringTokenizer tokenizerForDate=new StringTokenizer(systemDate.toString());
            tokenizerForDate.nextToken();
            tokenizerForDate.nextToken();
            tokenizerForDate.nextToken();
            StringTokenizer tokenizerForHour=new StringTokenizer(tokenizerForDate.nextToken(),":");
            return(tokenizerForHour.nextToken());
                      
        }
        
        String getSystemTime(){
        /*----------------------------------------------------------------------
         * This method  takes no parameter and returns the system 
         * time and hours ,minute and sec. If you are well aware of java date format
         * only then try to change this method.
         *----------------------------------------------------------------------*/
            Date systemDate=new Date();
            StringTokenizer tokenizerForDate=new StringTokenizer(systemDate.toString());
            tokenizerForDate.nextToken();
            tokenizerForDate.nextToken();
            tokenizerForDate.nextToken();
            //return(systemDate.getHours()+":"+systemDate.getMinutes()+":"+systemDate.getSeconds());
            return(tokenizerForDate.nextToken());
                      
        }
        
        
        
        String formatDate(String date){
        /*----------------------------------------------------------------------
         * This method  takes date as a parameter and returns the same date but in
         * different format. It takes date in mm-dd-yyyy time format and returns
         * date in dd-mmm-yyyy format.
         *----------------------------------------------------------------------*/
            
            
            int tempMonth=0;
            String day="";
            String month="";
            String year="";
            
            if(!date.equals("")){
                StringTokenizer tokenizerForDate=new StringTokenizer(date);
                StringTokenizer tempTokenizer=new StringTokenizer(tokenizerForDate.nextToken(),"-");
                
                if(tempTokenizer.countTokens()==3){
                    year=tempTokenizer.nextToken();
                    
                    month=tempTokenizer.nextToken();
                    day=tempTokenizer.nextToken();
                    if(checkInteger(month)){
                        tempMonth=Integer.parseInt(month);
                        if(tempMonth==1){
                            month="jan";
                            return(day+"-"+month+"-"+year);
                        }
                        if(tempMonth==2){
                            month="feb";
                            return(day+"-"+month+"-"+year);
                        }
                        if(tempMonth==3){
                            month="mar";
                            return(day+"-"+month+"-"+year);
                        }
                        if(tempMonth==4){
                            month="apr";
                            return(day+"-"+month+"-"+year);
                        }
                        if(tempMonth==5){
                            month="may";
                            return(day+"-"+month+"-"+year);
                        }
                        if(tempMonth==6){
                            month="jun";
                            return(day+"-"+month+"-"+year);
                        }
                        if(tempMonth==7){
                            month="jul";
                            return(day+"-"+month+"-"+year);
                        }
                        if(tempMonth==8){
                            month="aug";
                            return(day+"-"+month+"-"+year);
                        }
                        if(tempMonth==9){
                            month="sep";
                            return(day+"-"+month+"-"+year);
                        }
                        if(tempMonth==10){
                            month="oct";
                            return(day+"-"+month+"-"+year);
                        }
                        if(tempMonth==11){
                            month="nov";
                            return(day+"-"+month+"-"+year);
                        }
                        if(tempMonth==12){
                            month="dec";
                            return(day+"-"+month+"-"+year);
                        }
                        
                    }else{
                        return("");
                    }
                }else{
                    return("");
                }
               
            }else{
                return("");
            }
            return(date);
        }
        
	
        String formatDateWithTime(String date){
        /*----------------------------------------------------------------------
         * This method  takes date as a parameter and returns the same date but in
         * different format. It takes date in mm-dd-yyyy time format and returns
         * date in dd-mmm-yyyy time format.
         *----------------------------------------------------------------------*/
            
            int tempMonth=0;
            String day="";
            String month="";
            String year="";
            
            if(!date.equals("")){
                StringTokenizer tokenizerForDate=new StringTokenizer(date);
                StringTokenizer tempTokenizer=new StringTokenizer(tokenizerForDate.nextToken(),"-");
            
                if(tempTokenizer.countTokens()==3){
                    year=tempTokenizer.nextToken();
                    
                    month=tempTokenizer.nextToken();
                    day=tempTokenizer.nextToken();
                    if(checkInteger(month)){
                        tempMonth=Integer.parseInt(month);
                        if(tempMonth==1){
                            month="jan";
                            return(day+"-"+month+"-"+year+" "+tokenizerForDate.nextToken());
                        }
                        if(tempMonth==2){
                            month="feb";
                            return(day+"-"+month+"-"+year+" "+tokenizerForDate.nextToken());
                        }
                        if(tempMonth==3){
                            month="mar";
                            return(day+"-"+month+"-"+year+" "+tokenizerForDate.nextToken());
                        }
                        if(tempMonth==4){
                            month="apr";
                            return(day+"-"+month+"-"+year+" "+tokenizerForDate.nextToken());
                        }
                        if(tempMonth==5){
                            month="may";
                            return(day+"-"+month+"-"+year+" "+tokenizerForDate.nextToken());
                        }
                        if(tempMonth==6){
                            month="jun";
                            return(day+"-"+month+"-"+year+" "+tokenizerForDate.nextToken());
                        }
                        if(tempMonth==7){
                            month="jul";
                            return(day+"-"+month+"-"+year+" "+tokenizerForDate.nextToken());
                        }
                        if(tempMonth==8){
                            month="aug";
                            return(day+"-"+month+"-"+year+" "+tokenizerForDate.nextToken());
                        }
                        if(tempMonth==9){
                            month="sep";
                            return(day+"-"+month+"-"+year+" "+tokenizerForDate.nextToken());
                        }
                        if(tempMonth==10){
                            month="oct";
                            return(day+"-"+month+"-"+year+" "+tokenizerForDate.nextToken());
                        }
                        if(tempMonth==11){
                            month="nov";
                            return(day+"-"+month+"-"+year+" "+tokenizerForDate.nextToken());
                        }
                        if(tempMonth==12){
                            month="dec";
                            return(day+"-"+month+"-"+year+" "+tokenizerForDate.nextToken());
                        }
                        
                    }else{
                        return("");
                    }
                }else{
                    return("");
                }
               
            }else{
                return("");
            }
            return(date);
        }        
        
        
        
        
        String formatDateAsToDate(String date){
        /*----------------------------------------------------------------------
         * This method  takes date as a parameter and returns the same date but in
         * different format. It takes date in mm-dd-yyyy time format and returns
         * date in to_date(date,'mm/dd/yyyy') format. The reason for doing so is 
         * that on support dev the only way to insert the date in the database is in
         * this format which is a sql function call.
         *----------------------------------------------------------------------*/

            
            String toDateBegin="to_date('";
            String toDateEnd="','mm/dd/yyyy')";
            String day="";
            String month="";
            String year="";
            
            if(!date.equals("")){
                StringTokenizer tokenizerForDate=new StringTokenizer(date,"-");
                if(tokenizerForDate.countTokens()==3){
                    
                    day=tokenizerForDate.nextToken();
                    month=tokenizerForDate.nextToken();
                    year=tokenizerForDate.nextToken();
                    
                    if(month.toLowerCase().equals("jan")){
                        return((toDateBegin+"01/"+day+"/"+year+toDateEnd));
                    }
                    if(month.toLowerCase().equals("feb")){
                        return((toDateBegin+"02/"+day+"/"+year+toDateEnd));
                    }
                    if(month.toLowerCase().equals("mar")){
                        return((toDateBegin+"03/"+day+"/"+year+toDateEnd));
                    }
                    if(month.toLowerCase().equals("apr")){
                        return((toDateBegin+"04/"+day+"/"+year+toDateEnd));
                    }
                    if(month.toLowerCase().equals("may")){
                        return((toDateBegin+"05/"+day+"/"+year+toDateEnd));
                    }
                    if(month.toLowerCase().equals("jun")){
                        return((toDateBegin+"06/"+day+"/"+year+toDateEnd));
                    }
                    if(month.toLowerCase().equals("jul")){
                        return((toDateBegin+"07/"+day+"/"+year+toDateEnd));
                    }
                    if(month.toLowerCase().equals("aug")){
                        return((toDateBegin+"08/"+day+"/"+year+toDateEnd));
                    }
                    if(month.toLowerCase().equals("sep")){
                        return((toDateBegin+"09/"+day+"/"+year+toDateEnd));
                    }
                    if(month.toLowerCase().equals("oct")){
                        return((toDateBegin+"10/"+day+"/"+year+toDateEnd));
                    }
                    if(month.toLowerCase().equals("nov")){
                        return((toDateBegin+"11/"+day+"/"+year+toDateEnd));
                    }
                    if(month.toLowerCase().equals("dec")){
                        return((toDateBegin+"12/"+day+"/"+year+toDateEnd));
                    }
                    
                }
            }
            return(date);
        
        }
        
        
        
		void getCaseNumber(){
        /*----------------------------------------------------------------------
         * This method has no parameters and does not return anything. All it does is
         * makes a sql query to fetch next case number from the database. To see the sql query
         * look in to getCaseNumberQuery method in SQLQueries class. After fetching the 
         * case number it removes the period from the end and displays it on the case
         * number text field.
         *----------------------------------------------------------------------*/
	
		String[] dataRecieved;
		String sqlQuery="";

		sqlQuery="sqlHiddenField="+SQLQueries.getCaseNumberQuery()+"&numberHiddenField=1&numberOfResultsHiddenField=1"; 
		dataRecieved=genericConnection(sqlQuery);
		headerLength=getHeaderLength(dataRecieved);
		caseNumber=dataRecieved[headerLength+1];
                
		StringTokenizer tokenizerForCaseNumber=new StringTokenizer(caseNumber,".");		
		
		caseNumber=tokenizerForCaseNumber.nextToken();
		caseNumberTextField.setText(caseNumber);
		
	}
        
        String getWorkLogId(){	
	/*----------------------------------------------------------------------
         * This method has no parameters but returns a string. All it does is
         * makes a sql query to fetch next work log id from the database. To see the sql query
         * look in to getWorkLogIdQuery method in SQLQueries class. After fetching the 
         * work log id it removes the period from the end and returns the fetched
         * id.
         *----------------------------------------------------------------------*/
		
		String[] dataRecieved;
		String sqlQuery="";
                String workLogId="";
		sqlQuery="sqlHiddenField="+SQLQueries.getWorkLogIdQuery()+"&numberHiddenField=1&numberOfResultsHiddenField=1"; 
		dataRecieved=genericConnection(sqlQuery);
                
                headerLength=getHeaderLength(dataRecieved);
		workLogId=dataRecieved[headerLength+1];
		StringTokenizer tokenizerForworkLogId=new StringTokenizer(workLogId,".");		
		workLogId=tokenizerForworkLogId.nextToken();
		return(workLogId);
		
	}
        
        
	
	
	
	void getProductLine(){
         /*----------------------------------------------------------------------
          * This method has no parameters and doesnot return anything. All it does is
          * makes a sql query to fetch all the product names and product ids from the database.
          * To see the sql query look in to getProductLinesQuery method in SQLQueries class.
          * After fecthing all the product names it displays all of them in the product line 
          * combo box and also puts all the corresponding product name ans product ids 
          * in the global variable productLineId.
          *----------------------------------------------------------------------*/
	
		int lengthOfData=0;
		int i=0;
		String sqlQuery="";
		sqlQuery="sqlHiddenField="+SQLQueries.getProductLinesQuery()+"&numberHiddenField=1&numberOfResultsHiddenField=2"; 
		productLineId=genericConnection(sqlQuery);
                
                headerLength=getHeaderLength(productLineId);
                fixedHeaderLength=headerLength;
		if(checkInteger(productLineId[headerLength])){
                    lengthOfData=Integer.parseInt(productLineId[headerLength]);
                    for(i=headerLength+1;i<(lengthOfData+headerLength);i=i+2){
                    	productLineComboBox.addItem(productLineId[i]);
			
                    }
                    productLineComboBox.select("i2 Customer Support Website");
                }else{
                    alertMessage.displayMessages("No Product Line  for this case");
                }
		
	}
	
	void getProductRelease(String productLineId){
          /*----------------------------------------------------------------------
          * This method takes one parameters and doesnot return anything. All it does is
          * makes a sql query to fetch all the product release  from the database.
          * To see the sql query look in to getProductReleaseQuery method in SQLQueries class.
          * After fecthing all the product names it displays all of them in the product release 
          * combo box. 
          *----------------------------------------------------------------------*/
		int lengthOfData=0;
		int i=0;
		String[] dataRecieved;
		String sqlQuery="";
		sqlQuery="sqlHiddenField="+SQLQueries.getProductReleaseQuery(productLineId)+"&numberHiddenField=1&numberOfResultsHiddenField=1"; 
		dataRecieved=genericConnection(sqlQuery);
                headerLength=getHeaderLength(dataRecieved);
                if(checkInteger(dataRecieved[headerLength])){
                    lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
                    productReleaseComboBox.removeAll(); 
                    for(i=headerLength+1;i<(lengthOfData+headerLength);i++){
                    	productReleaseComboBox.addItem(dataRecieved[i]);
			
                    }
                }else{
                    alertMessage.displayMessages("No Product Release for this case");
                }
        }
	

	
	void getVersion(String productReleaseName){
         /*----------------------------------------------------------------------
          * This method takes one parameters and doesnot return anything. All it does is
          * makes a sql query to fetch all the versions  from the database.
          * To see the sql query look in to getVersionQuery method in SQLQueries class.
          * After fecthing all the versions it displays all of them in the version 
          * combo box. 
          *----------------------------------------------------------------------*/
	
            
                int lengthOfData=0;
		int i=0;
		String[] dataRecieved;
		String sqlQuery="";
		
			sqlQuery="sqlHiddenField="+SQLQueries.getVersionQuery(productReleaseName)+"&numberHiddenField=1&numberOfResultsHiddenField=1"; 
		
			dataRecieved=genericConnection(sqlQuery);
                        headerLength=getHeaderLength(dataRecieved);
                        if(checkInteger(dataRecieved[headerLength])){
                            lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
                            versionComboBox.removeAll(); 
                            for(i=headerLength+1;i<(lengthOfData+headerLength);i++){
			
                            	versionComboBox.addItem(dataRecieved[i]);
			
                            }
                        }
		
	}
        
	
        
        void getLoggedInPersonInfo(){
        /*----------------------------------------------------------------------
         * This method takes no parameters and doesnot return anything. The main 
         * purpose of this method is to fetch all the information of the person
         * who has logged in. The information includes email address, name, employee 
         * or not. All this information is stored in the global variables so that
         * they can be accessed from anywhere in this class.Futher it calls another
         * method  setRugInfo which itself retrives  some more information regarding
         * this person. For detalis look at  setRugInfo method. 
         *----------------------------------------------------------------------*/
	
            
            String sqlQuery="sqlHiddenField="+SQLQueries.getLoggedInPersonInfoQuery(globalLoggedInPersonId)+"&numberHiddenField=1&numberOfResultsHiddenField=4"; 
            String dataRecieved[];
            int lengthOfData=0;
            
            dataRecieved=genericConnection(sqlQuery);
            headerLength=getHeaderLength(dataRecieved);
             if(checkInteger(dataRecieved[headerLength])){
                lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
                if(lengthOfData==5){
                
                    globalLoggedInEmailAddress=dataRecieved[headerLength+1];
                    globalLoggedInFirstName=dataRecieved[headerLength+2];
                    globalLoggedInLastName=dataRecieved[headerLength+3];
                    globalLoggedInEmployeeFlag=dataRecieved[headerLength+4];
                    
                    enteredByNotesTextField.setText(globalLoggedInFirstName+" "+globalLoggedInLastName);
                    setRugInfo();
                }
             }
                            
        }
        
        void setRugInfo(){	
	/*----------------------------------------------------------------------
         * This method takes no parameters and doesnot return anything. The main 
         * purpose of this method is to fetch rug information of the person
         * who has logged in. This rug information is stored in the global variable so that
         * they can be accessed from anywhere in this class.
         *----------------------------------------------------------------------*/
		
		String[] dataRecieved;
		String sqlQuery="";
                sqlQuery="sqlHiddenField="+SQLQueries.getRugQuery(globalLoggedInPersonId)+"&numberHiddenField=1&numberOfResultsHiddenField=1"; 
		dataRecieved=genericConnection(sqlQuery);
                
                headerLength=getHeaderLength(dataRecieved);
		globalLoggedInRugMember=dataRecieved[headerLength+1];
        
		
		
	}
        
        void getNotes(String caseNumber){
         /*----------------------------------------------------------------------
          * This method takes one parameter and doesnot return anything. The main 
          * purpose of this method is to fetch all the notes information for a particular
          * caseNumber which is the input parameter for this method. It first gets the notes 
          * information without the description using sql query. For more information about that
          * query look into getNotesQuery method of SQLQueries class. Then it displays all
          * that information on the table in the notes tab. It keeps all the work log id
          * in the global variable and does not displays that information. After that this
          * method fetches all the descriptions for each note for that caseNumber. Now
          * to make distintion between different notes, I have inserted a delimeter
          * "vantiveDelimeter" in between ever note's description while sending it through
          * the servlet. This task is done bythe servlet. Whenever I get that delimeter I can judge
          * that I have recieved one description for a note. It aslo stores that information in the
          * global array of string.
          *----------------------------------------------------------------------*/
	
                int lengthOfData=0;
                int rowCount=0;
                int columnCount=0;
                int count=0;
                int i=0;
                int j=0;
                boolean doNotContinue=false;
		String[] dataRecieved;
                
		String sqlQuery="";
                
                
                
		sqlQuery="sqlHiddenField="+SQLQueries.getNotesQuery(caseNumber)+"&numberHiddenField=1&numberOfResultsHiddenField=5"; 
		dataRecieved=genericConnection(sqlQuery);
                headerLength=getHeaderLength(dataRecieved);
                if(checkInteger(dataRecieved[headerLength])){
                    
                    lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
                    if(lengthOfData>1){
                        globalWorkLogId=new String[(lengthOfData/5)];
                        for(i=headerLength+1;i<(lengthOfData+headerLength);i++){
                            doNotContinue=false;
                            if((columnCount==0)&&(!globalLoggedInEmployeeFlag.equals("1"))){
                                if(dataRecieved[i].equals("Internal")){
                                    doNotContinue=true;
                                    i=i+4; // Bacause one is automatically is incemented
                                }
                            }
                            if(!doNotContinue){
                                if((columnCount==0)&&(globalLoggedInRugMember.equals("0"))){
                                if(dataRecieved[i].equals("Rug")){
                                        doNotContinue=true;
                                        i=i+4; // Bacause one is automatically is incemented
                                    }
                                }
                            }
                        
                        
                            if(!doNotContinue){
                            
                            
                                if(columnCount==3){
                                    notesTable.setValueAt(formatDateWithTime(dataRecieved[i]),rowCount,columnCount);
                                }else{
                                    notesTable.setValueAt(dataRecieved[i],rowCount,columnCount);
                                }
                                columnCount++;
                                if(columnCount==4){
                                    columnCount=0;
                                    globalWorkLogId[rowCount]=dataRecieved[i+1];
                                    rowCount++;
                                    i++;
                                    
                                }
                            }
                        }
                    }
                
                    sqlQuery="sqlHiddenField="+SQLQueries.getNotesSubjectQuery(caseNumber)+"&numberHiddenField=3&numberOfResultsHiddenField=1"; 
                    dataRecieved=genericConnection(sqlQuery);
                    headerLength=getHeaderLength(dataRecieved);
                    if(checkInteger(dataRecieved[headerLength])){
                        lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
                        j=headerLength;
                        globalNotes=new String[lengthOfData];
                        globalNumberOfNotes=lengthOfData-1;
                    
                        for(i=headerLength+1;i<(lengthOfData+headerLength);i++){
                            globalNotes[count]="";
                            do{
                                j++;
                        
                                globalNotes[count]=globalNotes[count]+dataRecieved[j]+"\n";
                            }while(dataRecieved[j].indexOf("vantiveDelimeter")==-1);
                        
                            globalNotes[count]=globalNotes[count].substring(0,globalNotes[count].indexOf("vantiveDelimeter"));
                            count++;
                        }
                    }
                    dateEnteredNotesTextField.setText(getSystemDate()+" "+getSystemTime());
                
                }else{
                    newOrOldNotes=true;
                }
				
	}
		
	void setValuesForNotes(int rowNumber){
        /*----------------------------------------------------------------------
         * This method takes one parameters and doesnot return anything. The parameter
         * indcates which row number of the notes table is selected. Whenever this
         * method is called the information from that row in the table is also displayed
         * on the text fields including the description for that note.
         *----------------------------------------------------------------------*/
	
            if(rowNumber<globalNumberOfNotes){
                String date="";
                if(!(date=(String)notesTable.getValueAt(rowNumber,3)).equals("")){
                    //StringTokenizer tokenizerForDate=new StringTokenizer(date);
                    visibilityNotesComboBox.select((String)notesTable.getValueAt(rowNumber,0));
                    enteredByNotesTextField.setText((String)notesTable.getValueAt(rowNumber,2));
                    //dateEnteredNotesTextField.setText(tokenizerForDate.nextToken());
                    dateEnteredNotesTextField.setText(date);
                    subjectNotesTextField.setText((String)notesTable.getValueAt(rowNumber,1));
                    descriptionNotesTextArea.setText(globalNotes[rowNumber]);
                    newOrOldNotes=false;
                }
            }
        }
		
		
	
	
	void getCompanyAndSite(String siteId,String customerId){
         /*----------------------------------------------------------------------
          * This method takes two parameters and doesnot return anything. The main 
          * purpose of this method is to fetch the company and the site for the particular
          * case using the siteid and customer id which are passed as the parameters
          * in this method. For information about the queries about for company and site 
          * look in to getCompanyQuery and getSiteQuery in SQLQueries class. After
          * feteching this information it is also displayed on the company text field
          * and site combo box.
          *----------------------------------------------------------------------*/
	
            
		int i=0;
		int lengthOfData=0;
		String sqlQuery="";
		String[] dataRecieved;
		String itemValueZero="";
		
		sqlQuery="sqlHiddenField="+SQLQueries.getCompanyQuery(siteId)+"&numberHiddenField=1&numberOfResultsHiddenField=2"; 
		dataRecieved=genericConnection(sqlQuery);
                headerLength=getHeaderLength(dataRecieved);
		if(!dataRecieved[headerLength+2].equals("null")){
			companyTextField.setText(dataRecieved[headerLength+2]);
		}
		siteComboBox.removeAll(); 
         	siteComboBox.addItem(dataRecieved[headerLength+1]);
		
		sqlQuery="sqlHiddenField="+SQLQueries.getSitesQuery(customerId)+"&numberHiddenField=1&numberOfResultsHiddenField=1"; 
		
		dataRecieved=genericConnection(sqlQuery);
                headerLength=getHeaderLength(dataRecieved);
                if(checkInteger(dataRecieved[headerLength])){
                    lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
                    itemValueZero=(String)siteComboBox.getItem(0);
                    for(i=headerLength+1;i<(lengthOfData+headerLength);i++){
                    	if (!(itemValueZero.equals(dataRecieved[i]))){
                    		siteComboBox.addItem(dataRecieved[i]);
                    	}		
                    }
                    
                    setEligibilityCompanyFields(customerId);
                }
	}
	
	
	void getNameTable(String Name,boolean firstOrLast,short byOrForFlagValue){
         /*----------------------------------------------------------------------
          * This method takes three parameters and doesnot return anything. All it does
          * is to make sql queries regarding the first name or last name of the person
          * and display all the information about those person in the table. The displaying
          * of information is done by another method called displayTable. The first parameter 
          * tells the name on which the sql query has to be made. The second parameter tells 
          * weather it is a query for last name or first name. The last parameter tells
          * weather this query is made for reported by, reported for or assigned to.
          * The first 3 lines of the code just displays a timer frame which tell the user
          * to wait while data is being fetched. The last line of the code kills the thread 
          * which displays this timer farme
          *----------------------------------------------------------------------*/
	
		if(!Name.equals("")){
                        TimerMessage timerMessage=new TimerMessage();
                        timerMessage.displayMessages("Executing your query to find all the people with this name..");
                        timerMessage.start();
                        
			int i=0;
			int j=0;
			int lengthOfData=0;
			int numberOfRows=0;
			int numberOfColumns=0;
			int count=headerLength+1;
			byOrForFlag=byOrForFlagValue;
			

			String[] dataRecieved;
			String sqlQuery="";
			
			String[] columnNames = {"Last Name","First Name","Country","Area","Phone","Extension","Email Address","Company","Site Name","Email User Type","Site ID","Customer ID"};	
			numberOfColumns=columnNames.length;
		
							
			if (!firstOrLast){				
				sqlQuery="sqlHiddenField="+SQLQueries.getLastNameQuery(Name)+"&numberHiddenField=1&numberOfResultsHiddenField=12"; 
			}else{
				sqlQuery="sqlHiddenField="+SQLQueries.getFirstNameQuery(Name)+"&numberHiddenField=1&numberOfResultsHiddenField=12"; 
			}
			dataRecieved=genericConnection(sqlQuery);
                        
                        headerLength=getHeaderLength(dataRecieved);
                        count=headerLength+1;
                        if(checkInteger(dataRecieved[headerLength])){
                            lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
                            numberOfRows=(lengthOfData-1)/numberOfColumns;
                            String stringAtEachCell[][]=new String[numberOfRows][numberOfColumns];
                            for(i=0;i<numberOfRows;i++){
                            	for(j=0;j<numberOfColumns;j++){
                            		if(!dataRecieved[count].equals("null")){
                            			stringAtEachCell[i][j]=dataRecieved[count];
                            		}else{
                            			stringAtEachCell[i][j]="";
                            		}
				
					count++;
				}

                            }
                        
                            noOfColumnsInGenericTable=numberOfColumns;
                            tableCase="name";	
                            displayTable(stringAtEachCell,columnNames,numberOfRows,numberOfColumns);
                        }
                        timerMessage.disposeTimer();
                        
                }
	}
	
	void getCompanyTable(){
         /*----------------------------------------------------------------------
          * This method takes no parameters and doesnot return anything. All it does
          * is to make sql queries regarding the company name  the companies
          * and display all the information about those companies in the table. The displaying
          * of information is done by another method called displayTable.
          * The first 3 lines of the code just displays a timer frame which tell the user
          * to wait while data is being fetched. The last line of the code kills the thread 
          * which displays this timer farme
          *----------------------------------------------------------------------*/
	
            if(!companyTextField.getText().equals("")){
                TimerMessage timerMessage=new TimerMessage();
                timerMessage.displayMessages("Executing your query to find all the companies with this name..");
                timerMessage.start();
                        
                int i=0;
		int j=0;
		int lengthOfData=0;
		int numberOfRows=0;
		int numberOfColumns=0;
		int count=headerLength+1;
                int countId=0;
		String[] dataRecieved;
		String sqlQuery="";
		String[] columnNames = {"Company Name","Type","Status"};	
                
                
		numberOfColumns=columnNames.length;
	
		sqlQuery="sqlHiddenField="+SQLQueries.getAllCompaniesQuery(companyTextField.getText())+"&numberHiddenField=1&numberOfResultsHiddenField=4"; 
		dataRecieved=genericConnection(sqlQuery);
                headerLength=getHeaderLength(dataRecieved);
                count=headerLength+1;
                if(checkInteger(dataRecieved[headerLength])){
                    lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
                    numberOfRows=(lengthOfData-1)/(numberOfColumns+1);
                    globalCustomerIds=new String[numberOfRows];
                    String stringAtEachCell[][]=new String[numberOfRows][numberOfColumns];
                    for(i=0;i<numberOfRows;i++){
                    	for(j=0;j<numberOfColumns;j++){
				if(!dataRecieved[count].equals("null")){
					stringAtEachCell[i][j]=dataRecieved[count];
				}else{
					stringAtEachCell[i][j]="";
				}
			
				count++;
                        }
                        globalCustomerIds[countId]=dataRecieved[count];
                        countId++;
                        count++;
                    }
                    
		
                    noOfColumnsInGenericTable=numberOfColumns;
                    tableCase="company";	
                    displayTable(stringAtEachCell,columnNames,numberOfRows,numberOfColumns);
                }
                timerMessage.disposeTimer();
            }
	}
	
        void setEligibilityCompanyFields(String customerId){
         /*---------------------------------------------------------------------
          * This method takes one parameter customer id and doesnot return anything. All it does
          * is to make sql queries regarding company information like status,availability,
          * sgp and type. The information regarding the sql query can be found in  
          * getEligibilityCompanyQuery method of SQLQueries class. The parameter is uesd 
          * for the sql query as it specify the customer id of the particular company.
          * Then it display all the information about that company in the text fields. 
          *----------------------------------------------------------------------*/
	
            String[] dataRecieved;
            String sqlQuery="sqlHiddenField="+SQLQueries.getEligibilityCompanyQuery(customerId)+"&numberHiddenField=1&numberOfResultsHiddenField=4"; 
            dataRecieved=genericConnection(sqlQuery);
            headerLength=getHeaderLength(dataRecieved);
            if(checkInteger(dataRecieved[headerLength])){
                if(dataRecieved[headerLength].equals("5")){
                    statusEligibilityTextField.setText(dataRecieved[headerLength+1]);
                    availabilityEligibilityTextField.setText(dataRecieved[headerLength+2]);
                    sgpEligibilityTextField.setText(dataRecieved[headerLength+3]);
                    typeEligibilityTextField.setText(dataRecieved[headerLength+4]);
                }
            }
            
        }
        
        void setEligibilityCaseFields(String caseNumber){
         /*---------------------------------------------------------------------
          * This method takes one parameter customer id and doesnot return anything. All it does
          * is to make sql queries regarding case information like date entered,entered by
          * last modified date etc. The information regarding the sql query can be found in  
          * getEligibilityCaseyQuery method of SQLQueries class. The parameter is uesd 
          * for the sql query as it specify the case number. 
          * Then it display all the information about that case in the text fields. 
          *----------------------------------------------------------------------*/
	
            String[] dataRecieved;
            String sqlQuery="sqlHiddenField="+SQLQueries.getEligibilityCaseQuery(caseNumber)+"&numberHiddenField=1&numberOfResultsHiddenField=5"; 
            dataRecieved=genericConnection(sqlQuery);
            headerLength=getHeaderLength(dataRecieved);
            if(checkInteger(dataRecieved[headerLength])){
 
                if(dataRecieved[headerLength].equals("6")){
                    //dateEnteredEligibilityTextField.setText(formatDate(dataRecieved[headerLength+1]));
                    dateEnteredEligibilityTextField.setText(formatDateWithTime(dataRecieved[headerLength+1]));
                    enteredByEligibilityTextField.setText(dataRecieved[headerLength+2]);
                    //lastModifiedEligibilityTextField.setText(formatDate(dataRecieved[headerLength+3]));
                    lastModifiedEligibilityTextField.setText(formatDateWithTime(dataRecieved[headerLength+3]));
                    lastModifiedByEligibilityTextField.setText(dataRecieved[headerLength+4]);
                    //dateClosedEligibilityTextField.setText(formatDate(dataRecieved[headerLength+5]));
                    dateClosedEligibilityTextField.setText(formatDateWithTime(dataRecieved[headerLength+5]));
                }
            }
            
        }
        
        
	boolean checkInteger(String value){
         /*---------------------------------------------------------------------
          * This is very important method which takes a string as a parameter
          * and determines wether all the letters in the string are digits or not.
          * This method is always called before parsing the string to make an integer.
          *----------------------------------------------------------------------*/
	
            
		int length=value.length();
		int i=0;
		for(i=0;i<length;i++){
			if((value.charAt(i)!='0')&&(value.charAt(i)!='1')&&(value.charAt(i)!='2')&&(value.charAt(i)!='3')&&(value.charAt(i)!='4')&&(value.charAt(i)!='5')&&(value.charAt(i)!='6')&&(value.charAt(i)!='7')&&(value.charAt(i)!='8')&&(value.charAt(i)!='9')){
				return(false);
			}
		}
		return(true);
		
	
	}
	
        boolean checkFloat(String value){
	 /*---------------------------------------------------------------------
          * This method takes a string as a parameter and determines wether all the
          * letters in the string are digits (along with a dot) or not. It checks weather
          * the string is representing a floating point number or not.
          *----------------------------------------------------------------------*/
	
                int length=value.length();
		int i=0;
                int period=0;
		for(i=0;i<length;i++){
			if(value.charAt(i)=='.'){
                               period++;
                        }
                        if(period>1){
                            return(false);
                        }
                        if((value.charAt(i)!='0')&&(value.charAt(i)!='1')&&(value.charAt(i)!='2')&&(value.charAt(i)!='3')&&(value.charAt(i)!='4')&&(value.charAt(i)!='5')&&(value.charAt(i)!='6')&&(value.charAt(i)!='7')&&(value.charAt(i)!='8')&&(value.charAt(i)!='9')&&(value.charAt(i)!='.')){
                            
				return(false);
			}
		}
		return(true);
		
	
	}
        
        
	boolean validateDay(String day,String month,String year){
         /*---------------------------------------------------------------------
          * This is a very impportant method which determines a correect date.
          * This method takes a three string as a parameter and determines wether it 
          * represents a valid date or not. It checks all the days in every month including
          * a leap year. It returns true or false correspnding to the valid or invalid date
          * respectively. If there is some mistake in the date then it displays an alert message too
          * telling what the mistake is.
          *----------------------------------------------------------------------*/
	
            
                boolean somethingWrong=false;
		boolean leapYear=false;
		int dayNumber=0;
		int yearNumber=0;
		if(!checkInteger(day)){
			alertMessage.displayMessages("Day not a number. Example Date: 22-feb-2001");
			somethingWrong=true;
		}else{
			if(!checkInteger(year)){
				alertMessage.displayMessages("Year not a number. Example Date: 22-feb-2001");
				somethingWrong=true;
			}else{
				if((!month.toLowerCase().equals("jan"))&&(!month.toLowerCase().equals("feb"))&&(!month.toLowerCase().equals("mar"))&&(!month.toLowerCase().equals("apr"))&&(!month.toLowerCase().equals("may"))&&(!month.toLowerCase().equals("jun"))&&(!month.toLowerCase().equals("jul"))&&(!month.toLowerCase().equals("aug"))&&(!month.toLowerCase().equals("sep"))&&(!month.toLowerCase().equals("oct"))&&(!month.toLowerCase().equals("nov"))&&(!month.toLowerCase().equals("dec"))){
					alertMessage.displayMessages("Invalid Month. Example Date: 22-feb-2001");
					somethingWrong=true;
				}else{
					if(year.length()!=4){
						alertMessage.displayMessages("Invalid Year. Example Date: 22-feb-2001");
						somethingWrong=true;
					}else{
						dayNumber=Integer.parseInt(day);
						if(month.toLowerCase().equals("feb")){
							yearNumber=Integer.parseInt(year);
							if(yearNumber%4==0){
								leapYear=true;
							}
							if(leapYear){
								if(dayNumber>29){
									alertMessage.displayMessages("Feb does not have these many days in leap year");
									somethingWrong=true;
								}
							
							}else{
								if(dayNumber>28){
									alertMessage.displayMessages("Feb does not have these many days in this year");
									somethingWrong=true;
								}
							}
							
						}else{
							if((month.toLowerCase().equals("jan"))||(month.toLowerCase().equals("mar"))||(month.toLowerCase().equals("may"))||(month.toLowerCase().equals("jul"))||(month.toLowerCase().equals("aug"))||(month.toLowerCase().equals("oct"))||(month.toLowerCase().equals("dec"))){
								if(dayNumber>31){
									alertMessage.displayMessages("This month does not have these many days");
									somethingWrong=true;
								}
							}else{
								if(dayNumber>30){
									alertMessage.displayMessages("This month does not have these many days");
									somethingWrong=true;
								}
							}
						}	
					
					}
				}
			}
		}
		
		return(!somethingWrong);
	}

        
        
        boolean getEnableBeep(){
         /*---------------------------------------------------------------------
          * This method returns a boolean caccording  weather to send a pager message 
          * to the person or not. The various criteria to determine this is mentioned in the 
          * the code itself.
          *----------------------------------------------------------------------*/
	    
            
            String tempSupportType=globalEvSupportType.toLowerCase();
            if(tempSupportType.equals("platinum")){
                return(true);
            }
            if((tempSupportType.equals("gold"))||(tempSupportType.equals("silver"))){
                String tempSeverity=(String)severityComboBox.getSelectedItem();
                if(tempSeverity.equals("S1 - Fatal")){
                    return(true);
                }
                if(tempSeverity.equals("S2 - Critical")){
                    String day=getSystemDay();
                    if((day.equals("Sat"))||(day.equals("Sun"))){
                        return(false);
                    }else{
                        String tempHour=getSystemHour();
                        int hour=0;
                        if(checkInteger(tempHour)){
                            hour=Integer.parseInt(tempHour);
                        }else{
                            return(false);
                        }
                        if((hour>7)&&(hour<19)){
                            return(true);
                        }else{
                            return(false);
                        }
                    }
                }
            }
            return(false);
        }
        
        
        
        void handlePager(String localCaseNumber,String subject,String createdBy,String severity,String productLine){
         /*---------------------------------------------------------------------
          * This method is actually responsible for getting the pager address of the person.
          * After that it send the email to those person by inserting a record in the database
          * For information about these sql queries look into getTeamPagerQuery and setEmailQuery
          * queries of the SQLQueries class. Though it returns void but it takes five parameters 
          * regarding the information which has to be inserted into the database. Before 
          * doing all this , it checks weather the pager message has to be sent or not which is 
          * done by a call to getEnableBeep method.
          *----------------------------------------------------------------------*/
	
            if(getEnableBeep()){
                String dataRecieved[];
                String evTeamPager="";
                String discription="Case :"+localCaseNumber+" "+createdBy+" Email : "+globalLoggedInEmailAddress+" has filed an "+severity+" case for "+productLine;
                String sqlQuery="sqlHiddenField="+SQLQueries.getTeamPagerQuery()+"&numberHiddenField=1&numberOfResultsHiddenField=1"; 
		dataRecieved=genericConnection(sqlQuery);
                headerLength=getHeaderLength(dataRecieved);
		evTeamPager=dataRecieved[headerLength+1];
                sqlQuery="sqlHiddenField="+SQLQueries.setEmailQuery(localCaseNumber,evTeamPager,subject,discription,createdBy)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                dataRecieved=genericConnection(sqlQuery);
                
                
            }
        }
        
        String  doCustomerTeamSupporting(String customerId){
         /*---------------------------------------------------------------------
          * This method is responsible for getting the ev team id of the customer.
          * Futher it aslo retrives the inbox and email for that customer. 
          * The sqlQueries to retrive the above information are mentioned in
          * getEvTeamIdCustomerQuery and getEvMailAndInboxCustomerQuery methods
          * of SQLQueries class.
          * The customer is determined by the customer id which is pases as the
          * only parameter. This inbox is used  for calling another method 
          * doAllActions, which basically updates the record for that inbox 
          * in the database. It returns the retrived email back.
          *----------------------------------------------------------------------*/
	
            
            int lengthOfData=0;
            String dataRecieved[];
            String evTeamId="";
            
            String sqlQuery="sqlHiddenField="+SQLQueries.getEvTeamIdCustomerQuery(customerId)+"&numberHiddenField=1&numberOfResultsHiddenField=1"; 
            dataRecieved=genericConnection(sqlQuery);
            headerLength=getHeaderLength(dataRecieved);
            evTeamId=dataRecieved[headerLength+1];
            if(evTeamId.equals("null")){
                return("null");
            }else{
                sqlQuery="sqlHiddenField="+SQLQueries.getEvMailAndInboxCustomerQuery(customerId)+"&numberHiddenField=1&numberOfResultsHiddenField=2"; 
                dataRecieved=genericConnection(sqlQuery);
                headerLength=getHeaderLength(dataRecieved);
                if(checkInteger(dataRecieved[headerLength])){
                    lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
                    if(lengthOfData==3){
                        String actionNumber="";
                        String email=dataRecieved[headerLength+1];
                        String inbox=dataRecieved[headerLength+2];
                         doAllActions(inbox);
         
                         return(email);
                    }
                }
                return("null");
            }
        }
        
        String doIndustryTeamSupporting(String customerId){
         /*---------------------------------------------------------------------
          * This method is responsible for getting the ev team id of the customer.
          * Futher it aslo retrives the inbox and email for that ev team industry id. 
          * The sqlQueries to retrive the above information are mentioned in
          * getEvTeamIdIndustryQuery and getEvMailAndInboxIndustryQuery methods
          * of SQLQueries class.
          * The customer is determined by the customer id which is pases as the
          * only parameter. This inbox is used  for calling another method 
          * doAllActions, which basically updates the record for that inbox 
          * in the database. It returns the retrived email  back.
          *----------------------------------------------------------------------*/
	
            
            
            int lengthOfData=0;
            String dataRecieved[];
            String evTeamId="";
            String sqlQuery="sqlHiddenField="+SQLQueries.getEvTeamIdIndustryQuery(customerId)+"&numberHiddenField=1&numberOfResultsHiddenField=1"; 
            dataRecieved=genericConnection(sqlQuery);
            headerLength=getHeaderLength(dataRecieved);
            evTeamId=dataRecieved[headerLength+1];
            if(evTeamId.equals("null")){
                return("null");
            }else{
                sqlQuery="sqlHiddenField="+SQLQueries.getEvMailAndInboxIndustryQuery(evTeamId)+"&numberHiddenField=1&numberOfResultsHiddenField=2"; 
                dataRecieved=genericConnection(sqlQuery);
                headerLength=getHeaderLength(dataRecieved);
                if(checkInteger(dataRecieved[headerLength])){
                    lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
                    if(lengthOfData==3){
                        String actionNumber="";
                        String email=dataRecieved[headerLength+1];
                        String inbox=dataRecieved[headerLength+2];
                        doAllActions(inbox);
         
                         return(email);
                    }
                }
                return("null");
            }
        
        }
        
        String doProductTeamSupporting(String productLineId){
         /*---------------------------------------------------------------------
          * This method is responsible for getting the ev team id of the product.
          * Futher it aslo retrives the inbox and email for that product. 
          * The sqlQueries to retrive the above information are mentioned in
          * getEvTeamIdProductQuery and getEvMailAndInboxProductQuery methods
          * of SQLQueries class.
          * The Product is determined by the Product id which is pases as the
          * only parameter. This inbox is used  for calling another method 
          * doAllActions, which basically updates the record for that inbox 
          * in the database. It returns the retrived email back.
          *----------------------------------------------------------------------*/
	
            
            int lengthOfData=0;
            String dataRecieved[];
            String evTeamId="";
            String sqlQuery="sqlHiddenField="+SQLQueries.getEvTeamIdProductQuery(productLineId)+"&numberHiddenField=1&numberOfResultsHiddenField=1"; 
            dataRecieved=genericConnection(sqlQuery);
            headerLength=getHeaderLength(dataRecieved);
            evTeamId=dataRecieved[headerLength+1];
            if(evTeamId.equals("null")){
                return("null");
            }else{
                sqlQuery="sqlHiddenField="+SQLQueries.getEvMailAndInboxProductQuery(productLineId)+"&numberHiddenField=1&numberOfResultsHiddenField=2"; 
                dataRecieved=genericConnection(sqlQuery);
                headerLength=getHeaderLength(dataRecieved);
                if(checkInteger(dataRecieved[headerLength])){
                    lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
                    if(lengthOfData==3){
                        String actionNumber="";
                        String email=dataRecieved[headerLength+1];
                        String inbox=dataRecieved[headerLength+2];
                        doAllActions(inbox);
         
                         return(email);
                    }
                }
                return("null");
            }
        
        }
        
        void doAllActions(String inbox){
         /*---------------------------------------------------------------------
          * This method retrives the action number sequence from the action table
          * by a sql query in getActionNumberQuery method in SQLQueries class.
          * Fither it inserts a records for the inbox which is passed as the only parameter.
          * The records are inserted by another sql queries which are in setActionLogQuery
          * and setActionQuery methods in SQLQueries class.
          *----------------------------------------------------------------------*/
	
        
            
            
            int lengthOfData=0;
            String dataRecieved[];
            String sqlQuery="";
            String actionNumber="";
            sqlQuery="sqlHiddenField="+SQLQueries.getActionNumberQuery()+"&numberHiddenField=1&numberOfResultsHiddenField=1"; 
            dataRecieved=genericConnection(sqlQuery);
            headerLength=getHeaderLength(dataRecieved);
            actionNumber=dataRecieved[headerLength+1];
            sqlQuery="sqlHiddenField="+SQLQueries.setActionLogQuery(actionNumber,inbox,(globalLoggedInFirstName+" "+globalLoggedInLastName))+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
            dataRecieved=genericConnection(sqlQuery);
            sqlQuery="sqlHiddenField="+SQLQueries.setActionQuery(actionNumber,caseNumberTextField.getText(),(globalLoggedInFirstName+" "+globalLoggedInLastName))+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
            dataRecieved=genericConnection(sqlQuery);
        }
        
        
        void handleAction(String byForToEmail,String tempEmail,String visibility,String localCaseNumber,String discription,String subject,String status){
         /*---------------------------------------------------------------------
          * This method calls three other methods  to retrive the email address 
          * regarding the company, industry and product. The method are called only
          * if the status is unassigned. The three methods are 
          * a) doCustomerTeamSupporting
          * b) doIndustryTeamSupporting
          * and c) doProductTeamSupporting
          * Futher this method also checks that if the visibility is internal then only an 
          * i2 employee should recieve the email. It aslo calls anither method distictEmail
          * which takes a string of email and resturs a string with distinc emails only.
          * In the end it inserts recored into the database with sql query which is in 
          * setEmailQuery in SQLQuery class.
          *----------------------------------------------------------------------*/
	
            int count=0;
            int totalTokens=0;
            String dataRecieved[];
            String sqlQuery="";
            String finalEmail="";
            String fromEmail="";
            String tempToken="";
            StringTokenizer tempTokenizer=null;
            StringTokenizer tokenizerForEmail=new StringTokenizer(tempEmail,",");
            if(status.equals("Unassigned")){
                if(!(fromEmail=doCustomerTeamSupporting(globalCustomerId)).equals("null")){
                    finalEmail=finalEmail+fromEmail+",";
                }
                if(!(fromEmail=doIndustryTeamSupporting(globalCustomerId)).equals("null")){
                    finalEmail=finalEmail+fromEmail+",";
                }
                if(!(fromEmail=doProductTeamSupporting(productLineId[(2*productLineComboBox.getSelectedIndex()+fixedHeaderLength+2)])).equals("null")){
                    finalEmail=finalEmail+fromEmail;
               
                }
            }
            
            if(finalEmail.equals("")){
                finalEmail=byForToEmail;
            }else{
                finalEmail=finalEmail+","+byForToEmail;
            }
            if(visibility.equals("Internal")){
                totalTokens=tokenizerForEmail.countTokens();
                while(count<totalTokens){
                    tempToken=tokenizerForEmail.nextToken();
                    tempTokenizer=new StringTokenizer(tempToken,"@");
                    if((tempTokenizer.nextToken()+"@i2.com").equals(tempToken)){
                        if(finalEmail.equals("")){
                            finalEmail=tempToken;
                        }else{
                            finalEmail=finalEmail+","+tempToken;
                        }
                        
                    }
                    count++;
                }
            }else{
                 if(finalEmail.equals("")){
                     finalEmail=tempEmail;
                 }else{
                    finalEmail=finalEmail+","+tempEmail;
                 }
            }
            
            finalEmail=distinctEmail(finalEmail);
            sqlQuery="sqlHiddenField="+SQLQueries.setEmailQuery(localCaseNumber,finalEmail,subject,discription,(globalLoggedInFirstName+" "+globalLoggedInLastName))+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
            dataRecieved=genericConnection(sqlQuery);
                        
        }
        
        
        String getByForToEmail(String emailAddressBy,String emailAddressFor){
         /*---------------------------------------------------------------------
          * This method takes two parameters emailAddressBy and emailAddressFor
          * and returns a string of emailaddress speperated by comma with distictive 
          * emai address reported by,emai address reported for and assigned to email address
          *----------------------------------------------------------------------*/
	
            
            String finalEmail="";
            if(emailAddressBy.equals(emailAddressFor)){
                  finalEmail=emailAddressBy;
            }else{
                  finalEmail=emailAddressBy+","+emailAddressFor;
            }
             if((!emailAddressBy.equals(globalEmailAddressTo))&&(!emailAddressFor.equals(globalEmailAddressTo))&&(!assignedToLastTextField.getText().equals("null"))&&(!assignedToFirstTextField.getText().equals("null"))){
                  finalEmail=finalEmail+","+globalEmailAddressTo;
             }
            return(finalEmail);
        }
        
        String distinctEmail(String email){
         /*---------------------------------------------------------------------
          * This method takes a string as a parameter and returns the same string
          * with comma seperated and distinctive tokens.
          *----------------------------------------------------------------------*/

            
            int numberOfTokens=0;
            int i=0;
            int j=0;
            boolean equalOrNot;
            String finalEmail="";
            StringTokenizer tokenizerForDistinctEmail=new StringTokenizer(email,",");
            numberOfTokens=tokenizerForDistinctEmail.countTokens();
            if(numberOfTokens>1){
                String tempEmail[]=new String[numberOfTokens];
                for(i=0;i<numberOfTokens;i++){
                    tempEmail[i]=tokenizerForDistinctEmail.nextToken();
                 }
            
                for(i=0;i<(numberOfTokens-1);i++){
                    equalOrNot=false;
                    for(j=(i+1);j<numberOfTokens;j++){
                        if(tempEmail[i].equals(tempEmail[j])){
                            equalOrNot=true;
                            break;
                        }
                    }
                    if(!equalOrNot){
                        finalEmail=finalEmail+tempEmail[i]+",";
                    }
                
                }
                finalEmail=finalEmail+tempEmail[(j-1)];
            }else{
                return(tokenizerForDistinctEmail.nextToken());
            }
            return(finalEmail);    
        
        }
        
        
        void fetchCaseInfo(){
         /*---------------------------------------------------------------------
          * This method is responsible for fetching all the information about the case
          * number. Initailly it sets a timer message which is displayed on the user screen.
          * It then calls another method clearTextFields to clear all the text fields.
          * Then it makes a sql query to fetch the case information. To find about the query
          * look into getCaseQuery method of SQLQueries class. After fetching that data 
          * it is displayed into the text fields. It futher makes whole lot of sql queries 
          * which I will describe along the code.
          *----------------------------------------------------------------------*/

            if(!gotoCaseNumberTextField.getText().equals("")){
                if(checkInteger(gotoCaseNumberTextField.getText())){
                        TimerMessage timerMessage=new TimerMessage();
                        timerMessage.displayMessages("Please wait while applet fetches data");
                        timerMessage.start();
				int lengthOfData=0;
				int realDataLength=0;
                                int saveHeaderLength=0;
				int j=0;
				int i=0;
				
				String[] dataRecieved;
				
				String caseNumber=gotoCaseNumberTextField.getText();
				String swReportedBy="";
				String evReportedFor="";
				String swAssignedTo="";
				String swSiteId="";
				String swCustomerId="";
				String sqlQuery="";

				reportedByLastTextField.requestFocus();
				clearTextFields();
				sqlQuery="sqlHiddenField="+SQLQueries.getCaseQuery(caseNumber)+"&numberHiddenField=1&numberOfResultsHiddenField=25"; 
				caseNumberTextField.setText(caseNumber);
				gotoCaseNumberTextField.setText(caseNumber);
				appletSocket= SendAndRecieve.makeSocketConnection(hostName,portNumber);
				try{
					//sendAndRecieve=new SendAndRecieve(new BufferedReader(new InputStreamReader(appletSocket.getInputStream())),new PrintStream(appletSocket.getOutputStream()));
                                    sendAndRecieve=new SendAndRecieve(new BufferedReader(new InputStreamReader(appletSocket.getInputStream())),new PrintStream(appletSocket.getOutputStream()),hostName);
				}catch(IOException ioe){
					System.out.println("io exception "+ioe);
				}
				sendAndRecieve.sendPostHeader(directorySQL,sqlQuery.length());
				sendAndRecieve.sendData(sqlQuery);
				dataRecieved=sendAndRecieve.recieveData();
                                headerLength=getHeaderLength(dataRecieved);
                                saveHeaderLength=headerLength;
				realDataLength=sendAndRecieve.getDataLength();
                                /*---------------------------------------------------------------------
                                 * After making the sql query the data fetched is displayed on the text fields
                                 * In the next few lines of code I am trying to set all the text fields with that data.
                                 *----------------------------------------------------------------------*/

                                if(checkInteger(dataRecieved[headerLength])){
                                    lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
				
		                  i=headerLength+1;
                                    if(i<=lengthOfData){
				
					if(!dataRecieved[i].equals("null")){
						hoursTextField.setText(dataRecieved[i]);
					}
					i++;
                                       
					if (dataRecieved[i].equals("1")){
						billableCheckBox.setSelected(true);
					}
					i++;
					emailDetailsComboBox.select(dataRecieved[i]);
					i++;
					visibilityComboBox.select(dataRecieved[i]);
					i++;
					solutionComboBox.select(dataRecieved[i]);
					i++;
					serviceComboBox.select(dataRecieved[i]);
					
					i++;
					if((!dataRecieved[i].equals(""))&&(!dataRecieved[i].equals("null"))&&(!dataRecieved[i].equals("Transportation Planning Products"))){
                                            globalOldProductName=dataRecieved[i];
                                            productLineComboBox.select(dataRecieved[i]);
                                            getProductRelease(productLineId[(2*productLineComboBox.getSelectedIndex()+fixedHeaderLength+2)]);
					}
					i++;
					productReleaseComboBox.select(dataRecieved[i]);
					getVersion((String)productReleaseComboBox.getSelectedItem());
					i++;
					versionComboBox.select(dataRecieved[i]);
					i++;
                                        headerLength=saveHeaderLength;
					if(!dataRecieved[i].equals("null")){
						subjectTextField.setText(dataRecieved[i]);
					}
					i++;
					statusComboBox.select(dataRecieved[i]);
                                        globalOldStatus=dataRecieved[i];
					i++;
					j=i;
					if(!dataRecieved[i].equals("null")){
						discriptionTextArea.setText("");
					}
                                        //System.out.println("len "+headerLength);
					while (i<(j+realDataLength-25-1-headerLength)){
						discriptionTextArea.append(dataRecieved[i]+"\n");
						i++;
					}
					typeComboBox.select(dataRecieved[i]);
					i++;
					sourceComboBox.select(dataRecieved[i]);
					i++;
					severityComboBox.select(dataRecieved[i]);
					i++;
					priorityComboBox.select(dataRecieved[i]);
					i++;
					swReportedBy=dataRecieved[i];
                                        //System.out.println("by "+swReportedBy);
					i++;
					evReportedFor=dataRecieved[i];
                                        //System.out.println("for "+evReportedFor);
					i++;
					swAssignedTo=dataRecieved[i];
                                        //System.out.println("to "+swAssignedTo);
					i++;
					swSiteId=dataRecieved[i];
					i++;
					swCustomerId=dataRecieved[i]; 
					i++;
					if(!dataRecieved[i].equals("null")){
						resolutionTextField.setText(dataRecieved[i]);
					}
					i++;
					if(!dataRecieved[i].equals("null")){
						dueDateTextField.setText(formatDate(dataRecieved[i]));
					}
					i++;
					if(!dataRecieved[i].equals("null")){
						parentCaseNumberTextField.setText(dataRecieved[i]);
					}
                                        i++;
					if(!dataRecieved[i].equals("null")){
						alsoEmailTextField.setText(dataRecieved[i]);
					}
                                        
                                    }
                                    
                                }
                                
                                /*---------------------------------------------------------------------
                                 * If I dont recieve the reported by person id that means it is an invalid case.
                                 * So I display an alert message instead and skips all the futher queries in 
                                 * this method. If it is present the I retrive all the information of the 
                                 * reported by , reported for and assigned to person. Please look at the 
                                 * getNameAndInfoQuery in SQLQueries class for more information. After fetching the 
                                 * information I need to know which person belongs to which catogary. 
                                 * For eg which of the retrived person is reported by , reported for or 
                                 * assigend to. This is done by matching the persond id with the one that is
                                 * retrived. In the next 250 lines of code only this function is being 
                                 * performed.
                                 *----------------------------------------------------------------------*/
                                
                                if(evReportedFor.equals("")){
                                    evReportedFor="0";
                                
                                }
                                if(swAssignedTo.equals("")){
                                    swAssignedTo="0";
                                
                                }
                                if(swReportedBy.equals("")){
                                    alertMessage.displayMessages("This case does not exist");
                                    caseNumberTextField.setText("");
                                }else{
                                    sqlQuery="sqlHiddenField="+SQLQueries.getNameAndInfoQuery(swReportedBy,evReportedFor,swAssignedTo)+"&numberHiddenField=1&numberOfResultsHiddenField=8"; 
                             
                                    dataRecieved=genericConnection(sqlQuery);
                                    headerLength=getHeaderLength(dataRecieved);
                                  if(checkInteger(dataRecieved[headerLength])){
                                    lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
                                    i=headerLength+1;
				
                                    if(i<=lengthOfData){
					if(dataRecieved[i].equals(swReportedBy)){
						i++;
						if(!dataRecieved[i].equals("null")){
							reportedByFirstTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
								reportedByLastTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							emailAddressByTextField.setText(dataRecieved[i]);
							globalEmailAddressBy=dataRecieved[i];
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							areaByTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							localByTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							countryByTextField.setText(dataRecieved[i]);
						}	
						i++;
						if(!dataRecieved[i].equals("null")){
							extentionByTextField.setText(dataRecieved[i]);
						}
						
					}
					i=headerLength+1;
					if(dataRecieved[i].equals(evReportedFor)){
						i++;
						if(!dataRecieved[i].equals("null")){
							reportedForFirstTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							reportedForLastTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							emailAddressForTextField.setText(dataRecieved[i]);
							globalEmailAddressFor=dataRecieved[i];
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							areaForTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							localForTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							countryForTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							extentionForTextField.setText(dataRecieved[i]);
						}
					}	
					i=headerLength+1;
					if(dataRecieved[i].equals(swAssignedTo)){
						i++;
						if(!dataRecieved[i].equals("null")){
							assignedToFirstTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							assignedToLastTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							globalEmailAddressTo=dataRecieved[i];
						}
					
					}
				}
				
				i=headerLength+1+8;
				if(i<=lengthOfData){
					if(dataRecieved[i].equals(swReportedBy)){
						i++;
						if(!dataRecieved[i].equals("null")){
						reportedByFirstTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							reportedByLastTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							emailAddressByTextField.setText(dataRecieved[i]);
							globalEmailAddressBy=dataRecieved[i];
							
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							areaByTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							localByTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							countryByTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							extentionByTextField.setText(dataRecieved[i]);
						}
						
					}	
					i=headerLength+1+8;
					if(dataRecieved[i].equals(evReportedFor)){
						i++;
						if(!dataRecieved[i].equals("null")){
							reportedForFirstTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							reportedForLastTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							emailAddressForTextField.setText(dataRecieved[i]);
							globalEmailAddressFor=dataRecieved[i];
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							areaForTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							localForTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							countryForTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							extentionForTextField.setText(dataRecieved[i]);
						}
					}
					i=headerLength+1+8;
					if(dataRecieved[i].equals(swAssignedTo)){
						i++;
						if(!dataRecieved[i].equals("null")){
							assignedToFirstTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							assignedToLastTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							globalEmailAddressTo=dataRecieved[i];
						}
					
					}
				}
				i=headerLength+1+16;
				if(i<=lengthOfData){
					if(dataRecieved[i].equals(swReportedBy)){
							i++;
				
						if(!dataRecieved[i].equals("null")){
							reportedByFirstTextField.setText(dataRecieved[i]);
						}
				
						i++;
						if(!dataRecieved[i].equals("null")){
							reportedByLastTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							emailAddressByTextField.setText(dataRecieved[i]);
							globalEmailAddressBy=dataRecieved[i];
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							areaByTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							localByTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							countryByTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							extentionByTextField.setText(dataRecieved[i]);
						}
					}
					
				
					i=headerLength+1+16;
					if(dataRecieved[i].equals(evReportedFor)){
						i++;
						if(!dataRecieved[i].equals("null")){
							reportedForFirstTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							reportedForLastTextField.setText(dataRecieved[i]);
						}
						i++;	
						if(!dataRecieved[i].equals("null")){
							emailAddressForTextField.setText(dataRecieved[i]);
							globalEmailAddressFor=dataRecieved[i];
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							areaForTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							localForTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							countryForTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							extentionForTextField.setText(dataRecieved[i]);
						}
					}	
					i=headerLength+1+16;
					if(dataRecieved[i].equals(swAssignedTo)){
						i++;
						if(!dataRecieved[i].equals("null")){
							assignedToFirstTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							assignedToLastTextField.setText(dataRecieved[i]);
						}
						i++;
						if(!dataRecieved[i].equals("null")){
							globalEmailAddressTo=dataRecieved[i];
						}
						
					}
                                   }
                                }
                                    
                                
                                globalCustomerId=swCustomerId;    
                                    
                                /*---------------------------------------------------------------------
                                 * Now I try to retrive the company and site for that particular case by calling
                                 * getCompanyAndSite method which does the displaying part also. Then I call 
                                 * setEligibilityCaseFields method which retrives some other information about 
                                 * this case and displays them too. For more information look into that method
                                 * please. Then I retrive all the notes information for this case and displayes them too.
                                 * This is again done by another method call viz. getNotes. In the end I 
                                 * enable all the disabled text field for the user to allow editing.
                                 *----------------------------------------------------------------------*/
                                    
                                    
				getCompanyAndSite(swSiteId,swCustomerId);	
                                setEligibilityCaseFields(caseNumber);
                                getNotes(caseNumber);
                                
				emailAddressByTextField.setEditable(true);
				countryByTextField.setEditable(true);
				areaByTextField.setEditable(true);
				localByTextField.setEditable(true);
				extentionByTextField.setEditable(true);
				reportedForLastTextField.setEditable(true);
				reportedForFirstTextField.setEditable(true);
				emailAddressForTextField.setEditable(true);
				countryForTextField.setEditable(true);
				areaForTextField.setEditable(true);
				localForTextField.setEditable(true);
				extentionForTextField.setEditable(true);
				assignedToLastTextField.setEditable(true);
				assignedToFirstTextField.setEditable(true);
				companyTextField.setEditable(true);
				
				
				
				keyPressedBy=false;
				keyPressedFor=false;
				keyPressedTo=false;
				keyPressedCompany=false;
				oldByLast=reportedByLastTextField.getText();
				oldForLast=reportedForLastTextField.getText();
				oldToLast=assignedToLastTextField.getText();
				oldCompany=companyTextField.getText();
				oldByFirst=reportedByFirstTextField.getText();
				oldForFirst=reportedForFirstTextField.getText();
				oldToFirst=assignedToFirstTextField.getText();
				newByLast="";
				newForLast="";
				newToLast="";
				newCompany="";
				newByFirst="";
				newForFirst="";
				newToFirst="";
                                
                                saveNotesButton.setEnabled(true);
                                newNotesButton.setEnabled(true);
                                deleteNotesButton.setEnabled(true);
                                saveAndEmailNotesButton.setEnabled(true);
                            
                                
                                
                            }
                                
                            timerMessage.disposeTimer();
                    }else{
                        alertMessage.displayMessages("Case not a number..");
                    }
            }
                    
        }
        
        
        
	public void actionPerformed(ActionEvent e){
         /*---------------------------------------------------------------------
          * This method is the controller of this MVC. Whenever user does something on the 
          * GUI components which has action listener in them, particular action is performed.
          * These actions are dependent upon the user input and the components. First I get 
          * what is the action command and then see from which GUI component it has
          * been gererated. All GUI components have different actions to be performed.
          *----------------------------------------------------------------------*/

            
		String STR=e.getActionCommand();
		
		if((STR.equals(reportedByLastTextField.getText()))||(STR.equals(reportedForLastTextField.getText()))||(STR.equals(assignedToLastTextField.getText()))||(STR.equals(reportedByFirstTextField.getText()))||(STR.equals(reportedForFirstTextField.getText()))||(STR.equals(assignedToFirstTextField.getText())) ){
                    /*---------------------------------------------------------------------
                     * Here I am checking for the action from reported by,reported for and assigned
                     * to first and last text fields. If the action is generated on those fields,
                     * then I start a timer display which is first three lines of code. Then the nested
                     * if then statements checks excately which text field genereted that command.
                     * After that I make sql queries using getLastNameQuery or getFirstNameQuery
                     * methods in SQLQueries class. This query is responsible for fetching
                     * all the people information whose names starts with the string that is
                     * present on the particular text field which generated the action.
                     * Finally displayTable method is called which pops up a table to display
                     * all the information of the people fetched from the sql query. For more 
                     * information look into displayTable method.
                     *----------------------------------------------------------------------*/

			
			TimerMessage timerMessage=new TimerMessage();
                        timerMessage.displayMessages("Executing your query.. ");
                        timerMessage.start();
                        
			
			int i=0;
			int j=0;
			int lengthOfData=0;
			int numberOfRows=0;
			int numberOfColumns=0;
			int count=headerLength+1;
			boolean firstOrLast=false;
			Object source=e.getSource();
                        TextField tempTextField=(TextField)source;
                        if(!tempTextField.getText().equals("")){
                        
			String[] dataRecieved;
			String Name="";
			String sqlQuery="";
			
			String[] columnNames = {"Last Name","First Name","Country","Area","Phone","Extension","Email Address","Company","Site Name","Email User Type","Site ID","Customer ID"};		
			numberOfColumns=columnNames.length;
		
			if(source==reportedByLastTextField){
				byOrForFlag=1;
				Name=reportedByLastTextField.getText();
			}else{
				if(source==reportedForLastTextField){
					byOrForFlag=0;
					Name=reportedForLastTextField.getText();
				}else{
					if(source==assignedToLastTextField){
						byOrForFlag=2;
						Name=assignedToLastTextField.getText();
					}else{	
						if(source==reportedByFirstTextField){
							byOrForFlag=1;
							Name=reportedByFirstTextField.getText();
							firstOrLast=true;
						}else{
							if(source==reportedForFirstTextField){
								byOrForFlag=0;
								Name=reportedForFirstTextField.getText();
								firstOrLast=true;
							}else{
								if(source==assignedToFirstTextField){
									byOrForFlag=2;
									Name=assignedToFirstTextField.getText();
									firstOrLast=true;
								}
							}
						}		
					}
				}
			}
							
			if (!firstOrLast){				
				sqlQuery="sqlHiddenField="+SQLQueries.getLastNameQuery(Name)+"&numberHiddenField=1&numberOfResultsHiddenField=12"; 
			}else{
				sqlQuery="sqlHiddenField="+SQLQueries.getFirstNameQuery(Name)+"&numberHiddenField=1&numberOfResultsHiddenField=12"; 
			}
			dataRecieved=genericConnection(sqlQuery);
                        headerLength=getHeaderLength(dataRecieved);
                        count=headerLength+1;
                        if(checkInteger(dataRecieved[headerLength])){
                            lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
                            numberOfRows=(lengthOfData-1)/numberOfColumns;
                            String stringAtEachCell[][]=new String[numberOfRows][numberOfColumns];
                        for(i=0;i<numberOfRows;i++){
                            	for(j=0;j<numberOfColumns;j++){
					
					if(!dataRecieved[count].equals("null")){
						stringAtEachCell[i][j]=dataRecieved[count];
					}else{
						stringAtEachCell[i][j]="";
					}
					count++;
				}

                            }
                            noOfColumnsInGenericTable=numberOfColumns;
                            tableCase="name";	
                            displayTable(stringAtEachCell,columnNames,numberOfRows,numberOfColumns);
                        }
                        timerMessage.disposeTimer();
                        }
		
		}


		if (STR.equals(companyTextField.getText())){
                 /*---------------------------------------------------------------------
                  * Here I am checking for the action from company text fields. 
                  * If the action is generated on this field then getCompanyTable method
                  * is called which makes a sql query to fetch all the comapany name 
                  * and information and futher display it in the table. For more information
                  * look in to the getCompanyTable method.
                  *----------------------------------------------------------------------*/

                    if(!companyTextField.getText().equals("")){
                        getCompanyTable();
                    }
		}
		
                if(STR.equals(gotoCaseNumberTextField.getText())){
                 /*---------------------------------------------------------------------
                  * Here I am checking for the action from goto case number text fields. 
                  * If the action is generated on this field then fetchCaseInfo method
                  * is called which makes a sql query to fetch all the case 
                  * information and futher display it in the text fields. For more information
                  * look in to the fetchCaseInfo method.
                  *----------------------------------------------------------------------*/
                    fetchCaseInfo();
							
		}			  
		
			  
		
		


	
	
	
		if(STR.equals("Save")){
                 /*---------------------------------------------------------------------
                  * Here I am checking for the action from Save button. 
                  * If the action is generated on this button then first of all I retrive all
                  * the information from the information tab onto the variables. Then I check
                  * for the information which is mandatory. If it is not preasent then an alert message is 
                  * poped up displaying the proper message. Only if ever value retrived is 
                  * correct , I go foward to save the information in the database. otherwise
                  * I skip all the code. More information will be found along the code.
                  *----------------------------------------------------------------------*/
                    if(e.getSource()==saveButton){
                        
			int lengthOfData=0;	
			int i=0;
                        int j=0;
			int noOfRecords=0;
			int equalityCase=0;
			int day=0;
                        int numberOfTokens=0;
			boolean somethingWrong=false;
                        boolean tempNewOrOld=false;
			String parentCaseNumber=parentCaseNumberTextField.getText();
			String localCaseNumber=caseNumberTextField.getText();
			String hours=hoursTextField.getText();
                        String reportedByLast=reportedByLastTextField.getText();
			String reportedByFirst=reportedByFirstTextField.getText();
                        String emailAddressBy=emailAddressByTextField.getText();
			String countryBy=countryByTextField.getText();
			String areaBy=areaByTextField.getText();
			String localBy=localByTextField.getText();
			String extentionBy=extentionByTextField.getText();
			String reportedForLast=reportedForLastTextField.getText();
			String reportedForFirst=reportedForFirstTextField.getText();
			String emailAddressFor=emailAddressForTextField.getText();
			String countryFor=countryForTextField.getText();
			String areaFor=areaForTextField.getText();
			String localFor=localForTextField.getText();
			String extentionFor=extentionForTextField.getText();
			String company=companyTextField.getText();
			String assignedToLast=assignedToLastTextField.getText();
			String assignedToFirst=assignedToFirstTextField.getText();
			String subject=subjectTextField.getText();
			String dueDate=dueDateTextField.getText();
			String resolution=resolutionTextField.getText();
                        String alsoEmail=alsoEmailTextField.getText();                        
			String discription=discriptionTextArea.getText();
			String emailDetails=(String)emailDetailsComboBox.getSelectedItem();
			String visibility=(String)visibilityComboBox.getSelectedItem();
			String site=(String)siteComboBox.getSelectedItem();
			String solution=(String)solutionComboBox.getSelectedItem();
			String service=(String)serviceComboBox.getSelectedItem();
			String productLine=(String)productLineComboBox.getSelectedItem();
			String productRelease=(String)productReleaseComboBox.getSelectedItem();
			String version=(String)versionComboBox.getSelectedItem();
			String status=(String)statusComboBox.getSelectedItem();
			String type=(String)typeComboBox.getSelectedItem();
			String source=(String)sourceComboBox.getSelectedItem();
			String severity=(String)severityComboBox.getSelectedItem();
			String priority=(String)priorityComboBox.getSelectedItem();
                        //String dateEnteredEligibility=formatDateAsToDate(dateEnteredEligibilityTextField.getText());
                        String dateEnteredEligibility="";
                        String enteredByEligibility=enteredByEligibilityTextField.getText();
                        String dateClosedEligibility="";
                        
                        String lastModifiedByEligibility="";
                        String modifiedByEligibility="";
                        
                        String finalAlsoEmail="";
                        String finalEmail="";
                        String tempToken="";
                        String byForToEmail="";
			String reportedById="";
			String reportedForId="";
			String assignedToId="";
			String firstName="";
			String lastName="";
			String firstName1="";
			String lastName1="";
			String personId="";
			String personId1="";
			String siteId="";
			String productId="";
			String productReleaseId="";
			String billableToggle="0";
			String sqlQuery="";
                        String emailQuery="";
			String tempDate="";
			String month="";
			String year="";
                        String tempDescription="";
                        StringTokenizer tokenizerForTempDate=null;
                        StringTokenizer tokenizerForDescription=new StringTokenizer(discription,"'");
                        tokenizerForTempDate=new StringTokenizer(dateEnteredEligibilityTextField.getText());
                        dateEnteredEligibility=formatDateAsToDate(tokenizerForTempDate.nextToken());
			String[] dataRecieved;
                        
                        if((!status.equals("Cancelled"))&&(!status.equals("Closed"))&&(!status.equals("Closed - Rejected"))){
                             dateClosedEligibilityTextField.setText("NONE");
                             dateClosedEligibility="NONE";
                        }
                        if((!dateClosedEligibility.equals(""))&&(!dateClosedEligibility.equals("NONE"))){
                            tokenizerForTempDate=new StringTokenizer(dateClosedEligibilityTextField.getText());
                            dateClosedEligibility=formatDateAsToDate(tokenizerForTempDate.nextToken());
                            
                        }else{
                            dateClosedEligibility="NONE";
                        }
                        
                        //lastModifiedEligibilityTextField.setText(getSystemDate());
                        lastModifiedEligibilityTextField.setText(getSystemDate()+" "+getSystemTime());
                        lastModifiedByEligibilityTextField.setText(globalLoggedInFirstName+" "+globalLoggedInLastName);
                        lastModifiedByEligibility=lastModifiedByEligibilityTextField.getText();
                        //modifiedByEligibility=lastModifiedEligibilityTextField.getText();
                        tokenizerForTempDate=new StringTokenizer(lastModifiedEligibilityTextField.getText());
                        modifiedByEligibility=formatDateAsToDate(tokenizerForTempDate.nextToken());
                        
			if(billableCheckBox.isSelected()){
				billableToggle="1";
			}
                    
			if(reportedForLast.equals("")){
				reportedForLast="null";
			}
			if(reportedForFirst.equals("")){
				reportedForFirst="null";
			}
                        if(assignedToLast.equals("")){
				assignedToLast="null";
			}
			if(assignedToFirst.equals("")){
				assignedToFirst="null";
			}
			if(emailAddressFor.equals("")){
				emailAddressFor="null";
			}
			
			if(dueDate.equals("")){
				dueDate=null;
			}
			if(resolution.equals("")){
				resolution=null;
			}
                       


                       /*---------------------------------------------------------------------
                        * Here I start checking for all the mandatory fields. If any one is missing
                        * an alert message is poped up.
                        *----------------------------------------------------------------------*/
                        
                        
                        
                        
			if(localCaseNumber.equals("")){
				alertMessage.displayMessages("Please fill the Case Number ");
				somethingWrong=true;
			}else{
				if(hours.equals("")){
					alertMessage.displayMessages("Please fill hours");
					somethingWrong=true;
				}else{
			    	if(reportedByLast.equals("")){
						alertMessage.displayMessages("Please fill Reported by Last Name");
						somethingWrong=true;
					}else{
						if(reportedByFirst.equals("")){
							alertMessage.displayMessages("Please fill Reported by First Name");
							somethingWrong=true;
						}else{
					    	if(emailAddressBy.equals("")){
								alertMessage.displayMessages("Please fill Email Address");
								somethingWrong=true;
							}else{
								if(reportedForLast.equals("")){
									alertMessage.displayMessages("Please fill Reported for Last Name");
									somethingWrong=true;
								}else{
									if(reportedForFirst.equals("")){
										alertMessage.displayMessages("Please fill Reported for First Name");
										somethingWrong=true;
									}else{
										if(emailAddressFor.equals("")){
											alertMessage.displayMessages("Please fill Email Address");
											somethingWrong=true;
										}else{
											if(company.equals("")){
												alertMessage.displayMessages("Please fill Company");
												somethingWrong=true;
											}else{
												if(assignedToLast.equals("")){
													alertMessage.displayMessages("Please fill Assigned to Last Name");
													somethingWrong=true;
												}else{
													if(assignedToFirst.equals("")){
														alertMessage.displayMessages("Please fill Assigned to First Name");
														somethingWrong=true;
													}else{
														if(subject.equals("")){
															alertMessage.displayMessages("Please fill Subject");
															somethingWrong=true;
														}else{
															/*if(dueDate.equals("")){
																alertMessage.displayMessages("Please fill DueDate");
																somethingWrong=true;
															}else{
																if(resolution.equals("")){
																	alertMessage.displayMessages("Please fill Resolution");
																	somethingWrong=true;
																}else{*/
																	if(discription.equals("")){
																		alertMessage.displayMessages("Please fill Description");
																		somethingWrong=true;
																	}else{
																		if(dueDate!=null){
																			StringTokenizer tokenizerForDate=new StringTokenizer(dueDate);
																			if(tokenizerForDate.countTokens()!=1){
																				alertMessage.displayMessages("Invalid Date Format. Example Date: 22-feb-2001");
																				somethingWrong=true;
																			}else{
																				tokenizerForDate=new StringTokenizer(dueDate,"-");
																				tempDate=tokenizerForDate.nextToken();
																				if((day=tempDate.length())>2){
																					alertMessage.displayMessages("Invalid Day. Example Date: 22-feb-2001");
																					somethingWrong=true;
																				}else{
																					//if((Integer.parseInt(tempDate))>31){
																					month=tokenizerForDate.nextToken();
																					year=tokenizerForDate.nextToken();
																					if(!(validateDay(tempDate,month,year))){
																						//alertMessage.displayMessages("Invalid Day. Example Date: 22-feb-2001");
																						somethingWrong=true;
																						}/*else{
																						tempDate=month;
																						
																							if((!tempDate.equals("jan"))&&(!tempDate.equals("feb"))&&(!tempDate.equals("mar"))&&(!tempDate.equals("apr"))&&(!tempDate.equals("may"))&&(!tempDate.equals("jun"))&&(!tempDate.equals("jul"))&&(!tempDate.equals("aug"))&&(!tempDate.equals("sep"))&&(!tempDate.equals("oct"))&&(!tempDate.equals("nov"))&&(!tempDate.equals("dec"))){
																									alertMessage.displayMessages("Invalid Month. Example Date: 22-feb-2001");
																								somethingWrong=true;
																							}else{
																								if(year.length()!=4){
																									alertMessage.displayMessages("Invalid Year. Example Date: 22-feb-2001");
																									somethingWrong=true;
																								}
																							}					
																						}*/
																					}
																				}
																			}
																		}
																	}
																//}
															//}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
                       
                        /*---------------------------------------------------------------------
                         * Here I am checking for hours to be a float. If it is not then
                         * an alert message is poped up. I do the smae checkon parent case number
                         * and also check for resolution to be a number.
                         *----------------------------------------------------------------------*/
                       
                        
                        if(!checkFloat(hours)){
                            alertMessage.displayMessages("Hours  not a number");
                            somethingWrong=true;
                        
                        }else{
                            if(!resolutionTextField.getText().equals("")){ 
                                if(!checkFloat(resolution)){
                                     alertMessage.displayMessages("Resolution  not a number");
                                     somethingWrong=true;
                        
                                }
                            }
                            if(!parentCaseNumberTextField.getText().equals("")){ 
                                if(!checkFloat(parentCaseNumber)){
                                     alertMessage.displayMessages("Parent case not a number");
                                     somethingWrong=true;
                        
                                }
                            }
                        }
                        
                        /*---------------------------------------------------------------------
                         * Here I am checking if due date is not null then it should be in a 
                         * to_date format which is a function call in sql statement.
                         *----------------------------------------------------------------------*/
                       
                        if(dueDate!=null){
				//dueDate="'"+dueDate+"'";
                            dueDate=formatDateAsToDate(dueDate);
			}
                        
			if(!somethingWrong){
                            StringTokenizer tokenizerForSubject=new StringTokenizer(subject,"'");
                            String tempSubject="";
                            int numberOfTokensForSubject=tokenizerForSubject.countTokens();
                                for(i=0;i<numberOfTokensForSubject;i++){
                                    if(i<(numberOfTokensForSubject-1)){
                                        tempSubject=tempSubject+tokenizerForSubject.nextToken()+"`";
                                    }else{
                                        tempSubject=tempSubject+tokenizerForSubject.nextToken();
                                    }
                                }
                                subject=tempSubject;
		
                            if(!parentCaseNumberTextField.getText().equals("")){ 
                                String tempHours="";
                                sqlQuery="sqlHiddenField="+SQLQueries.getParentCaseQuery(parentCaseNumber)+"&numberHiddenField=1&numberOfResultsHiddenField=1"; 
				dataRecieved=genericConnection(sqlQuery);
                                headerLength=getHeaderLength(dataRecieved);
				tempHours=dataRecieved[headerLength+1];	
                                if(tempHours.equals("null")){
                                    alertMessage.displayMessages("Invalid Parent case ");
                                     somethingWrong=true;
                        
                                }
                            }
                        }
                        if(!somethingWrong){
                       /*---------------------------------------------------------------------
                        * If everthing is correct so far then I again display a timer message
                        * first an then stores all the email address of also email field
                        * in avariable with comma seperated.
                        *----------------------------------------------------------------------*/
                       
                           if(!caseNumberTextField.getText().equals("")){
                                saveNotesButton.setEnabled(true);
                                newNotesButton.setEnabled(true);
                                deleteNotesButton.setEnabled(true);
                                saveAndEmailNotesButton.setEnabled(true);
                            
                                TimerMessage timerMessage=new TimerMessage();
                                timerMessage.displayMessages("Please be patient while applet saves all the data");
                                timerMessage.start();
                                    
                                 if(!alsoEmail.equals("")){
                                       
                                        finalEmail=finalEmail+",";
                                        
                                        StringTokenizer tokenizerForEmail=new StringTokenizer(alsoEmail," ,");
                                        int numberOfEmailTokens=tokenizerForEmail.countTokens();
                                       
                                        for(i=0;i<numberOfEmailTokens;i++){
                                            tempToken=tokenizerForEmail.nextToken();
                                            /*hasAtTheRate=false;
                                            for(j=0;j<tempToken.length();j++){
                                                if(tempToken.charAt(j)=='@'){
                                                    hasAtTheRate=true;
                                                    break;
                                                }
                                            }
                                        
                                            if(!hasAtTheRate){
                                                tempToken=tempToken.trim()+"@i2.com";
                                            }*/
                                            tempToken=tempToken.trim();
                                    
                                            finalAlsoEmail=finalAlsoEmail+tempToken;
                                            if(i<(numberOfEmailTokens-1)){
                                    
                                                finalAlsoEmail=finalAlsoEmail+",";
                                            }
                                        }
                                        
                                    }
                                    
                                
                                
			
				if(reportedForLastTextField.getText().equals("")){
					globalEmailAddressFor="";
				}
                                

                                /*---------------------------------------------------------------------
                                 * Before saving the reported by ,reported for and assigned to person
                                 * inforamtion I first retrive thier personIds by using getPersonIdQuery method
                                 * in SQLQueries class. Please check this method for additional information and the query.
                                 * After retriving all that ids I make sure that all of them correspond to the
                                 * correct person like reported by id should correspond to reported by person.
                                 * In the next 150 lines of code this function is performed. Please dont change any of 
                                 * the if statements here untill you are sure of what is excatly meant.
                                 *----------------------------------------------------------------------*/
                       
                                
				sqlQuery="sqlHiddenField="+SQLQueries.getPersonIdQuery(reportedByFirst,reportedByLast,globalEmailAddressBy,reportedForFirst,reportedForLast,globalEmailAddressFor,assignedToFirst,assignedToLast,globalEmailAddressTo)+"&numberHiddenField=1&numberOfResultsHiddenField=3"; 
				dataRecieved=genericConnection(sqlQuery);
                                headerLength=getHeaderLength(dataRecieved);
                                if(checkInteger(dataRecieved[headerLength])){
                                    lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
                                    if((reportedByLast.equals(reportedForLast))&&(reportedByFirst.equals(reportedForFirst))){
                                    	noOfRecords=2;
					equalityCase=2;
					if((reportedByLast.equals(assignedToLast))&&(reportedByFirst.equals(assignedToFirst))){
						noOfRecords=1;
						equalityCase=1;
					}
                                    }else{
					if((reportedByLast.equals(assignedToLast))&&(reportedByFirst.equals(assignedToFirst))){
						equalityCase=4;
						noOfRecords=2;
					
					}else{
						if((reportedForLast.equals(assignedToLast))&&(reportedForFirst.equals(assignedToFirst))){
							noOfRecords=2;
							equalityCase=3;
						}else{
							noOfRecords=3;
							equalityCase=5;
						}
					}
                                    }
                                
				
                                    i=headerLength+1;
                                    personId=dataRecieved[i];
                                    if(equalityCase==1){
                                    	reportedById=personId;
					reportedForId=personId;
					assignedToId=personId;			
                                    }
                                    if(equalityCase==2){
					i++;
					firstName=dataRecieved[i];
					i++;
					lastName=dataRecieved[i];
					if((firstName.equals(reportedByFirst))&&(lastName.equals(reportedByLast))){
						reportedById=personId;
						reportedForId=personId;
						i++;
						assignedToId=dataRecieved[i];
					}else{
						assignedToId=personId;
						i++;
						reportedById=dataRecieved[i];
						reportedForId=dataRecieved[i];
					}
				
				
			
                                    }
                            	if(equalityCase==3){
					i++;
					firstName=dataRecieved[i];
					i++;
					lastName=dataRecieved[i];
					if((firstName.equals(reportedForFirst))&&(lastName.equals(reportedForLast))){
						assignedToId=personId;
						reportedForId=personId;
						i++;
						reportedById=dataRecieved[i];
					}else{
						reportedById=personId;
						i++;
						assignedToId=dataRecieved[i];
						reportedForId=dataRecieved[i];
					}
				
				
			
                                    }
			
                                    if(equalityCase==4){
					i++;
					firstName=dataRecieved[i];
					i++;
					lastName=dataRecieved[i];
					if((firstName.equals(reportedByFirst))&&(lastName.equals(reportedByLast))){
						assignedToId=personId;
						reportedById=personId;
						i++;
						reportedForId=dataRecieved[i];
					}else{
						reportedForId=personId;
						i++;
						assignedToId=dataRecieved[i];
						reportedById=dataRecieved[i];
					}
				
				
			
                                    }
			
                                    if(equalityCase==5){
					i++;
					firstName=dataRecieved[i];
					i++;
					lastName=dataRecieved[i];
					if((firstName.equals(reportedByFirst))&&(lastName.equals(reportedByLast))){
						reportedById=personId;
						i++;
						personId1=dataRecieved[i];
						i++;
						firstName1=dataRecieved[i];
						i++;
						lastName1=dataRecieved[i];
						if((firstName1.equals(reportedForFirst))&&(lastName1.equals(reportedForLast))){
							reportedForId=personId1;
							i++;
							assignedToId=dataRecieved[i];
						}else{
							assignedToId=personId1;
							i++;
							reportedForId=dataRecieved[i];
						}
					
					}else{
						if((firstName.equals(reportedForFirst))&&(lastName.equals(reportedForLast))){
							reportedForId=personId;
							i++;
							personId1=dataRecieved[i];
							i++;
							firstName1=dataRecieved[i];
							i++;
							lastName1=dataRecieved[i];
							if((firstName1.equals(reportedByFirst))&&(lastName1.equals(reportedByLast))){
								reportedById=personId1;
								i++;
								assignedToId=dataRecieved[i];
							}else{
								assignedToId=personId1;
								i++;
								reportedById=dataRecieved[i];
							}
						
						}else{
							if((firstName.equals(assignedToFirst))&&(lastName.equals(assignedToLast))){
								assignedToId=personId;
								i++;
								personId1=dataRecieved[i];
								i++;
								firstName1=dataRecieved[i];
								i++;
								lastName1=dataRecieved[i];
								if((firstName1.equals(reportedByFirst))&&(lastName1.equals(reportedByLast))){
									reportedById=personId1;
									i++;
									reportedForId=dataRecieved[i];
								}else{
									reportedForId=personId1;
									i++;
									reportedById=dataRecieved[i];
								}
						
							}else{
								System.out.println("Name is not valid");
							}
									
						}
					
                                            }
				
                                    }
                                }
				
                                /*---------------------------------------------------------------------
                                 * In the next few lines of code I am retriving siteId corresponding to
                                 * the company and site selected bu the user. As this information is to be 
                                 * for storing the site and company in the database. For more information
                                 * about the sql query look into getSiteIdQuery method of SQLQueries class.
                                 * Futher I am retriving product id of the selected product too. This is done by 
                                 * getProductIdQuery method in the SQLQueries class.
                                 *----------------------------------------------------------------------*/
                           
                                
				sqlQuery="sqlHiddenField="+SQLQueries.getSiteIdQuery(company,site)+"&numberHiddenField=1&numberOfResultsHiddenField=1"; 
				dataRecieved=genericConnection(sqlQuery);
                                headerLength=getHeaderLength(dataRecieved);
				siteId=dataRecieved[headerLength+1];
			
				sqlQuery="sqlHiddenField="+SQLQueries.getProductIdQuery(productLine,productRelease,version,localCaseNumber)+"&numberHiddenField=1&numberOfResultsHiddenField=2"; 
				dataRecieved=genericConnection(sqlQuery);
                                headerLength=getHeaderLength(dataRecieved);
				productId=dataRecieved[headerLength+1];	
				productReleaseId=dataRecieved[headerLength+2];	
                                


                                /*---------------------------------------------------------------------
                                 * Here every "'" in the description field is replaced by "`" since I user Mark's
                                 * oracle procedure to insert the description. And using "'" this in between the the description
                                 * which is a parameter to the procedure will behave as a end of the parameter. So this
                                 * is the quick and dirty way of removing overcoming this problem.
                                 *----------------------------------------------------------------------*/
                                
                                numberOfTokens=tokenizerForDescription.countTokens();
                                for(i=0;i<numberOfTokens;i++){
                                    if(i<(numberOfTokens-1)){
                                        tempDescription=tempDescription+tokenizerForDescription.nextToken()+"`";
                                    }else{
                                        tempDescription=tempDescription+tokenizerForDescription.nextToken();
                                    }
                                }
                                discription=tempDescription;
		
				//System.out.println("BY :"+reportedById+" FOR :"+reportedForId+" TO :"+assignedToId);
				
                                
                                /*---------------------------------------------------------------------
                                 * Here is where I start saving all the retrived data. All the data is passed as 
                                 * the parameters to the methods setNewCaseQuery,setUpdateProductLineQuery,
                                 * setAuditTrailQuery and setAuditTrailQuery. Please look into these mathods
                                 * in SQLQueries  class for the sql queries. The first if statement also checks 
                                 * if a new case is generated or an old one is being updated.
                                 *----------------------------------------------------------------------*/
                           
                                
				if((caseNumber.equals(localCaseNumber))&&(newOrOld)){
					
                                    //sqlQuery="sqlHiddenField="+SQLQueries.setNewCaseQuery(hours,billableToggle,emailDetails,visibility,solution,service,subject,status,type,source,severity,priority,resolution,dueDate,parentCaseNumber,reportedById,reportedForId,assignedToId,siteId,productId,productReleaseId,globalCustomerId,localCaseNumber)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                                    sqlQuery="sqlHiddenField="+SQLQueries.setNewCaseQuery(hours,billableToggle,emailDetails,visibility,solution,service,subject,status,type,source,severity,priority,resolution,dueDate,parentCaseNumber,reportedById,reportedForId,assignedToId,siteId,productId,productReleaseId,globalCustomerId,dateEnteredEligibility,enteredByEligibility,modifiedByEligibility,lastModifiedByEligibility,dateClosedEligibility,finalAlsoEmail,localCaseNumber)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                                    dataRecieved=genericConnection(sqlQuery);
                                    headerLength=getHeaderLength(dataRecieved);
                                    sqlQuery="sqlHiddenField="+SQLQueries.setUpdateProductLineQuery(productId,localCaseNumber)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                                    dataRecieved=genericConnection(sqlQuery);
                                    headerLength=getHeaderLength(dataRecieved);
                                    sqlQuery="sqlHiddenField="+SQLQueries.setAuditTrailQuery(localCaseNumber,(globalLoggedInFirstName+" "+globalLoggedInLastName),"SWPRODUCT","null",productLine)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                                    dataRecieved=genericConnection(sqlQuery);
                                    headerLength=getHeaderLength(dataRecieved);
                                    sqlQuery="sqlHiddenField="+SQLQueries.setAuditTrailQuery(localCaseNumber,(globalLoggedInFirstName+" "+globalLoggedInLastName),"SWSTATUS","null",status)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                                    dataRecieved=genericConnection(sqlQuery);
                                    headerLength=getHeaderLength(dataRecieved);
                                    //sqlQuery="sqlHiddenField="+SQLQueries.setEligibilityNewCaseQuery(dateEnteredEligibility,enteredByEligibility,modifiedByEligibility,lastModifiedByEligibility,dateClosedEligibility,localCaseNumber)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                                    //dataRecieved=genericConnection(sqlQuery);
                                        
					
				}else{	
					
                                         sqlQuery="sqlHiddenField="+SQLQueries.setCaseQuery(hours,billableToggle,emailDetails,visibility,solution,service,subject,status,type,source,severity,priority,resolution,dueDate,parentCaseNumber,reportedById,reportedForId,assignedToId,siteId,productId,productReleaseId,globalCustomerId,dateEnteredEligibility,enteredByEligibility,modifiedByEligibility,lastModifiedByEligibility,dateClosedEligibility,finalAlsoEmail,localCaseNumber)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                                         dataRecieved=genericConnection(sqlQuery);
                                         headerLength=getHeaderLength(dataRecieved);
                                         if(!globalOldProductName.equals(productLine)){
                                            sqlQuery="sqlHiddenField="+SQLQueries.setAuditTrailQuery(localCaseNumber,(globalLoggedInFirstName+" "+globalLoggedInLastName),"SWPRODUCT",globalOldProductName,productLine)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                                            dataRecieved=genericConnection(sqlQuery);
                                            headerLength=getHeaderLength(dataRecieved);
                                        
                                        }
                                        if(!globalOldStatus.equals(status)){
                                            sqlQuery="sqlHiddenField="+SQLQueries.setAuditTrailQuery(localCaseNumber,(globalLoggedInFirstName+" "+globalLoggedInLastName),"SWSTATUS",globalOldStatus,status)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                                            dataRecieved=genericConnection(sqlQuery);
                                            headerLength=getHeaderLength(dataRecieved);
                                        }
                                         //sqlQuery="sqlHiddenField="+SQLQueries.setEligibilityUpdateCaseQuery(dateEnteredEligibility,enteredByEligibility,modifiedByEligibility,lastModifiedByEligibility,dateClosedEligibility,localCaseNumber)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                                         //dataRecieved=genericConnection(sqlQuery);
                                         
					
				}
                                
                                
                                
                                
                                globalOldProductName=productLine;
                                globalOldStatus=status;
                                
                                /*---------------------------------------------------------------------
                                 * Here I am saving the description using another query which uses mark's oracle
                                 * procedurre. The reason for using that procedure is to be able to insert as
                                 * long data as user wants without any restriction on the length. This is done in 
                                 * setDescriptionQuery method. Finally I save the person information like email
                                 * phone using another method setNameAndInfoQuery. The reason for this is that the
                                 * user might change the person information also while updating or creating the case.
                                 * That information has to be saved. Look at setNameAndInfoQuery method in 
                                 * SQLQueries class for more detail.
                                 *----------------------------------------------------------------------*/
                           
                                
                                sqlQuery="sqlHiddenField="+SQLQueries.setDescriptionQuery(discription,localCaseNumber)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
				dataRecieved=genericConnection(sqlQuery);
			
				if((equalityCase==1)||((equalityCase==2))){
					sqlQuery="sqlHiddenField="+SQLQueries.setNameAndInfoQuery(reportedByFirst,reportedByLast,emailAddressBy,areaBy,localBy,countryBy,extentionBy,globalEmailAddressBy)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
					dataRecieved=genericConnection(sqlQuery);
				
				}else{
					sqlQuery="sqlHiddenField="+SQLQueries.setNameAndInfoQuery(reportedByFirst,reportedByLast,emailAddressBy,areaBy,localBy,countryBy,extentionBy,globalEmailAddressBy)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
					dataRecieved=genericConnection(sqlQuery);
					sqlQuery="sqlHiddenField="+SQLQueries.setNameAndInfoQuery(reportedForFirst,reportedForLast,emailAddressFor,areaFor,localFor,countryFor,extentionFor,globalEmailAddressFor)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
					dataRecieved=genericConnection(sqlQuery);
			
				}
			
                                //if(!alsoEmail.equals("")){
                                    
                                    
                                    /*if(emailAddressBy.equals(emailAddressFor)){
                                        finalEmail=emailAddressBy;
                                    }else{
                                        finalEmail=emailAddressBy+","+emailAddressFor;
                                    }
                                    if((!emailAddressBy.equals(globalEmailAddressTo))&&(!emailAddressFor.equals(globalEmailAddressTo))&&(!assignedToLast.equals("null"))&&(!assignedToFirst.equals("null"))){
                                        finalEmail=finalEmail+","+globalEmailAddressTo;
                                    }*/
                                    finalEmail=getByForToEmail(emailAddressBy,emailAddressFor);
                                   //ystam.out.println("by to and for email"+finalEmail);
                                    byForToEmail=finalEmail;
                                    tempNewOrOld=newOrOld;
                                    
                                    subject=globalLoggedInFirstName+" "+globalLoggedInLastName+" Company: "+company+" ";
                                    discription=globalLoggedInFirstName+" "+globalLoggedInLastName+" "+" (Company :"+company+")";
                                    
                                 /*---------------------------------------------------------------------
                                  * Here I generate the email which has to be send to the described people.
                                  * Here I am making the subject and decription which contains all the details
                                  * of that case. Finally I call handlePager and handleAction method in this class
                                  * only which performs all the insertion into the database. Look into these
                                  * methods for details.
                                  *----------------------------------------------------------------------*/
                           
                                    
                                    
                                    if((caseNumber.equals(localCaseNumber))&&(newOrOld)){
                                        subject=subject+"Created New Case :";
                                        discription=discription+" has added a new case: ";
                                        
                                        newOrOld=false;
                                    }else{
                                        subject=subject+"Updated Old Case :";
                                        discription=discription+" has updated an old case: ";
                                    }
                                    discription=discription+localCaseNumber+" from support web. Please forward this to the appropriate team, if this does not belong to your team.\n\nThis is an automated email. Please do not reply to this email address. To update this case please go to http://support.i2.com. \n\n\n";
                                    discription=discription+"Case Number: "+localCaseNumber+"\nReported By :"+reportedByFirst+" "+reportedByLast+"\nCompany :"+company+"\nSite :"+site+"\nProduct Line :"+productLine+"\nProduct Release :"+productRelease+"\nVersion :"+version+"\nSubject :"+subjectTextField.getText()+"\nStatus :"+status+"\nType :"+type+"\nSeverity :"+severity+"\nPriority :"+priority;
                                    subject=subject+localCaseNumber+" (Status: "+status+") ";
                                    subject=subject+" Severity: "+severity+" Product: "+productLine+" Sub: "+subjectTextField.getText();
                                    
                                    
                                    if(!globalCustomerId.equals("null")){
                                        sqlQuery="sqlHiddenField="+SQLQueries.getEvSupportTypeQuery(globalCustomerId)+"&numberHiddenField=1&numberOfResultsHiddenField=1"; 
                                        dataRecieved=genericConnection(sqlQuery);
                                        headerLength=getHeaderLength(dataRecieved);
                                        globalEvSupportType=dataRecieved[headerLength+1];
                                    }
                                    if(tempNewOrOld){
                                        handlePager(localCaseNumber,subjectTextField.getText(),(globalLoggedInFirstName+" "+globalLoggedInLastName),severity,productLine);
                                    }
                                    
                                    handleAction(byForToEmail,finalAlsoEmail,visibility,localCaseNumber,discription,subject,status);
                                    timerMessage.disposeTimer();
                        
                                    
                                    
			
                            }else{

                                   alertMessage.displayMessages("Invalid case Number"); 
                            }
                        }
                    }
			
			
		}
			
			
		if(STR.equals("New")){
                 /*---------------------------------------------------------------------
                  * Here I am checking for the action from goto new button. 
                  * If the action is generated on this button then clearTextFields and
                  * initialize methods are called which just first clear all the text fields and
                  * the required combo boxes and the initializes some of them with some default values.
                  * For more information look in to the these method.
                  *----------------------------------------------------------------------*/
                    
			newOrOld=true;
			clearTextFields();
			initialize(true);
			
		}
                
                if(STR.equals("New Note")){
               
                 /*---------------------------------------------------------------------
                  * Here I am checking for the action from goto new Note button. 
                  * If the action is generated on this button then the listed text fields are 
                  * cleared.
                  *----------------------------------------------------------------------*/
                 
                    enteredByNotesTextField.setText(globalLoggedInFirstName+" "+globalLoggedInLastName);
                    dateEnteredNotesTextField.setText(getSystemDate()+" "+getSystemTime());
                    subjectNotesTextField.setText("");
                    descriptionNotesTextArea.setText("");
                    subjectNotesTextField.requestFocus();
                    newOrOldNotes=true;
				
		}
                
                
                if(STR.equals("Save Note and Email")){
                 /*---------------------------------------------------------------------
                  * Here I am checking for the action from Save Note and Email button. 
                  * If the action is generated on this button then first of all I retrive all
                  * the information from the notes tab onto the variables. Then I check
                  * for the information which is mandatory. If it is not preasent then an alert message is 
                  * poped up displaying the proper message. Only if ever value retrived is 
                  * correct , I go foward to save the information in the database. otherwise
                  * I skip all the code. More information will be found along the code.
                  *----------------------------------------------------------------------*/
                     
                    
                    int numberOfTokens=0;
                    int i=0;
                    int j=0;
                    boolean somethingWrong=false;
                    String sqlQuery="";
                    String[] dataRecieved;
                    
                    String workLogId="";
                    String personId="22222";
                    String caseNumber=caseNumberTextField.getText();
                    String subject=subjectNotesTextField.getText();
                    String description=descriptionNotesTextArea.getText();
                    String company=companyTextField.getText();
                    String createdBy=enteredByNotesTextField.getText();
                    String visibility=(String)visibilityNotesComboBox.getSelectedItem();
                    String status=(String)statusComboBox.getSelectedItem();
                    String productLine=(String)productLineComboBox.getSelectedItem();
                    String severity=(String)severityComboBox.getSelectedItem();
                    
                    String tempDescription="";
                    String alsoEmail="";
                    String finalAlsoEmail="";
                    String tempToken="";
                    String discription="";
                    
                    
                    
                    StringTokenizer tokenizerForDescription=new StringTokenizer(description,"'");
                    
                    if(createdBy.equals("")){
                        somethingWrong=true;
                        alertMessage.displayMessages("Created By Field is empty");
                    }else{
                        if(subject.equals("")){
                            somethingWrong=true;
                            alertMessage.displayMessages("Please Enter subject");
                        }else{
                            if(description.equals("")){
                               somethingWrong=true;
                               alertMessage.displayMessages("Please Enter Note");
                            }
                        }
                    }
                    
                    if(!somethingWrong){
                        int selectedRow=notesTable.getSelectedRow();    
                        if((newOrOldNotes)||((!newOrOldNotes)&&(selectedRow<globalNumberOfNotes))){
                            TimerMessage timerMessage=new TimerMessage();
                            timerMessage.displayMessages("Kindly wait while applet saves this note and email");
                            timerMessage.start();
                            
                            StringTokenizer tokenizerForSubject=new StringTokenizer(subject,"'");
                            String tempSubject="";
                            int numberOfTokensForSubject=tokenizerForSubject.countTokens();
                                for(i=0;i<numberOfTokensForSubject;i++){
                                    if(i<(numberOfTokensForSubject-1)){
                                        tempSubject=tempSubject+tokenizerForSubject.nextToken()+"`";
                                    }else{
                                        tempSubject=tempSubject+tokenizerForSubject.nextToken();
                                    }
                                }
                                subject=tempSubject;
                        



                        /*---------------------------------------------------------------------
                         * Here I am checking wether it is a new note or on old note which 
                         * is bieng updated. After checking this setNotesQuery method in SQLQueries
                         * is called which performes the insertion into the database. After performing that
                         * those values are also displayed on the table.For more information look into
                         * this method.
                         *----------------------------------------------------------------------*/
                        
                        
                        if(newOrOldNotes){
                            
                            workLogId=getWorkLogId();
                            sqlQuery="sqlHiddenField="+SQLQueries.setNotesQuery(workLogId,globalLoggedInPersonId,caseNumber,createdBy,visibility,subject)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                            notesTable.setValueAt(visibility,globalNumberOfNotes,0);
                            notesTable.setValueAt(subject,globalNumberOfNotes,1);
                            notesTable.setValueAt(createdBy,globalNumberOfNotes,2);
                            notesTable.setValueAt(dateEnteredNotesTextField.getText(),globalNumberOfNotes,3);
                            notesTable.setRowSelectionInterval(globalNumberOfNotes,globalNumberOfNotes);
                            globalNumberOfNotes++;
                            String tempSubjects[]=new String[globalNumberOfNotes];
                            String tempLogId[]=new String[globalNumberOfNotes];
                            
                            for(i=0;i<(globalNumberOfNotes-1);i++){
                                tempSubjects[i]=globalNotes[i];
                                tempLogId[i]=globalWorkLogId[i];
                            }
                            tempSubjects[globalNumberOfNotes-1]=description;
                            tempLogId[globalNumberOfNotes-1]=workLogId;;
                            globalNotes=tempSubjects;
                            globalWorkLogId=tempLogId;
                            
                            
                            
                        }else{
                        /*---------------------------------------------------------------------
                         * Here if it is an old note then setUpdateNotesQuery method in SQLQueries
                         * is called which performes the updation into the database. After performing that
                         * those values are also displayed on the table. For more information look into
                         * this method.
                         *----------------------------------------------------------------------*/
                        
                            //int selectedRow=notesTable.getSelectedRow();
                            
                            if(selectedRow<globalNumberOfNotes){
                                workLogId=globalWorkLogId[selectedRow];
                                sqlQuery="sqlHiddenField="+SQLQueries.setUpdateNotesQuery(workLogId,caseNumber,visibility,subject)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                                notesTable.setValueAt(visibility,selectedRow,0);
                                notesTable.setValueAt(subject,selectedRow,1);
                                globalNotes[selectedRow]=description;
                            }
                        }
 
                        /*---------------------------------------------------------------------
                          * Here every "'" in the description field is replaced by "`" since I user Mark's
                          * oracle procedure to insert the description. And using "'" this in between the the description
                          * which is a parameter to the procedure will behave as a end of the parameter. So this
                          * is the quick and dirty way of removing overcoming this problem.
                          *----------------------------------------------------------------------*/
                        
                            numberOfTokens=tokenizerForDescription.countTokens();
                            for(i=0;i<numberOfTokens;i++){
                                if(i<(numberOfTokens-1)){
                                    tempDescription=tempDescription+tokenizerForDescription.nextToken()+"`";
                                }else{
                                    tempDescription=tempDescription+tokenizerForDescription.nextToken();
                                }
                            }
                            description=tempDescription;
                        /*---------------------------------------------------------------------
                         * Here I am saving the description using another query which uses mark's oracle
                         * procedurre. The reason for using that procedure is to be able to insert as
                         * long data as user wants without any restriction on the length. This is done in 
                         * setCommentQuery method. 
                         *----------------------------------------------------------------------*/
                           
                        
                        
                        
                            dataRecieved=genericConnection(sqlQuery);
                            sqlQuery="sqlHiddenField="+SQLQueries.setCommentQuery(description,workLogId)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                            dataRecieved=genericConnection(sqlQuery);
                        
                            subject=globalLoggedInFirstName+" "+globalLoggedInLastName+" Company: "+company+" ";
                            discription=globalLoggedInFirstName+" "+globalLoggedInLastName+" "+" (Company :"+company+")";
                                    
                            if(newOrOldNotes){
                                 subject=subject+"Created New Note :";
                                 discription=discription+" has created new note: ";
                                  newOrOldNotes=false;
                             }else{
                                subject=subject+"Updated Old Note :";
                                discription=discription+" has updated an old note: ";
                            }
                            discription=discription+caseNumber+" from support web. Please forward this to the appropriate team, if this does not belong to your team.\n\nThis is an automated email. Please do not reply to this email address. To update this case please go to http://support.i2.com. \n\n\n";
                            discription=discription+"Case Number: "+caseNumber+"\nReported By :"+reportedByFirstTextField.getText()+" "+reportedByLastTextField.getText()+"\nCompany :"+company+"\nSite :"+(String)siteComboBox.getSelectedItem()+"\nProduct Line :"+productLine+"\nProduct Release :"+(String)productReleaseComboBox.getSelectedItem()+"\nVersion :"+(String)versionComboBox.getSelectedItem()+"\nSubject :"+subjectNotesTextField.getText()+"\nStatus :"+status+"\nType :"+(String)typeComboBox.getSelectedItem()+"\nSeverity :"+severity+"\nPriority :"+(String)priorityComboBox.getSelectedItem();
                            subject=subject+caseNumber+" (Status: "+(String)statusComboBox.getSelectedItem()+") ";
                            subject=subject+" Severity: "+severity+" Product: "+productLine+" Sub: "+subjectNotesTextField.getText();
                        
                        
                        
                        
                        
                            if(!(alsoEmail=alsoEmailTextField.getText()).equals("")){
                                    StringTokenizer tokenizerForEmail=new StringTokenizer(alsoEmail," ,");
                                    int numberOfEmailTokens=tokenizerForEmail.countTokens();
                                   
                                    for(i=0;i<numberOfEmailTokens;i++){
                                        tempToken=tokenizerForEmail.nextToken();                                          
                                   
                                        tempToken=tempToken.trim();
                                        
                                        finalAlsoEmail=finalAlsoEmail+tempToken;
                                        if(i<(numberOfEmailTokens-1)){                                        
                                               finalAlsoEmail=finalAlsoEmail+",";
                                        }
                                    }
                                        
                                }
                        
                        
                        
                            handleAction(getByForToEmail(emailAddressByTextField.getText(),emailAddressForTextField.getText()),finalAlsoEmail,(String)visibilityComboBox.getSelectedItem(),caseNumberTextField.getText(),discription,subject,(String)statusComboBox.getSelectedItem());
                            notesTable.repaint();
                            timerMessage.disposeTimer();
                        }else{
                            alertMessage.displayMessages("Please select the row to update or click new notes botton");
                        }
                         
			
                    }

                    
			
		}
                
                
                if(STR.equals("Save Note")){
                 /*---------------------------------------------------------------------
                  * Here I am checking for the action from Save Note button. 
                  * If the action is generated on this button then first of all I retrive all
                  * the information from the notes tab onto the variables. Then I check
                  * for the information which is mandatory. If it is not preasent then an alert message is 
                  * poped up displaying the proper message. Only if ever value retrived is 
                  * correct , I go foward to save the information in the database. otherwise
                  * I skip all the code. More information will be found along the code.
                  *----------------------------------------------------------------------*/
                     
                    
                    int numberOfTokens=0;
                    int i=0;
                    int j=0;
                    boolean somethingWrong=false;
                    String sqlQuery="";
                    String[] dataRecieved;
                    //String workLogId=getWorkLogId();
                    String workLogId="";
                    String personId="22222";
                    String caseNumber=caseNumberTextField.getText();
                    String subject=subjectNotesTextField.getText();
                    String description=descriptionNotesTextArea.getText();
                    String company=companyTextField.getText();
                    String createdBy=enteredByNotesTextField.getText();
                    String visibility=(String)visibilityNotesComboBox.getSelectedItem();
                    String status=(String)statusComboBox.getSelectedItem();
                    String productLine=(String)productLineComboBox.getSelectedItem();
                    String severity=(String)severityComboBox.getSelectedItem();
                    
                    String tempDescription="";
                    String alsoEmail="";
                    String finalAlsoEmail="";
                    String tempToken="";
                    String discription="";
                    
                    
                    
                    StringTokenizer tokenizerForDescription=new StringTokenizer(description,"'");
                    
                    if(createdBy.equals("")){
                        somethingWrong=true;
                        alertMessage.displayMessages("Created By Field is empty");
                    }else{
                        if(subject.equals("")){
                            somethingWrong=true;
                            alertMessage.displayMessages("Please Enter subject");
                        }else{
                            if(description.equals("")){
                               somethingWrong=true;
                               alertMessage.displayMessages("Please Enter Note");
                            }
                        }
                    }
                    
                    if(!somethingWrong){
                        int selectedRow=notesTable.getSelectedRow();    
                        if((newOrOldNotes)||((!newOrOldNotes)&&(selectedRow<globalNumberOfNotes))){
                            TimerMessage timerMessage=new TimerMessage();
                            timerMessage.displayMessages("Kindly wait while applet saves this note");
                            timerMessage.start();
                            StringTokenizer tokenizerForSubject=new StringTokenizer(subject,"'");
                            String tempSubject="";
                            int numberOfTokensForSubject=tokenizerForSubject.countTokens();
                                for(i=0;i<numberOfTokensForSubject;i++){
                                    if(i<(numberOfTokensForSubject-1)){
                                        tempSubject=tempSubject+tokenizerForSubject.nextToken()+"`";
                                    }else{
                                        tempSubject=tempSubject+tokenizerForSubject.nextToken();
                                    }
                                }
                                subject=tempSubject;
                            
                            
                            
                        /*---------------------------------------------------------------------
                         * Here I am checking wether it is a new note or on old note which 
                         * is bieng updated. After checking this setNotesQuery method in SQLQueries
                         * is called which performes the insertion into the database. After performing that
                         * those values are also displayed on the table.For more information look into
                         * this method.
                         *----------------------------------------------------------------------*/
                        
                        
                        if(newOrOldNotes){
                            
                            workLogId=getWorkLogId();
                            sqlQuery="sqlHiddenField="+SQLQueries.setNotesQuery(workLogId,globalLoggedInPersonId,caseNumber,createdBy,visibility,subject)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                            notesTable.setValueAt(visibility,globalNumberOfNotes,0);
                            notesTable.setValueAt(subject,globalNumberOfNotes,1);
                            notesTable.setValueAt(createdBy,globalNumberOfNotes,2);
                            notesTable.setValueAt(dateEnteredNotesTextField.getText(),globalNumberOfNotes,3);
                            notesTable.setRowSelectionInterval(globalNumberOfNotes,globalNumberOfNotes);
                            globalNumberOfNotes++;
                            String tempSubjects[]=new String[globalNumberOfNotes];
                            String tempLogId[]=new String[globalNumberOfNotes];
                            
                            for(i=0;i<(globalNumberOfNotes-1);i++){
                                tempSubjects[i]=globalNotes[i];
                                tempLogId[i]=globalWorkLogId[i];
                            }
                            tempSubjects[globalNumberOfNotes-1]=description;
                            tempLogId[globalNumberOfNotes-1]=workLogId;;
                            globalNotes=tempSubjects;
                            globalWorkLogId=tempLogId;
                            
                            
                            
                        }else{
                        /*---------------------------------------------------------------------
                         * Here if it is an old note then setUpdateNotesQuery method in SQLQueries
                         * is called which performes the updation into the database. After performing that
                         * those values are also displayed on the table. For more information look into
                         * this method.
                         *----------------------------------------------------------------------*/
                        
                            //int selectedRow=notesTable.getSelectedRow();
                            
                            if(selectedRow<globalNumberOfNotes){
                                workLogId=globalWorkLogId[selectedRow];
                                sqlQuery="sqlHiddenField="+SQLQueries.setUpdateNotesQuery(workLogId,caseNumber,visibility,subject)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                                notesTable.setValueAt(visibility,selectedRow,0);
                                notesTable.setValueAt(subject,selectedRow,1);
                                globalNotes[selectedRow]=description;
                            }
                        }
 
                        /*---------------------------------------------------------------------
                          * Here every "'" in the description field is replaced by "`" since I user Mark's
                          * oracle procedure to insert the description. And using "'" this in between the the description
                          * which is a parameter to the procedure will behave as a end of the parameter. So this
                          * is the quick and dirty way of removing overcoming this problem.
                          *----------------------------------------------------------------------*/
                        
                            numberOfTokens=tokenizerForDescription.countTokens();
                            for(i=0;i<numberOfTokens;i++){
                                if(i<(numberOfTokens-1)){
                                    tempDescription=tempDescription+tokenizerForDescription.nextToken()+"`";
                                }else{
                                    tempDescription=tempDescription+tokenizerForDescription.nextToken();
                                }
                            }
                            description=tempDescription;
                        /*---------------------------------------------------------------------
                         * Here I am saving the description using another query which uses mark's oracle
                         * procedurre. The reason for using that procedure is to be able to insert as
                         * long data as user wants without any restriction on the length. This is done in 
                         * setCommentQuery method. 
                         *----------------------------------------------------------------------*/
                           
                        
                        
                        
                            dataRecieved=genericConnection(sqlQuery);
                            sqlQuery="sqlHiddenField="+SQLQueries.setCommentQuery(description,workLogId)+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                            dataRecieved=genericConnection(sqlQuery);
                        
                            notesTable.repaint();
                            timerMessage.disposeTimer();
                        }else{
                            alertMessage.displayMessages("Please select the row to update or click new notes botton");
                        }
                         
			
                    }

                    
			
		}
                
                if(STR.equals("Delete Note")){
                /*---------------------------------------------------------------------
                 * Here I am checking for the action from delete Note button. 
                 * If the action is generated on this button then that note is deleteted
                 * from the database and then the notes table is also updated accordingly.
                 *----------------------------------------------------------------------*/
                 
                    int i=0;
                    String sqlQuery="";
                    String[] dataRecieved;
                    int selectedRow=notesTable.getSelectedRow();    
                    if((selectedRow>-1)&&(selectedRow<globalNumberOfNotes)){
                        TimerMessage timerMessage=new TimerMessage();
                        timerMessage.displayMessages("Kindly wait while applet deletes this note");
                        timerMessage.start();
                        sqlQuery="sqlHiddenField="+SQLQueries.deleteNoteQuery(globalWorkLogId[selectedRow])+"&numberHiddenField=2&numberOfResultsHiddenField=0"; 
                        dataRecieved=genericConnection(sqlQuery);
                       
                        getNotes(caseNumberTextField.getText());
                        i=globalNumberOfNotes;
                        notesTable.setValueAt("",i,0);
                        notesTable.setValueAt("",i,1);
                        notesTable.setValueAt("",i,2);
                        notesTable.setValueAt("",i,3);
                        
                        
                        if((selectedRow>-1)&&(selectedRow<globalNumberOfNotes)){
                            setValuesForNotes(selectedRow);
                        }
                        if(selectedRow==globalNumberOfNotes){
                            subjectNotesTextField.setText("");
                            descriptionNotesTextArea.setText("");
                            enteredByNotesTextField.setText(globalLoggedInFirstName+" "+globalLoggedInLastName);
                            dateEnteredNotesTextField.setText(getSystemDate()+" "+getSystemTime());
                        }
                        notesTable.repaint();
                        timerMessage.disposeTimer();
                    }else{
                        alertMessage.displayMessages("Please select the correct row on the table");
                    }
                }
			
			
			
	}
	
	void doActionsWhenTableName(){
                  /*---------------------------------------------------------------------
                   * In this method I display those people and thier respective information. Initially I retrive
                   * all the information from the table into the variables. Then I display those values
                   * on the text fields and the combo boxes if required. Before displaying it on the text 
                   * field I check for the which fields have to be populted. For eg reported by,
                   * reported for or assigned to text fields.
                   *----------------------------------------------------------------------*/
                  
        	int i=0;
			int rowNumberOfGlobalString=0;
			int rowNumber=genericTable.getSelectedRow();
			
			String lastName=(String)genericTable.getValueAt(rowNumber,0);
			String firstName=(String)genericTable.getValueAt(rowNumber,1);
			
			String country=(String)genericTable.getValueAt(rowNumber,2);
			String area=(String)genericTable.getValueAt(rowNumber,3);
			String phone=(String)genericTable.getValueAt(rowNumber,4);
			String extention=(String)genericTable.getValueAt(rowNumber,5);
			String emailAddress=(String)genericTable.getValueAt(rowNumber,6);
			
			for(i=0;i<genericTable.getRowCount();i++){
				if((lastName.equals(globalStringAtEachCellOfGenericTable[i][0]))&&(firstName.equals(globalStringAtEachCellOfGenericTable[i][1]))&&(emailAddress.equals(globalStringAtEachCellOfGenericTable[i][6]))&&(country.equals(globalStringAtEachCellOfGenericTable[i][2]))&&(area.equals(globalStringAtEachCellOfGenericTable[i][3]))&&(phone.equals(globalStringAtEachCellOfGenericTable[i][4]))&&(extention.equals(globalStringAtEachCellOfGenericTable[i][5]))){
					rowNumberOfGlobalString=i;
					break;
				}
								
			}
			
			
			
			
			String siteId=globalStringAtEachCellOfGenericTable[rowNumberOfGlobalString][10];
			String customerId=globalStringAtEachCellOfGenericTable[rowNumberOfGlobalString][11];
			
			String sqlQuery="";
			String itemValueZero="";
			String[] dataRecieved;
			
			if (byOrForFlag==1){
				if(!lastName.equals("null")){
					reportedByLastTextField.setText(lastName);			
				}
				if(!firstName.equals("null")){
					reportedByFirstTextField.setText(firstName);
				}
				if(!area.equals("null")){
					areaByTextField.setText(area);
				}
				if(!country.equals("null")){
					countryByTextField.setText(country);
				}
				if(!emailAddress.equals("null")){
					emailAddressByTextField.setText(emailAddress);
					globalEmailAddressBy=emailAddress;
				}
				if(!phone.equals("null")){
					localByTextField.setText(phone);
				}
				
				emailAddressByTextField.setEditable(true);
				countryByTextField.setEditable(true);
				areaByTextField.setEditable(true);
				localByTextField.setEditable(true);
				extentionByTextField.setEditable(true);
				reportedForLastTextField.setEditable(true);
				reportedForFirstTextField.setEditable(true);
				
				//reportedForLastTextField.requestFocus();

				keyPressedBy=false;


		
		
		
				
				
			}
			if ((byOrForFlag==0)||(byOrForFlag==1)){
				if(!lastName.equals("null")){
					reportedForLastTextField.setText(lastName);			
				}
				if(!firstName.equals("null")){
					reportedForFirstTextField.setText(firstName);
				}
				if(!area.equals("null")){
					areaForTextField.setText(area);
				}
				if(!country.equals("null")){
					countryForTextField.setText(country);
				}
				if(!emailAddress.equals("null")){
					emailAddressForTextField.setText(emailAddress);
					globalEmailAddressFor=emailAddress;
				}
				if(!phone.equals("null")){
					localForTextField.setText(phone);
				}
				emailAddressForTextField.setEditable(true);
				countryForTextField.setEditable(true);
				areaForTextField.setEditable(true);
				localForTextField.setEditable(true);
				extentionForTextField.setEditable(true);
				/*if(byOrForFlag==0){
					companyTextField.requestFocus();
				}*/
				
				keyPressedFor=false;
                                globalCustomerId=customerId;
                                
				
				
			}
			
			if (byOrForFlag==2){
				if(!lastName.equals("null")){
					assignedToLastTextField.setText(lastName);
				}
				if(!firstName.equals("null")){
					assignedToFirstTextField.setText(firstName);
					globalEmailAddressTo=emailAddress;
                                       if(((String)statusComboBox.getSelectedItem()).equals("Unassigned")){
                                            statusComboBox.select("Open");
                                       }
				}
				
				productLineComboBox.requestFocus();
				keyPressedTo=false;
				
		
			}
			
                        /*---------------------------------------------------------------------
                         * Here i call getCompanyAndSite method which gets the company and site for that
                         * particular person who has been selected from the table
                         *----------------------------------------------------------------------*/
                        
                        
			if (byOrForFlag!=2){
				getCompanyAndSite(siteId,customerId);
			}
			assignedToLastTextField.setEditable(true);
			assignedToFirstTextField.setEditable(true);
			companyTextField.setEditable(true);
			
			oldByLast=reportedByLastTextField.getText();
			oldForLast=reportedForLastTextField.getText();
			oldToLast=assignedToLastTextField.getText();
                        oldCompany=companyTextField.getText();
			oldByFirst=reportedByFirstTextField.getText();
			oldForFirst=reportedForFirstTextField.getText();
			oldToFirst=assignedToFirstTextField.getText();
                        tableCase="";
			dialogForTable.dispose();
                        if(byOrForFlag==0){
				companyTextField.requestFocus();
			}
                        if(byOrForFlag==1){
				reportedForLastTextField.requestFocus();
			}
		
        
        }
        
        void doActionsWhenTableCompany(){
        /*---------------------------------------------------------------------
                   * In this method I display those companies and thier respective information
                   * on the text fields and the combo boxes if required. To display that company and the site
                   * I call method getAllSitesQuery which retrives all the sites for that company from
                   * the database. For details look into this method. Futher I change the 
                   * displaying information of the company like status ,type sgp etc. on thier 
                   * respective fields by calling setEligibilityCompanyFields method.
                   * 
                   *----------------------------------------------------------------------*/
		
                    
                    
                        int i=headerLength+1;
			int lengthOfData=0;
			int rowNumber=genericTable.getSelectedRow();
			String sqlQuery="";
			String[] dataRecieved;
			String companyName=(String)genericTable.getValueAt(rowNumber,0);
			if(!companyName.equals("null")){
				companyTextField.setText(companyName);
			}
                        globalCustomerId=globalCustomerIds[rowNumber];
			sqlQuery="sqlHiddenField="+SQLQueries.getAllSitesQuery(companyName)+"&numberHiddenField=1&numberOfResultsHiddenField=1"; 
			dataRecieved=genericConnection(sqlQuery);
                        headerLength=getHeaderLength(dataRecieved);
                        if(checkInteger(dataRecieved[headerLength])){
                            lengthOfData=Integer.parseInt(dataRecieved[headerLength]);
                            siteComboBox.removeAll();
                            for(i=(headerLength+1);i<(lengthOfData+headerLength);i++){
				 
                            siteComboBox.addItem(dataRecieved[i]);
                            }
                            setEligibilityCompanyFields(globalCustomerId);
                            
                            
                            
                            keyPressedCompany=false;
			
                            oldCompany=companyName;
                            
                            tableCase="";
                            siteComboBox.requestFocus();
                            dialogForTable.dispose();
                            
                        }
	
        
        }
        
        
	public void mouseClicked(MouseEvent e){
         /*---------------------------------------------------------------------
          * This method is the part of controller of this MVC. Whenever user does something on the 
          * GUI components which has mouse listener in them, particular action is performed.
          * These actions are dependent upon the user input and the components. First I get 
          * what is the source for action All GUI components have different actions to be performed.
          *----------------------------------------------------------------------*/

         
                
                
 		if(((e.getClickCount()==1)||(e.getClickCount()==2))&&(tableCase.equals("name"))){
                  /*---------------------------------------------------------------------
                   * Here I check that the mouse is clicked on the table which displays all the
                   * people and thier information corresponding to some name by calling doActionsWhenTableName
                   * method. 
                   *----------------------------------------------------------------------*/
                  
                   doActionsWhenTableName();
		}
		
		if(((e.getClickCount()==1)||(e.getClickCount()==2))&&(tableCase.equals("company"))){
                  /*---------------------------------------------------------------------
                   * Here I check that the mouse is clicked on the table which displays all the
                   * Comapnies and thier information corresponding to some name by calling doActionsWhenTableCompany
                   * method. 
                   *----------------------------------------------------------------------*/
                  
                    doActionsWhenTableCompany();
		}	
                
	
 	}
               
	public void mouseEntered(MouseEvent e){
            
	}
   	public void mouseExited(MouseEvent e){
	}
	public void mousePressed(MouseEvent e){
	}
 	public void mouseReleased(MouseEvent e){
        /*---------------------------------------------------------------------
         * Here I check that the mouse is released on the notes table which displays all the
         * notes and thier information corresponding to some case. All the functions are
         * handled  by  calling  setValuesForNotes method. For details please look into
         * this method.
         *----------------------------------------------------------------------*/
	
            Object source=e.getSource();
            if(source==notesTable){
                    setValuesForNotes(notesTable.getSelectedRow());
                   
             }
 	} 	
        
        
        
        
        
       	
	
	
}



class SQLQueryConversion{
/*---------------------------------------------------------------------
 * This class has just one static method normalToHttp. All it does it to convert any
 * given string which is fed as a parameter into this method, into a string well
 * siuted for http to understand. In other word it converts any string into 
 * a http suited string.
 *----------------------------------------------------------------------*/
 
	static String normalToHttp(String sqlQueryNormal){
		int lengthOfSqlQuery=sqlQueryNormal.length();
		int i;
		char realChar;
		String tempChar;

		String sqlQueryHttp="";
		for(i=0;i<lengthOfSqlQuery;i++){
			realChar=sqlQueryNormal.charAt(i);
			tempChar=""+realChar;
			if (realChar==' '){
				tempChar="+";
			}
			if (realChar==','){
				tempChar="%2C";
			}
			if (realChar=='('){
				tempChar="%28";
			}
			if (realChar==')'){
				tempChar="%29";
			}
			if (realChar=='>'){
				tempChar="%3E";
			}
			if (realChar=='='){
				tempChar="%3D";
			}
			if (realChar=='\''){
				tempChar="%27";
			}
			if (realChar=='<'){
				tempChar="%3C";
			}
			if (realChar=='%'){
				tempChar="%25";
			}
			sqlQueryHttp=sqlQueryHttp+tempChar;
			
			
		}
		return(sqlQueryHttp);
	
	
	}
}


class SendAndRecieve{

/*---------------------------------------------------------------------
 * This class is responsible for handling all the socket connections 
 * transferiing of data both to and fro. 
 *----------------------------------------------------------------------*/
 
	private PrintStream out=null;
	private BufferedReader in=null;
        private String host="";
	int dataLength=0;
	
	SendAndRecieve(BufferedReader in,PrintStream out,String host){
        /*---------------------------------------------------------------------
         * This is a constructer which takes three parameters namely in, out and host which
         * serves as  the reader and writer on to the socket stream. Host is the host name fetched from the url.
         * It globalizes these three variables.
         *----------------------------------------------------------------------*/
 
		this.in=in;
		this.out=out;
                this.host=host;
	}
	
        static Socket makeSocketConnection(String ipAddress,int port){
        /*---------------------------------------------------------------------
         * This method takes the ipaddress and the port number as the parameters
         * and makes a socket connection on to that address and finally return the soket.
         *----------------------------------------------------------------------*/
		Socket appletSocket=null;
		try{
			appletSocket= new Socket(ipAddress,port);
		}catch(UnknownHostException uhe){
			System.out.println("host exception "+uhe);
		}catch(IOException ioe){
			System.out.println("io exception "+ioe);
		}
		
		return(appletSocket);
	}
        
        
	void sendPostHeader(String servletLocation,int contentLength){
        /*---------------------------------------------------------------------
         * This is a very important method which write the http header on to the 
         * socket stream. This header corresponds to the post method of the http.
         * Please do not change this method. It takes two parameters servlet location 
         * tells where and which servlet is to be called and content length gives the 
         * length of the content to follow.      
         *----------------------------------------------------------------------*/
	    
            
		out.println("POST "+servletLocation+" HTTP/1.1");
		//out.println("Connection: Keep-Alive");
                
  
		
                out.println("User-Agent: Mozilla/3.0");
		//out.println("Host: ep600x256:8100");
                out.println("Host: "+host);
                out.println("Accept: */*");
		//out.println("Connection: keep-alive");
		//out.println("Connection: Keep-Alive");
		
		out.println("Content-type: application/x-www-form-urlencoded");
		out.println("Content-length: "+contentLength); 
		
		
	
	}
	void sendData(String outData){
        /*---------------------------------------------------------------------
         * This is a follow up of sendPostHeader. After sending the header
         * this method is called to send the actaul data. Alll it does is write the 
         * data on the socket stream.
         *----------------------------------------------------------------------*/    
		out.println("\n"+outData);
	}
	
	void sendGetHeader(String servletLocation,String outData){
        /*---------------------------------------------------------------------
         * This is a very important method which write the http header on to the 
         * socket stream. This header corresponds to the get method of the http.
         * Please do not change this method. It takes two parameters servlet location 
         * tells where and which servlet is to be called and out data gives the 
         *  content to send. Note this method is not used anywhere in the code since 
         * it takes URL for the data transfer and post some limitations on the length. So 
         * post method is used ever where in the code.
         *----------------------------------------------------------------------*/
            
		out.println("GET "+servletLocation+"?"+outData+" HTTP/1.1");
		//out.println("GET /servlet/GenericQuery?sqlHiddenField=select+swName%2C+count%28*%29+from+SW_CASE+sc%2CSW_PRODUCT_LINE+spl+where+sc.swDateResolved+%3E%3D%271-jan-2001%27+and+sc.swDateResolved+%3C%271-feb-2001%27+and+sc.SwProductLineId%3Dspl.SwProductLineId+group+by+swname&numberHiddenField=1&numberOfResultsHiddenField=2 HTTP/1.1");
		
		out.println("Connection: Keep-Alive");
		out.println("User-Agent: Mozilla/3.0");
  
		
		out.println("Host: ep600x256:8100");
		out.println("Accept: */*\n");

		
		
	
	}
	
	
	
	
	String[] recieveData(){
        /*---------------------------------------------------------------------
         * This method is used to retrive all the dats from the socket stream.
         * It returns an array of string which contains all the data retrived 
         * from the stream.
         *----------------------------------------------------------------------*/
			int count=0;
			int MAX=99999;
			String[] dataRecieved=new String[MAX];
			try{	
				dataRecieved[count]=in.readLine();	
				do{
					count++;
				}while((dataRecieved[count]=in.readLine())!=null);
				dataLength=count;
			}catch(IOException ioe){
				System.out.println("io exception "+ioe);
			}
			return(dataRecieved);
			
	}
	
	int getDataLength(){
        /*---------------------------------------------------------------------
         * This method just returns the length of the data retrived when last        
         * recieveData method was called.
         *----------------------------------------------------------------------*/
		return(dataLength);
	}


}

class SQLQueries{
/*---------------------------------------------------------------------
 * This class is responsible for just returning the sql queries in the
 * http string format. All methods in this class just returns different 
 * sql strings for different purposes. Please look atthe queries themselves
 * for detail
 *----------------------------------------------------------------------*/
	
	
	static String getCaseNumberQuery(){
		return(SQLQueryConversion.normalToHttp("select sw_case_sq.nextval from dual"));	
	
	}
        
        static String getWorkLogIdQuery(){
		return(SQLQueryConversion.normalToHttp("select sw_work_log_sq.nextval from dual"));	
	
	}
        
        static String getActionNumberQuery(){
		return(SQLQueryConversion.normalToHttp("select swb.sw_Action_sq.nextval  from dual"));	
	
	}
        

	static String getLastNameQuery(String lastName){
		return(SQLQueryConversion.normalToHttp("select swLastName, swFirstName,sw_person.swOfficePhoneCntry,sw_person.swOfficePhoneArea,sw_person.swOfficePhone,sw_person.swOfficePhoneExt,evemailaddress,c.swName,swsitename,evWebUsertype,sw_person.swsiteid,sw_person.swCustomerid from sw_person,sw_site s,sw_customer c where lower(swlastname) like lower('"+lastName+"%') and sw_person.swactiveffk='1' and c.swCustomerid=s.swCustomerid and s.swSiteid=sw_person.swsiteid order by swLastName,swFirstName"));	
	
	}
	
	static String getFirstNameQuery(String firstName){
		return(SQLQueryConversion.normalToHttp("select swLastName, swFirstName,sw_person.swOfficePhoneCntry,sw_person.swOfficePhoneArea,sw_person.swOfficePhone,sw_person.swOfficePhoneExt,evemailaddress,c.swName,swsitename,evWebUsertype,sw_person.swsiteid,sw_person.swCustomerid from sw_person,sw_site s,sw_customer c where lower(swfirstname) like lower('"+firstName+"%') and sw_person.swactiveffk='1' and c.swCustomerid=s.swCustomerid and s.swSiteid=sw_person.swsiteid order by swLastName,swFirstName"));	
	
	}
        
        
	

	static String getCompanyQuery(String siteId){
		return(SQLQueryConversion.normalToHttp("select s.swSitename, c.swName from sw_site s,sw_customer c where s.swSiteid="+siteId+" and c.swCustomerid=s.swCustomerid"));	

	}
	
	static String getSitesQuery(String customerId){
		return(SQLQueryConversion.normalToHttp("select distinct s.swSitename from sw_site s,sw_customer c where s.swcustomerid="+customerId+" and c.swCustomerid=s.swCustomerid order by s.swSitename"));	

	}
		
	static String getProductLinesQuery(){
		return(SQLQueryConversion.normalToHttp("select distinct l.swName,l.swProductlineid from sw_prod_release r,sw_product_line l where r.swProductlineid=l.swProductlineid and l.swrepairable=1 order by l.swName"));	

	}
	
	static String getProductReleaseQuery(String productLineId){
		return(SQLQueryConversion.normalToHttp("select distinct r.swName from sw_prod_release r,sw_product_line l where r.swProductlineid=l.swProductlineid and l.swrepairable=1 and r.swproductlineid="+productLineId+" and evvalid = 1"));	

	}
	
	static String getVersionQuery(String productReleaseName){
		return(SQLQueryConversion.normalToHttp("select swversion from sw_prod_release where swname='"+productReleaseName+"'"));

	}
	
	static String getCaseQuery(String caseId){
		return(SQLQueryConversion.normalToHttp("select evhours,evbillabletoggle,evnotifydetail,a.evVisibility,a.evTMCategory,a.evTMService,b.swname prodlinename,c.swname prodname,c.swversion,a.swSubject,a.swStatus,a.swnote,a.swtype,a.swreceivedvia,a.swseverity,a.swpriority,a.swReportedBy,a.evreportedfor,a.swassignedto,a.swsiteid,a.swCustomerid,a.swresolutionid,a.swrespondby,a.evparentcaseid,a.evnotify from sw_case a, sw_product_line b, sw_prod_release c where a.SWPRODUCTLINEID=b.swproductlineid and a.swprodreleaseid=c.swprodreleaseid and a.swCaseid="+caseId));	
		
	}
        
        static String getParentCaseQuery(String caseId){
		return(SQLQueryConversion.normalToHttp("select evhours from sw_case a, sw_product_line b, sw_prod_release c where a.SWPRODUCTLINEID=b.swproductlineid and a.swprodreleaseid=c.swprodreleaseid and a.swCaseid="+caseId));	
		
	}
        
        
        static String getEvSupportTypeQuery(String customerId){
		return(SQLQueryConversion.normalToHttp("select evsupporttype from sw_customer where swcustomerid='"+customerId+"'"));	

	}
	
	static String getNameAndInfoQuery(String reportedBy,String reportedFor,String assignedTo){
		return(SQLQueryConversion.normalToHttp("select swpersonid,swFirstname,swLastName ,evemailaddress,swOfficePhoneArea,swOfficePhone,swOfficePhoneCntry,swOfficePhoneExt from sw_person where swpersonid in ("+reportedBy+","+reportedFor+","+assignedTo+")"));	

	}
	
	static String getAllCompaniesQuery(String companyName){
		//return(SQLQueryConversion.normalToHttp("select swname,swstatus,swtype from sw_customer c where lower(c.swName) like lower('"+companyName+"%') order by swname"));	
                return(SQLQueryConversion.normalToHttp("select swname,swstatus,swtype,swcustomerid from sw_customer c where lower(c.swName) like lower('"+companyName+"%') order by swname"));	
	}
	
	static String getAllSitesQuery(String companyName){
		return(SQLQueryConversion.normalToHttp("select s.swSitename from sw_site s,sw_customer c where c.swName='"+companyName+"' and c.swCustomerid=s.swCustomerid"));	

	}
	
	static String getPersonIdQuery(String reportedByFirst,String reportedByLast,String emailAddressBy,String reportedForFirst,String reportedForLast,String emailAddressFor,String assignedToFirst,String assignedToLast,String emailAddressTo){
		return(SQLQueryConversion.normalToHttp("select swpersonid,swfirstname,swlastname from sw_person where (lower(swfirstname)=lower('"+reportedByFirst+"') and lower(swlastname)=lower('"+reportedByLast+"') and swactiveffk =1 and evemailaddress='"+emailAddressBy+"') or (lower(swfirstname)=lower('"+reportedForFirst+"') and lower(swlastname)=lower('"+reportedForLast+"') and swactiveffk =1 and evemailaddress='"+emailAddressFor+"') or (lower(swfirstname)=lower('"+assignedToFirst+"') and lower(swlastname)=lower('"+assignedToLast+"') and swactiveffk =1 and evemailaddress='"+emailAddressTo+"') "));	

	}
        
        static String getLoggedInPersonInfoQuery(String personId){
		return(SQLQueryConversion.normalToHttp("select evemailaddress,swfirstname,swlastname,SWEMPLOYEEFLAG from sw_person where swactiveffk =1 and swpersonid='"+personId+"'"));	

	}
	
	static String getSiteIdQuery(String companyName,String siteName){
		return(SQLQueryConversion.normalToHttp("select s.swSiteid from sw_site s,sw_customer c where c.swName = '"+companyName+"' and s.swSitename='"+siteName+"' and c.swCustomerid=s.swCustomerid"));	

	}
	
	
	static String getProductIdQuery(String productLine,String productRelease,String version,String caseId){
		return(SQLQueryConversion.normalToHttp("select b.SWPRODUCTLINEID,c.swprodreleaseid from sw_product_line b,sw_prod_release c where b.swname='"+productLine+"' and c.swname='"+productRelease+"' and c.swversion='"+version+"'"));	

	}
	
        static String getNotesQuery(String caseNumber){
		return(SQLQueryConversion.normalToHttp("select swvisibility,swSubject,swCreatedBy,swDateCreated,swworklogId from sw_work_log where swObjectid="+caseNumber+" and swObjectType='CASE' order by swDateCreated"));	

	}
        
        static String getNotesSubjectQuery(String caseNumber){
		return(SQLQueryConversion.normalToHttp("select swnote from sw_work_log where swObjectid="+caseNumber+" and swObjectType='CASE' order by swDateCreated"));	

	}
        
        static String getTeamPagerQuery(){
		return(SQLQueryConversion.normalToHttp("select EVTEAMPAGER from ev_team where EVNAME='Frontline'"));	

	}
        
        static String getEvTeamIdCustomerQuery(String customerId){
		return(SQLQueryConversion.normalToHttp("select evTeamId from ev_team_customer where evCustomerid="+customerId));	

	}
        
        static String getEvTeamIdIndustryQuery(String customerId){
		return(SQLQueryConversion.normalToHttp("select ev_team.evTeamId from ev_team_industry, sw_customer,ev_team where sw_customer.swIndustryid=ev_team_industry.EVINDUSTRYID	and sw_customer.swCustomerid="+customerId+" and ev_team.evTeamId=ev_team_industry.evTeamid and ev_team.evType='Industry'"));	

	}
        
        static String getEvTeamIdProductQuery(String productLineId){
		return(SQLQueryConversion.normalToHttp("select evProductlineId from ev_team where evproductlineid='"+productLineId+"' and evType='Product'"));	

	}
        
        static String getEvMailAndInboxCustomerQuery(String customerId){
		return(SQLQueryConversion.normalToHttp("select EVEMAILADDRESS,evTeaminbox from ev_team,ev_team_customer where ev_team_customer.evCustomerid="+customerId+" and ev_team.evTeamId=ev_team_customer.evTeamId and ev_team.evType='Customer'"));	

	}
        
        static String getEvMailAndInboxIndustryQuery(String teamId){
		return(SQLQueryConversion.normalToHttp("select EVEMAILADDRESS,evTeaminbox from ev_team where evTeamId="+teamId+" and ev_team.evType='Industry'"));	

	}
        
        static String getEvMailAndInboxProductQuery(String productLineId){
		return(SQLQueryConversion.normalToHttp("select EVEMAILADDRESS,evTeaminbox from ev_team where EVPRODUCTLINEID='"+productLineId+"'"));	

	}
        
        static String getEligibilityCompanyQuery(String customerId){
		return(SQLQueryConversion.normalToHttp("select swstatus,swavailability,evsupporttype,swtype,SWDATEMODIFIED,SWMODIFIEDBY from sw_customer where swcustomerid='"+customerId+"'"));	

	}
        
        static String getEligibilityCaseQuery(String caseNumber){
		return(SQLQueryConversion.normalToHttp("select swdatecreated,swcreatedby,evdatemodified,evmodifiedby,swdateresolved from sw_case where swcaseid="+caseNumber));	

	}
        
        static String getRugQuery(String personId){
		return(SQLQueryConversion.normalToHttp("select evrugmember from sw_customer c, sw_person p where c.swcustomerId=p.swcustomerid and p.swpersonId='"+personId+"'"));	

	}
        
        
        
        
        
        
        static String setCaseQuery(String hours,String billableToggle,String emailDetails,String visibility,String solution,String service,String subject,String status,String type,String source,String severity,String priority,String resolution,String dueDate,String parentCaseNumber,String reportedById,String reportedForId,String assignedToId,String siteId,String productId,String productReleaseId,String customerId,String dateCreated,String createdBy,String dateModified,String modifiedBy,String dateResolved,String alsoEmail,String caseNumber){
            /*if(!dateResolved.equals("NONE")){	
                return(SQLQueryConversion.normalToHttp("update sw_case set evhours='"+hours+"',evbillabletoggle="+billableToggle+",evnotifydetail='"+emailDetails+"',evVisibility='"+visibility+"',evTMCategory='"+solution+"',evTMService='"+service+"',swSubject='"+subject+"',swStatus='"+status+"',swtype='"+type+"',swreceivedvia='"+source+"',swseverity='"+severity+"',swpriority='"+priority+"',swresolutionid="+resolution+",swrespondby="+dueDate+",evparentcaseid='"+parentCaseNumber+"',swReportedBy="+reportedById+",evreportedfor="+reportedForId+",swassignedto="+assignedToId+",swsiteid='"+siteId+"',SWPRODUCTLINEID='"+productId+"',swprodreleaseid='"+productReleaseId+"',swCustomerId='"+customerId+"',swdatecreated='"+dateCreated+"',swcreatedby='"+createdBy+"',evdatemodified='"+dateModified+"',evmodifiedby='"+modifiedBy+"',swdateresolved='"+dateResolved+"',evnotify='"+alsoEmail+"' where swCaseid="+caseNumber));	
            }else{
                return(SQLQueryConversion.normalToHttp("update sw_case set evhours='"+hours+"',evbillabletoggle="+billableToggle+",evnotifydetail='"+emailDetails+"',evVisibility='"+visibility+"',evTMCategory='"+solution+"',evTMService='"+service+"',swSubject='"+subject+"',swStatus='"+status+"',swtype='"+type+"',swreceivedvia='"+source+"',swseverity='"+severity+"',swpriority='"+priority+"',swresolutionid="+resolution+",swrespondby="+dueDate+",evparentcaseid='"+parentCaseNumber+"',swReportedBy="+reportedById+",evreportedfor="+reportedForId+",swassignedto="+assignedToId+",swsiteid='"+siteId+"',SWPRODUCTLINEID='"+productId+"',swprodreleaseid='"+productReleaseId+"',swCustomerId='"+customerId+"',swdatecreated='"+dateCreated+"',swcreatedby='"+createdBy+"',evdatemodified='"+dateModified+"',evmodifiedby='"+modifiedBy+"',evnotify='"+alsoEmail+"' where swCaseid="+caseNumber));	
            }*/
            
            if(!dateResolved.equals("NONE")){	
                return(SQLQueryConversion.normalToHttp("update sw_case set evhours='"+hours+"',evbillabletoggle="+billableToggle+",evnotifydetail='"+emailDetails+"',evVisibility='"+visibility+"',evTMCategory='"+solution+"',evTMService='"+service+"',swSubject='"+subject+"',swStatus='"+status+"',swtype='"+type+"',swreceivedvia='"+source+"',swseverity='"+severity+"',swpriority='"+priority+"',swresolutionid="+resolution+",swrespondby="+dueDate+",evparentcaseid='"+parentCaseNumber+"',swReportedBy="+reportedById+",evreportedfor="+reportedForId+",swassignedto="+assignedToId+",swsiteid='"+siteId+"',SWPRODUCTLINEID='"+productId+"',swprodreleaseid='"+productReleaseId+"',swCustomerId='"+customerId+"',swdatecreated="+dateCreated+",swcreatedby='"+createdBy+"',evdatemodified="+dateModified+",evmodifiedby='"+modifiedBy+"',swdateresolved="+dateResolved+",evnotify='"+alsoEmail+"' where swCaseid="+caseNumber));	
            }else{
                return(SQLQueryConversion.normalToHttp("update sw_case set evhours='"+hours+"',evbillabletoggle="+billableToggle+",evnotifydetail='"+emailDetails+"',evVisibility='"+visibility+"',evTMCategory='"+solution+"',evTMService='"+service+"',swSubject='"+subject+"',swStatus='"+status+"',swtype='"+type+"',swreceivedvia='"+source+"',swseverity='"+severity+"',swpriority='"+priority+"',swresolutionid="+resolution+",swrespondby="+dueDate+",evparentcaseid='"+parentCaseNumber+"',swReportedBy="+reportedById+",evreportedfor="+reportedForId+",swassignedto="+assignedToId+",swsiteid='"+siteId+"',SWPRODUCTLINEID='"+productId+"',swprodreleaseid='"+productReleaseId+"',swCustomerId='"+customerId+"',swdatecreated="+dateCreated+",swcreatedby='"+createdBy+"',evdatemodified="+dateModified+",evmodifiedby='"+modifiedBy+"',evnotify='"+alsoEmail+"' where swCaseid="+caseNumber));	
            }

	}
        
        
        static String setNewCaseQuery(String hours,String billableToggle,String emailDetails,String visibility,String solution,String service,String subject,String status,String type,String source,String severity,String priority,String resolution,String dueDate,String parentCaseNumber,String reportedById,String reportedForId,String assignedToId,String siteId,String productId,String productReleaseId,String customerId,String dateCreated,String createdBy,String dateModified,String modifiedBy,String dateResolved,String alsoEmail,String caseNumber){
            /*if(!dateResolved.equals("NONE")){
		return(SQLQueryConversion.normalToHttp("INSERT INTO sw_case(evhours,evbillabletoggle,evnotifydetail,evVisibility,evTMCategory,evTMService,swSubject,swStatus,swtype,swreceivedvia,swseverity,swpriority,swresolutionid,swrespondby,evparentcaseid,swReportedBy,evreportedfor,swassignedto,swsiteid,SWPRODUCTLINEID,swprodreleaseid,swCustomerId,swdatecreated,swcreatedby,evdatemodified,evmodifiedby,swdateresolved,evnotify,swCaseid)VALUES('"+hours+"',"+billableToggle+",'"+emailDetails+"','"+visibility+"','"+solution+"','"+service+"','"+subject+"','"+status+"','"+type+"','"+source+"','"+severity+"','"+priority+"',"+resolution+","+dueDate+",'"+parentCaseNumber+"',"+reportedById+","+reportedForId+","+assignedToId+",'"+siteId+"','"+productId+"','"+productReleaseId+"','"+customerId+"','"+dateCreated+"','"+createdBy+"','"+dateModified+"','"+modifiedBy+"','"+dateResolved+"','"+alsoEmail+"',"+caseNumber+")"));	
            }else{
                return(SQLQueryConversion.normalToHttp("INSERT INTO sw_case(evhours,evbillabletoggle,evnotifydetail,evVisibility,evTMCategory,evTMService,swSubject,swStatus,swtype,swreceivedvia,swseverity,swpriority,swresolutionid,swrespondby,evparentcaseid,swReportedBy,evreportedfor,swassignedto,swsiteid,SWPRODUCTLINEID,swprodreleaseid,swCustomerId,swdatecreated,swcreatedby,evdatemodified,evmodifiedby,evnotify,swCaseid)VALUES('"+hours+"',"+billableToggle+",'"+emailDetails+"','"+visibility+"','"+solution+"','"+service+"','"+subject+"','"+status+"','"+type+"','"+source+"','"+severity+"','"+priority+"',"+resolution+","+dueDate+",'"+parentCaseNumber+"',"+reportedById+","+reportedForId+","+assignedToId+",'"+siteId+"','"+productId+"','"+productReleaseId+"','"+customerId+"','"+dateCreated+"','"+createdBy+"','"+dateModified+"','"+modifiedBy+"','"+alsoEmail+"',"+caseNumber+")"));	
            }*/
            
            if(!dateResolved.equals("NONE")){
		return(SQLQueryConversion.normalToHttp("INSERT INTO sw_case(evhours,evbillabletoggle,evnotifydetail,evVisibility,evTMCategory,evTMService,swSubject,swStatus,swtype,swreceivedvia,swseverity,swpriority,swresolutionid,swrespondby,evparentcaseid,swReportedBy,evreportedfor,swassignedto,swsiteid,SWPRODUCTLINEID,swprodreleaseid,swCustomerId,swdatecreated,swcreatedby,evdatemodified,evmodifiedby,swdateresolved,evnotify,swCaseid)VALUES('"+hours+"',"+billableToggle+",'"+emailDetails+"','"+visibility+"','"+solution+"','"+service+"','"+subject+"','"+status+"','"+type+"','"+source+"','"+severity+"','"+priority+"',"+resolution+","+dueDate+",'"+parentCaseNumber+"',"+reportedById+","+reportedForId+","+assignedToId+",'"+siteId+"','"+productId+"','"+productReleaseId+"','"+customerId+"',"+dateCreated+",'"+createdBy+"',"+dateModified+",'"+modifiedBy+"',"+dateResolved+",'"+alsoEmail+"',"+caseNumber+")"));	
            }else{
                return(SQLQueryConversion.normalToHttp("INSERT INTO sw_case(evhours,evbillabletoggle,evnotifydetail,evVisibility,evTMCategory,evTMService,swSubject,swStatus,swtype,swreceivedvia,swseverity,swpriority,swresolutionid,swrespondby,evparentcaseid,swReportedBy,evreportedfor,swassignedto,swsiteid,SWPRODUCTLINEID,swprodreleaseid,swCustomerId,swdatecreated,swcreatedby,evdatemodified,evmodifiedby,evnotify,swCaseid)VALUES('"+hours+"',"+billableToggle+",'"+emailDetails+"','"+visibility+"','"+solution+"','"+service+"','"+subject+"','"+status+"','"+type+"','"+source+"','"+severity+"','"+priority+"',"+resolution+","+dueDate+",'"+parentCaseNumber+"',"+reportedById+","+reportedForId+","+assignedToId+",'"+siteId+"','"+productId+"','"+productReleaseId+"','"+customerId+"',"+dateCreated+",'"+createdBy+"',"+dateModified+",'"+modifiedBy+"','"+alsoEmail+"',"+caseNumber+")"));	
            }
	}
        
        
        
        static String setAuditTrailQuery(String caseNumber,String reportedBy,String columnName,String oldValue,String newValue){
		return(SQLQueryConversion.normalToHttp("insert into sw_audit_trail (swAuditId,swObjectType,swObjectId,swChangedBy,swColumnName,swDateChanged,swNewValue,swOriginalValue,swTableName,swOwnerId) VALUES (SW_AUDIT_TRAIL_SQ.NEXTVAL,'CASE',"+caseNumber+",'"+reportedBy+"','"+columnName+"',sysdate,'"+newValue+"','"+oldValue+"','SW_CASE',1)"));	

	}
	
        
	static String setDescriptionQuery(String description,String caseNumber){
		return(SQLQueryConversion.normalToHttp("begin swb.insert_case_descript("+caseNumber+",'"+description+"');  end;"));	

	}
	
	
	
	
	static String setNameAndInfoQuery(String firstName,String lastName,String emailAddress,String area,String phone,String country,String extention,String previousEmailAddress){
		return(SQLQueryConversion.normalToHttp("update sw_person set evemailaddress='"+emailAddress+"',swOfficePhoneArea='"+area+"',swOfficePhone='"+phone+"',swOfficePhoneCntry='"+country+"',swOfficePhoneExt='"+extention+"' where swLastName='"+lastName+"' and swfirstname='"+firstName+"' and evemailaddress='"+previousEmailAddress+"'"));	
	}
	
	static String setUpdateProductLineQuery(String productId,String caseNumber){
		return(SQLQueryConversion.normalToHttp("update sw_case set swproductlineid='"+productId+"' where swCaseid="+caseNumber));	

	}
	
        static String setNotesQuery(String workLogId,String personId,String caseNumber,String createdBy,String visibility,String subject){
		return(SQLQueryConversion.normalToHttp("insert into sw_work_log(swworklogId,swPersonid,swObjectId,swObjectType,swCreatedBy,swDateCreated,swVisibility,swSubject) values("+workLogId+","+personId+","+caseNumber+",'CASE','"+createdBy+"',sysdate,'"+visibility+"','"+subject+"')"));	

	}
	
	static String setUpdateNotesQuery(String workLogId,String caseNumber,String visibility,String subject){
		return(SQLQueryConversion.normalToHttp("update sw_work_log set swVisibility='"+visibility+"',swSubject='"+subject+"' where swworklogid="+workLogId+" and swObjectId="+caseNumber));	

	}
        
        static String setCommentQuery(String description,String workLogId){
		return(SQLQueryConversion.normalToHttp("begin swb.insert_case_comment("+workLogId+",'"+description+"');  end;"));	

	}
        
        static String setEmailQuery(String caseNumber,String emailAddress,String subject,String body,String createdBy){
		return(SQLQueryConversion.normalToHttp("insert into ev_mail_queue (EVSYSTEM,EVOBJECTID,EVOBJECTTYPE,EVDATECREATED,EVSENDTO,EVSUBJECT,EVNOTE,EVFROM,EVINTMAILFLAG,EVCREATEDBY,EVDEBUGMAILADDR,EVDATESENT,EVMULTIFORMAT) Values('eSupport',"+caseNumber+",'CASE',sysdate,'"+emailAddress+"','"+subject+"','"+body+"','Support@i2.com',0,'"+createdBy+"',null,null,0)"));	

	}
        
        static String setActionLogQuery(String actionNumber,String inbox,String createdBy){
		return(SQLQueryConversion.normalToHttp("insert into SW_ACTION_LOG (swActionId,swDateReceived,swReceiver,swDisplay,swMessageType,swNote,swCreatedBy,Timestamp) VALUES ("+actionNumber+",sysdate,'"+inbox+"',1,'New','This Case was created on the Web. Please Assign this case and change the Status to OPEN Immediately','"+createdBy+"',sysdate)"));	

	}
        
        static String setActionQuery(String actionNumber,String caseNumber,String createdBy){
		return(SQLQueryConversion.normalToHttp("insert into SW_ACTION (swActionId,swObjectType,swObjectId,swSender,swAction,swPriority,swActionRequired,swConfirmRequested,swOwnerId,swCreatedBy,swDateCreated) VALUES ("+actionNumber+",'CASE',"+caseNumber+",'"+createdBy+"','Reaserch/Reply','Medium',0,0,1,'"+createdBy+"',sysdate)"));	

	}
        
        
        
        static String deleteNoteQuery(String workLogId){
		return(SQLQueryConversion.normalToHttp("delete from sw_work_log where swworklogid="+workLogId));	

	}
        
}




class AlertMessages implements ActionListener{
/*---------------------------------------------------------------------
 * This class is responsible for displaying alert messages in a Dialog box
 * It has just two methods displayMessages and actionPerformed. The former is
 * used to display an alert message in a dialog box and the latter is used 
 * to ckeck if the Ok button is pressed and if pressed then dispose the dialog box.
 *----------------------------------------------------------------------*/

    
	JDialog dialogBoxForAlerts;
		
	void displayMessages(String message){
		dialogBoxForAlerts=new JDialog();
		dialogBoxForAlerts.setTitle("Alert");		
                URL urlOfImage=getURL("error.gif");
                ImageIcon imageIcon=new ImageIcon(urlOfImage);
                JLabel errorJLabel=new JLabel(message,imageIcon,JLabel.RIGHT);
		JButton okButton=new JButton("     OK     ");
                
                errorJLabel.setForeground(Color.red);
                
		okButton.addActionListener(this);
		
		dialogBoxForAlerts.setSize(500,150);
		dialogBoxForAlerts.setLocation(400,200);
		dialogBoxForAlerts.getContentPane().setLayout(new GridBagLayout());
		GridBagConstraints gbc; 
		
		gbc = new GridBagConstraints();
		gbc.gridx =0;
		gbc.gridy=0;
		dialogBoxForAlerts.getContentPane().add(errorJLabel,gbc);
				
		gbc = new GridBagConstraints();
		gbc.gridx =0;
		gbc.gridy=1;
		dialogBoxForAlerts.getContentPane().add(okButton,gbc);
		
		dialogBoxForAlerts.setVisible(true);
		
	}
	
	public void actionPerformed(ActionEvent e){
		String STR=e.getActionCommand();
		if(STR.equals("     OK     ")){
			dialogBoxForAlerts.dispose();	
			
		}
		 
	}

	
protected URL getURL(String filename){
        URL codeBase = GUI.baseApplet.getCodeBase();
        URL url = null;

        try {
            url = new URL(codeBase, filename);
        } catch (java.net.MalformedURLException e) {
            System.err.println("Couldn't create image: " +"badly specified URL");
            return null;
        }
    
        return url;
    }
    
		
}








class TimerMessage extends Thread{
/*---------------------------------------------------------------------
 * This class is responsible for displaying a timer dialog  box.
 * This class is a thread and while the applet performes some operations at the
 * background, this dialog box remains displayed. Once the opertations are completed 
 * the dialog box is disposed using disposeTimer method.
 *----------------------------------------------------------------------*/

    
	JDialog dialogBoxForTimer;
        String message="";
		
	void displayMessages(String message){
		this.message=message;
	}
        public void run(){
                dialogBoxForTimer=new JDialog();
		dialogBoxForTimer.setTitle("Timer");		
		Label timmerJLabel=new Label(message);
                
                
                timmerJLabel.setForeground(Color.blue);
		dialogBoxForTimer.setSize(350,100);
		dialogBoxForTimer.setLocation(400,200);
		dialogBoxForTimer.getContentPane().add(timmerJLabel);
		
		dialogBoxForTimer.setVisible(true);
		
            
        }
	
	void disposeTimer(){
           
            dialogBoxForTimer.dispose();
        }
        
    

	

		
}








class MyTableModel extends AbstractTableModel {
/*---------------------------------------------------------------------
 * This class is a model for making the JTable. It has some default properties
 * like disabling the editing in the Table etc.
 *----------------------------------------------------------------------*/

        String[] columnNames = null;
        Object[][] data = null;

		
        MyTableModel(String[] columnNames,Object[][] data){
            this.columnNames=columnNames;
            this.data=data;
	}
		
		
        public int getColumnCount() {
            return columnNames.length;
        }
        
        public int getRowCount() {
            return data.length;
        }

        public String getColumnName(int col) {
            return columnNames[col];
        }

        public Object getValueAt(int row, int col) {
            return data[row][col];
        }

        /*---------------------------------------------------------------------
         * JTable uses this method to determine the default renderer/
         * editor for each cell.  If we didn't implement this method,
         * then the last column would contain text ("true"/"false"),
         * rather than a check box.
         *---------------------------------------------------------------------*/
        public Class getColumnClass(int c) {
            return getValueAt(0, c).getClass();
        }

        /*---------------------------------------------------------------------
         * Don't need to implement this method unless your table's
         * editable.
         * ---------------------------------------------------------------------*/
        public boolean isCellEditable(int row, int col) {
            return false;
        }
        
        public void setValueAt(Object aValue, int aRow, int aColumn) {
            data[aRow][aColumn]=aValue;
            
            
        }


}


class TableMap extends AbstractTableModel  implements TableModelListener {
    protected TableModel model; 

    public TableModel getModel() {
        return model;
    }

    public void setModel(TableModel model) {
        this.model = model; 
        model.addTableModelListener(this); 
    }
    
    /*---------------------------------------------------------------------
     * By default, implement TableModel by forwarding all messages 
     * to the model. 
     *---------------------------------------------------------------------*/
   
    public Object getValueAt(int aRow, int aColumn) {
        return model.getValueAt(aRow, aColumn); 
    }
        
    public void setValueAt(Object aValue, int aRow, int aColumn) {
        model.setValueAt(aValue, aRow, aColumn); 
    }

    public int getRowCount() {
        return (model == null) ? 0 : model.getRowCount(); 
    }

    public int getColumnCount() {
        return (model == null) ? 0 : model.getColumnCount(); 
    }
        
    public String getColumnName(int aColumn) {
        return model.getColumnName(aColumn); 
    }

    public Class getColumnClass(int aColumn) {
        return model.getColumnClass(aColumn); 
    }
        
    public boolean isCellEditable(int row, int column) { 
         return model.isCellEditable(row, column); 
    }
    
/*---------------------------------------------------------------------
 * Implementation of the TableModelListener interface, 
 * By default forward all events to all the listeners. 
 *---------------------------------------------------------------------*/
    
    public void tableChanged(TableModelEvent e) {
        fireTableChanged(e);
    }
}









class TableSorter extends TableMap {
/*---------------------------------------------------------------------
 * A sorter for TableModels. The sorter has a model (conforming to TableModel) 
 * and itself implements TableModel. TableSorter does not store or copy 
 * the data in the TableModel, instead it maintains an array of 
 * integers which it keeps the same size as the number of rows in its 
 * model. When the model changes it notifies the sorter that something 
 * has changed eg. "rowsAdded" so that its internal array of integers 
 * can be reallocated. As requests are made of the sorter (like 
 * getValueAt(row, col) it redirects them to its model via the mapping 
 * array. That way the TableSorter appears to hold another copy of the table 
 * with the rows in a different order. The sorting algorthm used is stable 
 * which means that it does not move around rows when its comparison 
 * function returns 0 to denote that they are equivalent. 
 *
 * @version 1.5 12/17/97
 * @author Philip Milne
 *---------------------------------------------------------------------*/


    int             indexes[];
    Vector          sortingColumns = new Vector();
    boolean         ascending = true;
    int compares;

    public TableSorter() {
        indexes = new int[0]; // for consistency
    }

    public TableSorter(TableModel model) {
        setModel(model);
    }

    public void setModel(TableModel model) {
        super.setModel(model); 
        reallocateIndexes(); 
    }

    public int compareRowsByColumn(int row1, int row2, int column) {
        Class type = model.getColumnClass(column);
        TableModel data = model;

        // Check for nulls.

        Object o1 = data.getValueAt(row1, column);
        Object o2 = data.getValueAt(row2, column); 

        // If both values are null, return 0.
        if (o1 == null && o2 == null) {
            return 0; 
        } else if (o1 == null) { // Define null less than everything. 
            return -1; 
        } else if (o2 == null) { 
            return 1; 
        }

        /*---------------------------------------------------------------------
         * We copy all returned values from the getValue call in case
         * an optimised model is reusing one object to return many
         * values.  The Number subclasses in the JDK are immutable and
         * so will not be used in this way but other subclasses of
         * Number might want to do this to save space and avoid
         * unnecessary heap allocation.
         *---------------------------------------------------------------------*/

        if (type.getSuperclass() == java.lang.Number.class) {
            Number n1 = (Number)data.getValueAt(row1, column);
            double d1 = n1.doubleValue();
            Number n2 = (Number)data.getValueAt(row2, column);
            double d2 = n2.doubleValue();

            if (d1 < d2) {
                return -1;
            } else if (d1 > d2) {
                return 1;
            } else {
                return 0;
            }
        } else if (type == java.util.Date.class) {
            Date d1 = (Date)data.getValueAt(row1, column);
            long n1 = d1.getTime();
            Date d2 = (Date)data.getValueAt(row2, column);
            long n2 = d2.getTime();

            if (n1 < n2) {
                return -1;
            } else if (n1 > n2) {
                return 1;
            } else {
                return 0;
            }
        } else if (type == String.class) {
            String s1 = (String)data.getValueAt(row1, column);
            String s2    = (String)data.getValueAt(row2, column);
            int result = s1.compareTo(s2);

            if (result < 0) {
                return -1;
            } else if (result > 0) {
                return 1;
            } else {
                return 0;
            }
        } else if (type == Boolean.class) {
            Boolean bool1 = (Boolean)data.getValueAt(row1, column);
            boolean b1 = bool1.booleanValue();
            Boolean bool2 = (Boolean)data.getValueAt(row2, column);
            boolean b2 = bool2.booleanValue();

            if (b1 == b2) {
                return 0;
            } else if (b1) { // Define false < true
                return 1;
            } else {
                return -1;
            }
        } else {
            Object v1 = data.getValueAt(row1, column);
            String s1 = v1.toString();
            Object v2 = data.getValueAt(row2, column);
            String s2 = v2.toString();
            int result = s1.compareTo(s2);

            if (result < 0) {
                return -1;
            } else if (result > 0) {
                return 1;
            } else {
        	return 0;
            }
        }
    }

    public int compare(int row1, int row2) {
        compares++;
        for (int level = 0; level < sortingColumns.size(); level++) {
            Integer column = (Integer)sortingColumns.elementAt(level);
            int result = compareRowsByColumn(row1, row2, column.intValue());
            if (result != 0) {
                return ascending ? result : -result;
            }
        }
        return 0;
    }

    public void reallocateIndexes() {
        int rowCount = model.getRowCount();
        /*---------------------------------------------------------------------
         * Set up a new array of indexes with the right number of elements
         * for the new data model.
         *---------------------------------------------------------------------*/
        indexes = new int[rowCount];

        
        for (int row = 0; row < rowCount; row++) {
            indexes[row] = row;
        }
    }

    public void tableChanged(TableModelEvent e) {
        
        reallocateIndexes();

        super.tableChanged(e);
    }

    public void checkModel() {
        if (indexes.length != model.getRowCount()) {
            System.err.println("Sorter not informed of a change in model.");
        }
    }

    public void sort(Object sender) {
        checkModel();

        compares = 0;
        shuttlesort((int[])indexes.clone(), indexes, 0, indexes.length);
        
    }

    public void n2sort() {
        for (int i = 0; i < getRowCount(); i++) {
            for (int j = i+1; j < getRowCount(); j++) {
                if (compare(indexes[i], indexes[j]) == -1) {
                    swap(i, j);
                }
            }
        }
    }
    /*---------------------------------------------------------------------
     * This is a home-grown implementation which we have not had time
     * to research - it may perform poorly in some circumstances. It
     * requires twice the space of an in-place algorithm and makes
     * NlogN assigments shuttling the values between the two
     * arrays. The number of compares appears to vary between N-1 and
     * NlogN depending on the initial order but the main reason for
     * using it here is that, unlike qsort, it is stable.
     *---------------------------------------------------------------------*/
    public void shuttlesort(int from[], int to[], int low, int high) {
        if (high - low < 2) {
            return;
        }
        int middle = (low + high)/2;
        shuttlesort(to, from, low, middle);
        shuttlesort(to, from, middle, high);

        int p = low;
        int q = middle;

        /*--------------------------------------------------------------------- 
         * This is an optional short-cut; at each recursive call,
         * check to see if the elements in this subset are already
         * ordered.  If so, no further comparisons are needed; the
         * sub-array can just be copied.  The array must be copied rather
         * than assigned otherwise sister calls in the recursion might
         * get out of sinc.  When the number of elements is three they
         * are partitioned so that the first set, [low, mid), has one
         * element and and the second, [mid, high), has two. We skip the
         * optimisation when the number of elements is three or less as
         * the first compare in the normal merge will produce the same
         * sequence of steps. This optimisation seems to be worthwhile
         * for partially ordered lists but some analysis is needed to
         * find out how the performance drops to Nlog(N) as the initial
         * order diminishes - it may drop very quickly.  
         *---------------------------------------------------------------------*/

        if (high - low >= 4 && compare(from[middle-1], from[middle]) <= 0) {
            for (int i = low; i < high; i++) {
                to[i] = from[i];
            }
            return;
        }

        
        for (int i = low; i < high; i++) {
            if (q >= high || (p < middle && compare(from[p], from[q]) <= 0)) {
                to[i] = from[p++];
            }
            else {
                to[i] = from[q++];
            }
        }
    }

    public void swap(int i, int j) {
        int tmp = indexes[i];
        indexes[i] = indexes[j];
        indexes[j] = tmp;
    }
    
    /*---------------------------------------------------------------------
     * The mapping only affects the contents of the data rows.
     * Pass all requests to these rows through the mapping array: "indexes".
     *---------------------------------------------------------------------*/

    public Object getValueAt(int aRow, int aColumn) {
        checkModel();
        return model.getValueAt(indexes[aRow], aColumn);
    }

    public void setValueAt(Object aValue, int aRow, int aColumn) {
        checkModel();
        model.setValueAt(aValue, indexes[aRow], aColumn);
    }

    public void sortByColumn(int column) {
        sortByColumn(column, true);
    }

    public void sortByColumn(int column, boolean ascending) {
        this.ascending = ascending;
        sortingColumns.removeAllElements();
        sortingColumns.addElement(new Integer(column));
        sort(this);
        super.tableChanged(new TableModelEvent(this)); 
    }
    /*---------------------------------------------------------------------
     * There is no-where else to put this. 
     * Add a mouse listener to the Table to trigger a table sort 
     * when a column heading is clicked in the JTable. 
     *---------------------------------------------------------------------*/
    public void addMouseListenerToHeaderInTable(JTable table) { 
        final TableSorter sorter = this; 
        final JTable tableView = table; 
        tableView.setColumnSelectionAllowed(false); 
        MouseAdapter listMouseListener = new MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
                TableColumnModel columnModel = tableView.getColumnModel();
                int viewColumn = columnModel.getColumnIndexAtX(e.getX()); 
                int column = tableView.convertColumnIndexToModel(viewColumn); 
                if (e.getClickCount() == 1 && column != -1) {
     
                    int shiftPressed = e.getModifiers()&InputEvent.SHIFT_MASK; 
                    boolean ascending = (shiftPressed == 0); 
                    sorter.sortByColumn(column, ascending); 
                }
            }
        };
        JTableHeader th = tableView.getTableHeader(); 
        th.addMouseListener(listMouseListener); 
    }
}





