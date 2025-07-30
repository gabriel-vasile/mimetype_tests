// HybGrid2Pos.java
// ---------------------------------------------------------------------
// Hybsweeper: A RESOURCE FOR DETECTING HIGH-DENSITY PLATE GRIDDING 
// COORDINATES. 2005. BioTechniques. Vol 39, No. 9. 320-324.
// 
// GR Lazo, N Lui, YQ Gu, X Kong, D Coleman-Derr, and OD Anderson.
// USDA ARS Western Regional Research Center, 800 Buchanan Street, 
// Albany, CA 94710-1105.
// 
// Address correspondence to: Gerard R. Lazo (lazo@pw.usda.gov).
// ---------------------------------------------------------------------
// Notes NL:
// May 2001 (Hybsweeper)
// Oct 2001 (Hyb3) changes Hybsweeper to allow for quicker
// selection of plate coordinates--clicking on one clone 
// in a pair brings up the other clone as well.
// Jun 2003 (HybGrid) Add additional grid lines separating each 4x4 pattern
// 	HybGrid1 uses different calculation than HybGrid 6/16/03
//	HybGrid2 adds Swing components, scrollbars around image, and deletion feature.
//  		(swing, scrollbars done 10/14/03)
//		("Show"/"Remove" feature done 10/16/03)
// Jan 2004 (HybGrid2Pos) adds position # to output.
// Dec 2004 (HybGrid2Pos) Change max number of plates from 28 to 50; add filter and field #s to output
//
// Given an image of a filter autorad, this program captures 
// the location of a clone on the filter and reports the 
// original plate number and well coordinates (row/column).
//
// It loads/displays a user-specified image file.  
// To establish the screen dimensions of the filter, the
// user picks reference points (top left corner & bottom
// right corner) to outline the filter, just off the 
// spotting area.
//
// Addresses can be listed in the order saved or in plate order.
// Since applets can't write directly to a local file, 
// a text area is provided from which the user can 
// cut/paste a report of clone addresses for saving to a file.
//
// Users who do not use the ordering protocol of fields 2,6,3 in
// the top row and fields 4,1,5 in the bottom row of the filter
// can set the field numbers in the source code below.
// (See "UPPER_LEFT")

import java.util.*;		// needed for vectors & hashtable
import javax.swing.*;		// needed for Swing 
import java.awt.*;		// awt & awt.event are two main AWT pkgs that most Swing programs need
				// java.awt.* needed for Image class
import java.awt.event.*;	// java.awt.event.* needed for event listeners *Listener (e.g., button)
				
//<applet code = "HybGrid2Pos" WIDTH=974 HEIGHT=598></applet>
// dimensions here have nothing to do with size of text box on bottom left

public class HybGrid2Pos extends JApplet implements ActionListener, ItemListener,
                             			MouseListener, MouseMotionListener
{ 
// comment out after debug
String err1;

  Image autorad;    		// image of autoradiogram of filter

  JTextField imageName;		// to capture user-input filename
  
  Hashtable xMatchedSignals;	// for x-y coordinates of matching signals
  Hashtable yMatchedSignals;	// "
  Hashtable outputStrings;	// for output to save to file
  Vector outputByPlate; 	//  " in plate order
  Enumeration hashKeys;		// hash keys to use when removing/copying outputStrings
  
  JComboBox whichFilter;	// pop-up list of filter/plate numbers
  JComboBox whichReport;	// pop-up list of report choices
  JComboBox whatIntensity;	// pop-up list of signal intensity ratings
 
  JFrame f;			// Help frame (window)

  String location;		// for plate location report
  String intensity="none";	// signal rating for report
  String newPosition;		// user-selected clone position override
  String rowString;		// row # on plate (including leading zero)
  String plateString;		// plate number (including leading zeros)
  
  String stringToShow;		// user has selected this set of coordinates to show
  String stringToRemove;	// user has selected this set of coordinates to remove
  String currentHashKey;	// used in "while" loop to show/remove selected clone/string in hashtable
  String hashKeyToShow1st;	// "
  String hashKeyToShow2nd;	// "
  String hashKeyToRemove;	// "
  String hashStringValue;	// temporary holding place for output string hash value
  
  boolean printReport=false;	// print report in text box (10/9/03)
  boolean inPlateOrder=false;	// print report in plate order
  boolean drawPoint1=false;	// paint point on 4x4 dup pattern / clone array
  boolean inXAisle=false;	// if selected spot in vertical aisle
  boolean inYAisle=false;	// if selected spot in horizontal aisle
  boolean doNotSaveAgain;	// Don't save same points twice
  boolean showHelp=false;	// show help frame window
  boolean showSelectedClone=false;	// highlight clone selected in report window  
  boolean cloneFound;		// to help in search for clone to show/remove
  
  int x1, y1; 			// top left coordinates
  int x2, y2;			// bottom right
  int x3, y3;                   // width & length of screen image

  int xIncrement, yIncrement;	// lines around 4x4 grids

  int mouseX, mouseY;           // screen coordinates for selected spot
  int gridX, gridY;		// selections from 4x4 grid on data panel
  int p2MouseX, p2MouseY;	// screen coordinates for selected spot's twin
  int spotX, spotY;		// coordinates for mouseX/Y net of x1 & y1
  int spot_433_X, spot_432_Y;   // coordinates on a 433x432 grid (includes aisles)
  int realSpotX, realSpotY;	// coordinates on a 192x192 grid
  int p2RealSpotX, p2RealSpotY; // coordinates on a 192x192 grid for twin
  int xSpot,ySpot;		// coordinates for painted spots
  
  int fieldNum, position;	// location on filter
  
  int plateNum, rowNum, colNum;	// plate/well locations per calculatePlate()
  int plateMultiplier=0;	// to account for different filters
  int filterNum=1;		// for display (plateMultipler+1)

  int signalCounter=0;		// for vector of matchedSignals
  int stringCounter=0;		// to track strings of plate #s and well coordinates
  int signalHashKey=0;		// for hashtable use only, distinct from signalCounter
  int stringHashKey=0;  	// for hashtable use only, distinct from stringCounter

  int textStart, textEnd;	// to capture textarea coordinates of selected text

  double xMultiplier;		// to bring x coordinate to 433 scale; 433 / width
  double yMultiplier;           // to bring y coordinate to 432 scale; 432 / height

  Integer hashXValue;		// temporary holding place for x-coord hash value
 
  char column='0';		// column letter on plate:
  				//  initialized as zero because Netscape displays
  				//  "square" character if ' ' used

  char xAisle;			// x-aisle east(E)/west(W) of 4x4 pattern
  char yAisle; 			// y-aisle north(N)/south(S) of 4x4 pattern

  final static double XSCALE = 433;
  final static double YSCALE = 432;
  final static double X3_Y3_ADJUSTER = 192.0/193.0; 

  final static Color  LIGHTER_YELLOW =   new Color(255,255,225);
  final static Color  CYAN = 	new Color(150,245,255);
  final static Color  GREEN = 	new Color(0,77,30);
  final static Color  FUCHSIA = new Color(170,0,160);  // darker than Color.magenta
  final static Color  PURPLE = 	new Color(175,0,235);
  final static Color  PINK = 	new Color(250,180,180); // for grid lines betw 4x4s
  final static int    SPOT_AISLE = 1;  // space between spots
  final static int    FIELD_AISLE = 2; // space between fields
  final static int    ADJUSTMENT = 3;	// adjust x-y to pick spot at pointer tip 
  				// (otherwise, x-y is southeast/under mouse pointer)

//  ADJUST THE FOLLOWING SIX CONSTANTS DEPENDING ON HOW FIELDS ARE 
//  SET UP ON YOUR FILTERS:

// Default setup
  final static int    UPPER_LEFT = 2;
  final static int    UPPER_CENTER = 6;
  final static int    UPPER_RIGHT = 3;
  final static int    LOWER_LEFT = 4;
  final static int    LOWER_CENTER = 1;
  final static int    LOWER_RIGHT = 5;

/* an alternative setup
  final static int    UPPER_LEFT = 1;
  final static int    UPPER_CENTER = 2;
  final static int    UPPER_RIGHT = 3;
  final static int    LOWER_LEFT = 4;
  final static int    LOWER_CENTER = 5;
  final static int    LOWER_RIGHT = 6;
*/
  
/*
	-------------------------------------------------
	|		|		|		|
	|		|		|		|
	|		|		|		|
	|   Upper	|   Upper	|    Upper	|
	|   Left	|   Center	|    Right	|
	|   Field	|   Field 	|    Field	|
	|		|		|		|
	|		|		|		|
	|		|		|		|
	-------------------------------------------------
	|		|		|		|
	|		|		|		|
	|		|		|		|
	|   Lower	|    Lower	|    Lower	|
	|   Left	|    Center	|    Right	|
	|   Field	|    Field      |    Field    	|
	|		|		|		|
	|		|		|		|
	|		|		|		|
	-------------------------------------------------
*/

  ButtonGroup selectOption;		// radio buttons to establish filter reference coordinates
  JRadioButton setTopLeft, setBottomRight, pickSpot;
 
  JButton help;				// displays instructions 
  JButton refresh;			// zero out values
  JButton saveCoords;			// save values
  JButton showCoords;			// highlight selected clone on filter
  JButton removeCoords;			// remove one set of coordinates  
  
  JTextArea t;				// text area to write report
  JPanel appletPane; 		// http://java.sun.com/docs/books/tutorial/uiswing/converting/example-swing/TextEventDemo.java
  				// then "appletPane.setOpaque(true);"  "setContentPane(appletPane);"
  // Container appletPane;
  // JComponent appletPane;  	// http://java.sun.com/docs/books/tutorial/uiswing/components/toplevel.html
				// mentions this and provides sample code for making customized contentPane if need JComponent features

  Font smallFont = new Font("SansSerif", Font.PLAIN, 9);
// doesn't make any smaller:  Font smallFont = new Font("SansSerif", Font.PLAIN, 8);
//*****************************************************************************	
  public void init() 
  {
    addMouseListener(this); 		// register applet as mouse event listener 
    addMouseMotionListener(this);

    appletPane = new JPanel();		// need to paint to this panel instead of applet
	    				// "appletPane = getContentPane();" would've been usable only JComponent appletPane
    					// 	gets contentPane for applet; getContentPane() returns Container object

    GridBagLayout gridbag = new GridBagLayout();
    GridBagConstraints c = new GridBagConstraints();
    appletPane.setLayout(gridbag);	// to position components using gridbaglayout

    appletPane.setOpaque(true);		// JPanel() opaque by default; so component not see-thru
    setContentPane(appletPane);		// setContentPane() returns JComponent object
    					//  	implies "getRootPane().setContentPane(contentPane);"
					// 	"contentPane" is primary container for application-specific components	
					// 	children are added to contentPane; layout mgr req'd for contentPane;

    setBackground(Color.lightGray);	// force default gray backgrd (Netscape default=white)
    setFont(smallFont); 


    // panel on LEFT for buttons
    HybDataPanel hybDataPanel = new HybDataPanel(this);
    c.weightx = 0;				// start w/standard weighting
    c.weighty = 0;
    c.gridx = 0;
    c.gridy = 0;
    c.anchor = GridBagConstraints.NORTHWEST; 	// anchor data panel to upper left corner
    gridbag.setConstraints(hybDataPanel, c); 
    // unnecessary: hybDataPanel.addMouseListener(this);
    appletPane.add(hybDataPanel);		// add panel for buttons to applet


    // panel on RIGHT to display filter
    HybImagePanel hybImagePanel = new HybImagePanel(this);	// panel for image area
    hybImagePanel.setBackground(Color.white);
    hybImagePanel.addMouseListener(this);
// 10/21/03 increase height dimension because SHeath had bigger image
//    hybImagePanel.setPreferredSize(new Dimension(1300,1200));	// has to be big enough for diff-sized images
    hybImagePanel.setPreferredSize(new Dimension(1600,2100));	// has to be big enough for diff-sized images
    int vertBar  = ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS;
    int horizBar = ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS;

    // create scroll pane and add image panel
    JScrollPane imageJSP = new JScrollPane(hybImagePanel, vertBar, horizBar);	
    imageJSP.setPreferredSize(new Dimension(450,450));		// (no apparent impact) for small resolution screens

    // layout for image panel
    c.weightx = 1;				// request any extra horizontal space
    c.weighty = 1; 				// request any extra vertical space
    c.gridx = 1;
    c.gridy = 0;
    c.fill = GridBagConstraints.BOTH;		// so image panel will fill in larger display areas
    gridbag.setConstraints(imageJSP, c);
    appletPane.add(imageJSP);			// add jScrollPane to applet


    // ensure components uniform width/height within data panel
    c.fill = GridBagConstraints.BOTH;		// resize component to fit display area in both dimensions


    // components in data panel on left
    JLabel imageTitle = new JLabel("Enter image filename", JLabel.CENTER);
    hybDataPanel.setLayout(gridbag);
    c.weightx = 0;				// reset to standard weighting
    c.weighty = 0;
    c.gridx = 0;
    c.gridy = 0;
    c.anchor = GridBagConstraints.NORTHWEST; 	// so components anchored to upper left, not CENTER
    gridbag.setConstraints(imageTitle,c);
    hybDataPanel.add(imageTitle);
    
    
    // TEXT FIELD to enter FILENAME
    imageName = new JTextField("here",12);	// get image filename using a text field
    c.gridx = 0;
    c.gridy = 1;				// 2nd element in vertical dimension
    gridbag.setConstraints(imageName,c);
    hybDataPanel.add(imageName);
    imageName.setActionCommand("Filename Entered"); // actionEvent when text entered into text field
    imageName.addActionListener(this);


    // FILTER choice list (if multiple filters screened)    
    whichFilter = new JComboBox();
    whichFilter.addItem(" 1 | 1-48");		// first item selected by default
    whichFilter.addItem(" 2 | 49-96");
    whichFilter.addItem(" 3 | 97-144");
    whichFilter.addItem(" 4 | 145-192");
    whichFilter.addItem(" 5 | 193-240");
    whichFilter.addItem(" 6 | 241-288");
    whichFilter.addItem(" 7 | 289-336");
    whichFilter.addItem(" 8 | 337-384");
    whichFilter.addItem(" 9 | 385-432");
    whichFilter.addItem("10 | 433-480");
    whichFilter.addItem("11 | 481-528");
    whichFilter.addItem("12 | 529-576");
    whichFilter.addItem("13 | 577-624");
    whichFilter.addItem("14 | 625-672");
    whichFilter.addItem("15 | 673-720");
    whichFilter.addItem("16 | 721-768");
    whichFilter.addItem("17 | 769-816");
    whichFilter.addItem("18 | 817-864");
    whichFilter.addItem("19 | 865-912");
    whichFilter.addItem("20 | 913-960");
    whichFilter.addItem("21 | 961-1008");
    whichFilter.addItem("22 | 1009-1056");
    whichFilter.addItem("23 | 1057-1104");
    whichFilter.addItem("24 | 1105-1152");
    whichFilter.addItem("25 | 1153-1200");
    whichFilter.addItem("26 | 1201-1248");
    whichFilter.addItem("27 | 1249-1296");
    whichFilter.addItem("28 | 1297-1344");
    whichFilter.addItem("29 | 1345-1392");
    whichFilter.addItem("30 | 1393-1440");
    whichFilter.addItem("31 | 1441-1488");
    whichFilter.addItem("32 | 1489-1536");
    whichFilter.addItem("33 | 1537-1584");
    whichFilter.addItem("34 | 1585-1632");
    whichFilter.addItem("35 | 1633-1680");
    whichFilter.addItem("36 | 1681-1728");
    whichFilter.addItem("37 | 1729-1776");
    whichFilter.addItem("38 | 1777-1824");
    whichFilter.addItem("39 | 1825-1872");
    whichFilter.addItem("40 | 1873-1920");
    whichFilter.addItem("41 | 1921-1968");
    whichFilter.addItem("42 | 1969-2016");
    whichFilter.addItem("43 | 2017-2064");
    whichFilter.addItem("44 | 2065-2112");
    whichFilter.addItem("45 | 2113-2160");
    whichFilter.addItem("46 | 2161-2208");
    whichFilter.addItem("47 | 2209-2256");
    whichFilter.addItem("48 | 2257-2304");
    whichFilter.addItem("49 | 2305-2352");
    whichFilter.addItem("50 | 2353-2400");
    
    c.gridx = 0;
    c.gridy = 2;
    gridbag.setConstraints(whichFilter,c);
    hybDataPanel.add(whichFilter);
    whichFilter.addItemListener(this);

    
    // button to bring up HELP window
    f = new HybGrid2PosHelpFrame("Help Frame Window");
    f.setSize(550,560); // pixels wide, pixels high
    help = new JButton("Help");			
    help.setBackground(getBackground());
    help.setForeground(GREEN);
    help.addActionListener(this);
    c.gridx=0;
    c.gridy=3;
    gridbag.setConstraints(help,c);
    hybDataPanel.add(help);
    

    // RADIO BUTTONS   
    setTopLeft=new JRadioButton("Top Left",true);  // Do buttons w/o label 1st...
    setTopLeft.setActionCommand("Top Left");
    setTopLeft.setBackground(getBackground());    
    setTopLeft.addActionListener(this);

    setBottomRight=new JRadioButton("Bottom Right",false);
    setBottomRight.setActionCommand("Bottom Right");
    setBottomRight.setBackground(getBackground());         
    setBottomRight.addActionListener(this);
         
    pickSpot=new JRadioButton("Pick Spot",false);
    pickSpot.setActionCommand("Pick Spot");
    pickSpot.setBackground(getBackground());         
    pickSpot.addActionListener(this);

    selectOption = new ButtonGroup();
    selectOption.add(setTopLeft);
    selectOption.add(setBottomRight);
    selectOption.add(pickSpot);


    // panel for three RADIO BUTTONS
    JPanel radioPanel = new JPanel();
    radioPanel.setLayout(new GridLayout(0,1)); // 1 column
    radioPanel.add(setTopLeft);
    radioPanel.add(setBottomRight);
    radioPanel.add(pickSpot);
    c.gridx=0;
    c.gridy=4;
    c.gridheight=3;
    gridbag.setConstraints(radioPanel,c);
    hybDataPanel.add(radioPanel);
    

    // REFRESH button
    refresh = new JButton("Refresh");     	// click to zero out values
    refresh.setBackground(getBackground());	// button color
    refresh.setForeground(Color.white);		// "Color.purple" backgrd too bright
    refresh.addActionListener(this); 		// register to receive events
    c.gridx=0;
    c.gridy=7;		// needs to be 7 because gridheight of radio button panel is 3
    c.gridheight=1; 	// required to return to default height
    gridbag.setConstraints(refresh,c);
    hybDataPanel.add(refresh);


    // GRAPHICS area for plate/well coordinates and 4x4 grid
    HybGridPanel hybGridPanel = new HybGridPanel(this);
    hybGridPanel.setPreferredSize(new Dimension(100,185)); // needed for panel to show
    c.gridx=0;
    c.gridy=8;
    gridbag.setConstraints(hybGridPanel,c);
    hybDataPanel.add(hybGridPanel);


    // SAVE COORDINATES button
    saveCoords = new JButton("Save Coordinates");	// record pairs of signals
    saveCoords.setBackground(getBackground()); 
    saveCoords.setForeground(FUCHSIA);		// "Color.magenta" too bright
    saveCoords.addActionListener(this);
    c.gridx=0;
    c.gridy=9;
    gridbag.setConstraints(saveCoords,c);
    hybDataPanel.add(saveCoords);
  

    // should user decide to give RATING to clone selections
    whatIntensity = new JComboBox();		// designate signal intensity
    whatIntensity.addItem("No Rating");
    whatIntensity.addItem("1");
    whatIntensity.addItem("2");
    whatIntensity.addItem("3");
    whatIntensity.addItem("4");
    whatIntensity.addItem("5");
    c.gridx=0;
    c.gridy=10;
    gridbag.setConstraints(whatIntensity,c);
    hybDataPanel.add(whatIntensity);
    whatIntensity.addItemListener(this);


    // choice between no REPORT, report in order saved, report in plate order
    whichReport = new JComboBox();
    whichReport.addItem("No Report");		// 1st item selected by default
    whichReport.addItem("Order Saved");
    whichReport.addItem("Plate Order");
    c.gridx=0;
    c.gridy=11;
    gridbag.setConstraints(whichReport,c);
    hybDataPanel.add(whichReport);
    whichReport.addItemListener(this);
    
        
    // TEXTAREA for report
    JLabel outputTitle = new JLabel("Cut & paste to save", JLabel.CENTER);
    c.gridx=0;
    c.gridy=12;
    gridbag.setConstraints(outputTitle,c);
    hybDataPanel.add(outputTitle);	

    // put text area in a scroll pane and set scroll pane size
    t = new JTextArea("here");
    JScrollPane outPane = new JScrollPane(t,vertBar, horizBar);
    outPane.setPreferredSize(new Dimension(97,65));
    c.gridx=0;
    c.gridy=13;
    gridbag.setConstraints(outPane,c);
    hybDataPanel.add(outPane);	// add scroll output pane to applet


    // button to SHOW set of coordinates
    showCoords = new JButton("Show");	// record pairs of signals
    showCoords.setBackground(getBackground()); 
    showCoords.setForeground(LIGHTER_YELLOW);	
    showCoords.addActionListener(this);
    c.gridx=0;
    c.gridy=14;
    gridbag.setConstraints(showCoords,c);
    hybDataPanel.add(showCoords);


    // button to REMOVE set of coordinates
    removeCoords = new JButton("Remove");	// record pairs of signals
    removeCoords.setBackground(getBackground()); 
    removeCoords.setForeground(Color.red);		// "Color.magenta" too bright
    removeCoords.addActionListener(this);
    c.gridx=0;
    c.gridy=15;
    gridbag.setConstraints(removeCoords,c);
    hybDataPanel.add(removeCoords);
    

    xMatchedSignals = new Hashtable();	// dynamic array to hold saved signals (x,y)
    yMatchedSignals = new Hashtable();	// "
    outputStrings   = new Hashtable();	// " (plate/well locations) in order saved
    outputByPlate   = new Vector();	// "  "			    in plate order

    imageName.requestFocus();	// in Unix, need this for imageName.selectAll() to work. 
				// (requestFocus() gets focus in W2K, but not Unix)
				// imageName.requestFocusInWindow(); works in W2K, not UNIX 
				// imageName.grabFocus(); works in W2K, not UNIX 
				
    imageName.selectAll();	// has to be at end of init() to work
    				// highlight text field contents to facilitate filename entry
  } // end init
//*******************************************************************************  
  public void stop()
  {
    f.setVisible(false);		// close help window
  }
//*******************************************************************************
  public void sortClones()
  {
   try
   {
    outputByPlate.removeAllElements();	// in-plate-order reports
     

    // make Vector copy of the in-saved-order reports
    hashKeys = outputStrings.keys();
    int i=0;
    while ( hashKeys.hasMoreElements() )
    {
      currentHashKey = (String) hashKeys.nextElement();
      outputByPlate.insertElementAt(outputStrings.get(currentHashKey), i++);
    }
 
    // SORT
    // Unable to use Arrays.sort as java.util.Arrays couldn't be accessed
    // (a security issue); therefore, for-loops were used to do the sorting:

    int outerCount;		// index for outer for loop
    int innerCount;
    int lowerNumberIndex;	// index for lower "string" in comparison
    String tmp;			// holding place for string
  
    // Go thru array, find lowest-value string, put at head of line, 
    // go thru all array elements except first one, find lowest value, put in 2nd spot...

    if ( stringCounter > 1 )	// sort only if more than one clone pair saved
    {    
     for (outerCount = 0; outerCount < stringCounter-1; outerCount++)
     {
      lowerNumberIndex = outerCount;	// initial assumption
      for (innerCount = outerCount + 1; innerCount < stringCounter; innerCount++)
      {
        // if current string > the next string, it should follow the next string
        if ( ((String)(outputByPlate.elementAt(lowerNumberIndex))).compareTo((String)(outputByPlate.elementAt(innerCount))) > 0) 
        {
          lowerNumberIndex = innerCount;// make the next string's index the "lower string index"
        } // end if  
      } // end for (innerCount)
    
      // (-->sort report for output to "Cut/Save" text area)
      tmp = (String)(outputByPlate.elementAt(outerCount));
      outputByPlate.setElementAt(outputByPlate.elementAt(lowerNumberIndex),outerCount);
      outputByPlate.setElementAt(tmp,lowerNumberIndex);
     } // end for (outerCount)
    } // end if stringCounter > 1
   }
   catch (Exception e)
   {
    err1=err1+"sortClones error: "+e;
    e.printStackTrace();
   }
  } // end sortClones()
//*****************************************************************************	
  public void saveClones()
  {
    try
    {
      // POINT 1
      xMatchedSignals.put(""+signalHashKey,(new Integer(mouseX)));
      yMatchedSignals.put(""+signalHashKey,(new Integer(mouseY)));
      signalCounter++;
      signalHashKey++;
      
      // POINT 2       
      xMatchedSignals.put(""+signalHashKey,(new Integer(p2MouseX)));
      yMatchedSignals.put(""+signalHashKey,(new Integer(p2MouseY)));
      signalCounter++;
      signalHashKey++;

      // save plate/well data (NB:  filter column is plate row; filter row is plate column)
//      location = plateString+"\t"+column+"\t"+rowString+"\t"+intensity;
// 1/22/2004
//      location = plateString+"\t"+column+"\t"+rowString+"\t"+intensity+"\t"+position;
// 12/10/2004
      location = filterNum+"\t"+plateString+"\t"+column+"\t"+rowString+"\t"+intensity+"\t"+fieldNum+"\t"+position;
      outputStrings.put(""+stringHashKey,location); 	// strings for output to text area
      stringCounter++;
      stringHashKey++;
			
      drawPoint1=false; 	// once points have been saved, remove cyan circle
      
      doNotSaveAgain=true;	// once data saved, do not save again
    }
    catch (Exception e)
    {
      err1=err1+"saveClones error: "+e;
      e.printStackTrace();
    }
  } // end saveClones()
//*****************************************************************************	
// Need following so update() doesn't clear screen of previous output (e.g., x1y1)
  public void update(Graphics g)
  {
    paint(g);
  }
//****************************************************************************  
  public void itemStateChanged(ItemEvent ie)   // radio button or choice list
  {                                            // --> repaint
   try
   {
     printReport=false;
     inPlateOrder=false;	// code reducer - assume in-plate-order report not required
  
    if ( whichReport.getSelectedItem().equals("Order Saved") )
    {
      printReport=true;
    }
    else if ( whichReport.getSelectedItem().equals("Plate Order") )
    {
      printReport=true;
      inPlateOrder=true;	// print short in-plate-order report
    }
    else	// no report requested
    {
      printReport=false;
    }
    
    if      ( whichFilter.getSelectedItem().equals(" 1 | 1-48")) { plateMultiplier = 0; }	// first item selected by default
    else if ( whichFilter.getSelectedItem().equals(" 2 | 49-96")) { plateMultiplier = 1; }
    else if ( whichFilter.getSelectedItem().equals(" 3 | 97-144")) { plateMultiplier = 2; }
    else if ( whichFilter.getSelectedItem().equals(" 4 | 145-192")) { plateMultiplier = 3; }
    else if ( whichFilter.getSelectedItem().equals(" 5 | 193-240")) { plateMultiplier = 4; }
    else if ( whichFilter.getSelectedItem().equals(" 6 | 241-288")) { plateMultiplier = 5; }
    else if ( whichFilter.getSelectedItem().equals(" 7 | 289-336")) { plateMultiplier = 6; }
    else if ( whichFilter.getSelectedItem().equals(" 8 | 337-384")) { plateMultiplier = 7; }
    else if ( whichFilter.getSelectedItem().equals(" 9 | 385-432")) { plateMultiplier = 8; }
    else if ( whichFilter.getSelectedItem().equals("10 | 433-480")) { plateMultiplier = 9; }
    else if ( whichFilter.getSelectedItem().equals("11 | 481-528")) { plateMultiplier = 10; }
    else if ( whichFilter.getSelectedItem().equals("12 | 529-576")) { plateMultiplier = 11; }
    else if ( whichFilter.getSelectedItem().equals("13 | 577-624")) { plateMultiplier = 12; }
    else if ( whichFilter.getSelectedItem().equals("14 | 625-672")) { plateMultiplier = 13; }
    else if ( whichFilter.getSelectedItem().equals("15 | 673-720")) { plateMultiplier = 14; }
    else if ( whichFilter.getSelectedItem().equals("16 | 721-768")) { plateMultiplier = 15; }
    else if ( whichFilter.getSelectedItem().equals("17 | 769-816")) { plateMultiplier = 16; }
    else if ( whichFilter.getSelectedItem().equals("18 | 817-864")) { plateMultiplier = 17; }
    else if ( whichFilter.getSelectedItem().equals("19 | 865-912")) { plateMultiplier = 18; }
    else if ( whichFilter.getSelectedItem().equals("20 | 913-960")) { plateMultiplier = 19; }
    else if ( whichFilter.getSelectedItem().equals("21 | 961-1008")) { plateMultiplier = 20; }
    else if ( whichFilter.getSelectedItem().equals("22 | 1009-1056")) { plateMultiplier = 21; }
    else if ( whichFilter.getSelectedItem().equals("23 | 1057-1104")) { plateMultiplier = 22; }
    else if ( whichFilter.getSelectedItem().equals("24 | 1105-1152")) { plateMultiplier = 23; }
    else if ( whichFilter.getSelectedItem().equals("25 | 1153-1200")) { plateMultiplier = 24; }
    else if ( whichFilter.getSelectedItem().equals("26 | 1201-1248")) { plateMultiplier = 25; }
    else if ( whichFilter.getSelectedItem().equals("27 | 1249-1296")) { plateMultiplier = 26; }
    else if ( whichFilter.getSelectedItem().equals("28 | 1297-1344")) { plateMultiplier = 27; }
    else if ( whichFilter.getSelectedItem().equals("29 | 1345-1392")) { plateMultiplier = 28; }
    else if ( whichFilter.getSelectedItem().equals("30 | 1393-1440")) { plateMultiplier = 29; }
    else if ( whichFilter.getSelectedItem().equals("31 | 1441-1488")) { plateMultiplier = 30; }
    else if ( whichFilter.getSelectedItem().equals("32 | 1489-1536")) { plateMultiplier = 31; }
    else if ( whichFilter.getSelectedItem().equals("33 | 1537-1584")) { plateMultiplier = 32; }
    else if ( whichFilter.getSelectedItem().equals("34 | 1585-1632")) { plateMultiplier = 33; }
    else if ( whichFilter.getSelectedItem().equals("35 | 1633-1680")) { plateMultiplier = 34; }
    else if ( whichFilter.getSelectedItem().equals("36 | 1681-1728")) { plateMultiplier = 35; }
    else if ( whichFilter.getSelectedItem().equals("37 | 1729-1776")) { plateMultiplier = 36; }
    else if ( whichFilter.getSelectedItem().equals("38 | 1777-1824")) { plateMultiplier = 37; }
    else if ( whichFilter.getSelectedItem().equals("39 | 1825-1872")) { plateMultiplier = 38; }
    else if ( whichFilter.getSelectedItem().equals("40 | 1873-1920")) { plateMultiplier = 39; }
    else if ( whichFilter.getSelectedItem().equals("41 | 1921-1968")) { plateMultiplier = 40; }
    else if ( whichFilter.getSelectedItem().equals("42 | 1969-2016")) { plateMultiplier = 41; }
    else if ( whichFilter.getSelectedItem().equals("43 | 2017-2064")) { plateMultiplier = 42; }
    else if ( whichFilter.getSelectedItem().equals("44 | 2065-2112")) { plateMultiplier = 43; }
    else if ( whichFilter.getSelectedItem().equals("45 | 2113-2160")) { plateMultiplier = 44; }
    else if ( whichFilter.getSelectedItem().equals("46 | 2161-2208")) { plateMultiplier = 45; }
    else if ( whichFilter.getSelectedItem().equals("47 | 2209-2256")) { plateMultiplier = 46; }
    else if ( whichFilter.getSelectedItem().equals("48 | 2257-2304")) { plateMultiplier = 47; }
    else if ( whichFilter.getSelectedItem().equals("49 | 2305-2352")) { plateMultiplier = 48; }
    else 
    {
      if ( whichFilter.getSelectedItem().equals("50 | 2353-2400")) { plateMultiplier = 49; }
    }
    filterNum = plateMultiplier+1;
    
    if  ( whatIntensity.getSelectedItem().equals("No Rating")) { intensity = "none"; } // default
    else if ( whatIntensity.getSelectedItem().equals("1"))     { intensity = "one"; }
    else if ( whatIntensity.getSelectedItem().equals("2"))     { intensity = "two"; }
    else if ( whatIntensity.getSelectedItem().equals("3"))     { intensity = "three"; }
    else if ( whatIntensity.getSelectedItem().equals("4"))     { intensity = "four"; }
    else						       { intensity = "five"; }
      
    repaint();
   }
   catch (Exception e)
   {  
    err1=err1+"itemStateChanged error: "+e;
    e.printStackTrace();
   }
  } // end itemStateChanged
//****************************************************************************    
  public void mouseClicked(MouseEvent me)
  {
   try
   {
    if ( setTopLeft.isSelected() || setBottomRight.isSelected() ) // ref pts
    {
      if ( setTopLeft.isSelected() ) 	// "Top Left" button selected
      {
        x1=me.getX() - ADJUSTMENT;  	// choose point at mouse ptr tip
        y1=me.getY() - ADJUSTMENT;
      }
      else   				// "Lower Right" button selected
      {
        x2=me.getX() - ADJUSTMENT;
        y2=me.getY() - ADJUSTMENT;
      }
      
      if ( ((x2-x1) > 0) &&		// if both ref pts have been picked
           (x1 != 0)     &&		// and in correct relative orientation
           (x2 != 0) )
      {
        // x3=x2-x1 filter width, y3=y2-y1 filter height
        x3 = x2-x1;  			// calculate filter's screen dimensions
        y3 = y2-y1;

        // variables needed to bring actual coordinates to scale of standard filter dimensions
        xMultiplier = XSCALE / (X3_Y3_ADJUSTER*x3);  // remove off-filter part; (XSCALE=433)
        yMultiplier = YSCALE / (X3_Y3_ADJUSTER*y3);  // formerly (int)(X3_Y3_ADJUSTER*y3)
      }
    } 
    else			// "Pick Spot" button selected
    {
      if ( (me.isControlDown()) && 	// if control key held down
           (drawPoint1) &&		// & a valid selection
           (!doNotSaveAgain) )		// & point wasn't just saved
      {
        saveClones();		// public void saveClones()
      }
      else if (me.isControlDown()) 	// if control key down (but point already saved)
      {}				// do nothing
      else 			// control key not down (only right or left mouse click)
      {				// 	-->OK to enable "Save Coordinates" button
        doNotSaveAgain=false;
        
        mouseX=me.getX() - ADJUSTMENT;	// adj causes selected spot to 
        mouseY=me.getY() - ADJUSTMENT;	// display at mouse pointer tip

	// removing "if (me.isMetaDown())" allows MacIntosh users to use applet

	if ( (mouseX < x1) || (mouseX > x2) || (mouseY < y1) || (mouseY > y2) ) // click outside image
	{
	  drawPoint1 = false;		// don't draw point or do any calculations
	} 
        else 	// if ( (mouseX >= x1) && (mouseX <= x2) && (mouseY >= y1) && (mouseY <= y2) ) 
        	// if clicking on filter image, record data for Point 1
        { 			  
          calculateXY();	  // calc spot's coordinates on filter
          calculatePlate();	  // calc spot's plate number & well address
          
          mouseX=getXCoord(realSpotX);	// redo screen coordinates for selected clone
          mouseY=getYCoord(realSpotY);	// (otherwise, clone pair looks misaligned (but isn't)
					// NB: this adjustment changes x,y 0 to 3 pixels from
					// actual point clicked
					
	  p2MouseX=getXCoord(p2RealSpotX);	// calc x,y coords of selected clone's twin
	  p2MouseY=getYCoord(p2RealSpotY);
	  
          // convert to strings and add leading zeros as appropriate
          // plate numbers        
               if (plateNum < 10)   { plateString = "000"+String.valueOf(plateNum); } 
          else if (plateNum < 100)  { plateString = "00"+String.valueOf(plateNum); }
          else if (plateNum < 1000) { plateString = "0"+String.valueOf(plateNum); }
          else                      { plateString = String.valueOf(plateNum); } 
        
          // row numbers
          if (rowNum < 10) { rowString = "0"+String.valueOf(rowNum); }
          else		   { rowString = String.valueOf(rowNum); }
        
          drawPoint1=true;  	// OK to paint CYAN spots
        } // end if clicking on image
      } // end if Ctrl-key down or up
    } // end if radio button
    
    repaint();			// required to update image after mouseClick
   }
   catch (Exception e)
   {
    err1=err1+"mouseClicked error: "+e;
    e.printStackTrace();
   }
  } // end mouseClicked
//****************************************************************************  
  public void mouseEntered(MouseEvent me) {} // empty implementation instead of
  public void mouseExited(MouseEvent me) {}  // using MouseAdapter class
  public void mousePressed(MouseEvent me) {}
  public void mouseReleased(MouseEvent me) {}
  public void mouseDragged(MouseEvent me) {}
  public void mouseMoved(MouseEvent me) {}

//*******************************************************************************************
  public void actionPerformed(ActionEvent ae)
  {
   try
   {
    if (ae.getActionCommand().equals("Help"))
    {
      showHelp=true;
    }
    else if (ae.getActionCommand().equals("Filename Entered"))
    {
      autorad = getImage(getDocumentBase(), imageName.getText()); // gets image file; trim() unnec.
      imageName.selectAll();		// highlight current filename for ease of entering next filename
    }
    else if (ae.getActionCommand().equals("Refresh"))
    {
      x1=0; x2=0; y1=0; y2=0; x3=0; y3=0; 
      mouseX=0;  p2MouseX=0;
      mouseY=0;  p2MouseY=0;
      spotX=0; spotY=0;
      
      xMultiplier=0; yMultiplier=0;
      spot_433_X=0; spot_432_Y=0;
      realSpotX=0; p2RealSpotX=0;
      realSpotY=0; p2RealSpotY=0;
      xSpot=0; ySpot=0;
         
      plateNum=0; 
      plateString=null;
      rowNum=0; 
      rowString=null; 

      colNum=0; 
      column='0';  	
      position=0; 
      newPosition=null;
      fieldNum=0; 
      
      inPlateOrder=false;
      drawPoint1=false; 
      inXAisle=false; 
      inYAisle=false; 
      showHelp=false;
      xAisle=' '; 
      yAisle=' '; 

      xMatchedSignals.clear();
      yMatchedSignals.clear();
      outputStrings.clear();
      hashKeyToShow1st = "";
      hashKeyToShow2nd = "";      
      hashKeyToRemove = "";

      outputByPlate.removeAllElements();
      stringCounter=0;
      signalCounter=0;
      stringHashKey=0;
      signalHashKey=0;
      
      // unnecessary: t.setText("");
      
      whichReport.setSelectedItem("No Report");	  printReport=false;
      whichFilter.setSelectedItem(" 1 | 1-48");   plateMultiplier=0;
      whatIntensity.setSelectedItem("No Rating"); intensity="none";
    }
    else if (ae.getActionCommand().equals("Save Coordinates"))
    {
      saveClones();				// public void saveClones()
    }
    else if (ae.getActionCommand().equals("Show"))
    {
      // determine hashtable key for this selection
      textStart = t.getSelectionStart();	// capture textarea coordinates so easier to "Remove" later
      textEnd = t.getSelectionEnd();

      stringToShow = t.getSelectedText();	// grab user selection in text area
      if ( stringToShow != null )		// determine key in outputStrings hashtable
      {
        hashKeys = outputStrings.keys();	// use to loop through keys in outputStrings hashtable
        cloneFound=false;
      		
        while ( (hashKeys.hasMoreElements()) && (!cloneFound) )
        {
          currentHashKey = (String)hashKeys.nextElement();
        
          if ( stringToShow.equals((String)outputStrings.get(currentHashKey)) )	// don't need trim()
      	  {
            //convert to hash key in xMatchedSignals hashtable. 
            hashKeyToShow1st = String.valueOf(Integer.valueOf(currentHashKey).intValue()*2); // convert to int, do math, then back to String
            hashKeyToShow2nd = String.valueOf(Integer.valueOf(hashKeyToShow1st).intValue()+1);
            cloneFound=true;
      	  }
        } // end while
 
        if ( cloneFound )			// match found in outputStrings hashtable
        {     
          // highlight coords
          showSelectedClone=true;		// boolean used to paintComponent()
        } 
        else					// no match in outputStrings hashtable found
        {
          showSelectedClone=false;
        } // end if cloneFound
      } // end if stringToShow != null      

    } // end if "Show" button pressed
    else if (ae.getActionCommand().equals("Remove"))
    {
      showSelectedClone=false;			// no need to highlight 

      // remove from hash table outputStrings
      stringToRemove = t.getSelectedText();	// grab user selection in text area

      if ( stringToRemove != null )
      {
        hashKeys = outputStrings.keys();	// to loop through keys in outputStrings hashtable
        cloneFound = false;
              		
        while ( (hashKeys.hasMoreElements()) && (!cloneFound) )
        {
          currentHashKey = (String)hashKeys.nextElement();
        
          if ( stringToRemove.equals((String)outputStrings.get(currentHashKey)) ) // don't need trim()
      	  {
      	    outputStrings.remove(currentHashKey);
      	    hashKeyToRemove = currentHashKey;
      	    cloneFound = true;
      	  }
        } // end while
        
        if ( cloneFound )			// in case user didn't highlight string correctly
        {  
          // remove from vector outputByPlate
          outputByPlate.removeElement(stringToRemove);
      
          // remove from xMatchedSignals, yMatchedSignals (1st clone is outputStrings' hashkey *2, 2nd is *2 +1
          hashKeyToRemove = String.valueOf(Integer.valueOf(hashKeyToRemove).intValue()*2); // convert to int, do math, then back to String
          xMatchedSignals.remove(hashKeyToRemove);		// 1st clone's index is outputString index *2, e.g., 0
          yMatchedSignals.remove(hashKeyToRemove);

          hashKeyToRemove = String.valueOf(Integer.valueOf(hashKeyToRemove).intValue()+1); // convert to int, do math, then back to String
          xMatchedSignals.remove(hashKeyToRemove);
          yMatchedSignals.remove(hashKeyToRemove);

          // decrement signal and string counts (but not signalHashKey/stringHashKey, which do not decrease)
          stringCounter = stringCounter - 1;
          signalCounter = signalCounter - 2;
        } // end if cloneFound
      } // end if stringToRemove != null
    } // end if "Remove"

    repaint();
   }
   catch (Exception e)
   {
     err1=err1+"actionPerformed error: "+e;
     e.printStackTrace();
   }
  } // end actionPerformed()
//*****************************************************************************	
  void calculateXY()
  {
   try
   {
  // need to account for space between squares and fields
  //
  // spotted area of filter = 21.65 cm x 21.60 cm = grid 433w X 432h 
  // where 5 mm is one unit (5 mm x 433 = 2165 mm)
  //
  // spot width 10 mm = 2 out of 433 across or 432 down 
  // 4x4 spot square = 8 out of 433 or 432
  // space between squares 5 mm = 1 out of 433 or 432
  // aisle between fields 10 mm = 2 out of 433 or 432
  
  // e.g., x3=500, y3=500 (dimensions of filter on monitor)
  // 433 div by x3 = multiplier; e.g., 433/500 = .866 (float); 
  // 432/500=.864
  // coordinates of image = 0,0 to 433,432 
  // but need to adjust for user picking reference point just off the filter
  // instead of last spotting row/column (192nd spot in row & column)
  // The adjustment is X3_Y3_ADJUSTER = 192.0/193.0.

// Next two lines moved to mouseClicked because xMultiplier needed for grid-line calculation
/*
     xMultiplier = XSCALE / (X3_Y3_ADJUSTER*x3);  // remove off-filter part; (XSCALE=433)
     yMultiplier = YSCALE / (X3_Y3_ADJUSTER*y3);  // formerly (int)(X3_Y3_ADJUSTER*y3)
     						  // (don't know why used casting earlier)
*/     						
     						  
  // say x1=2,y1=2 and x2=502,y2=502 (filter reference points)
  // say mouseX, mouseY = 3, 502 (coordinate of selected signal)
  // need to subtract out x1 & y1 ==> spotX=1, spotY=500
  
     spotX = mouseX - x1;
     spotY = mouseY - y1;
     
  // multiply by .866 & .864: (spot_433_X, spot_432_Y) = (.866, 432)
  // then round to nearest integer
  
     spot_433_X = (int)((spotX * xMultiplier) + .5);  // e.g., 1 normalized to 1
     spot_432_Y = (int)((spotY * yMultiplier) + .5);  // 500 normalized to 432
     
  // Adjust for spot_433_X & spot_432Y values falling in "aisles":
  // (Unfortunately, can't be reduced into a formula)
  
  // x-coordinates for aisle locations - arbitrarily assign selected points that fall
  // into aisles to the next adjacent valid x-coordinate
  
     inXAisle=true;	// code reducer -- assume selected point in a vertical aisle
     xAisle='E';	// code reducer -- assume selected point east of a valid spot
     
     if      (spot_433_X ==   9) { spot_433_X = 8; }
     else if (spot_433_X ==  18) { spot_433_X = 19; xAisle='W'; }
     else if (spot_433_X ==  27) { spot_433_X = 26; }    
     else if (spot_433_X ==  36) { spot_433_X = 37; xAisle='W'; }    
     else if (spot_433_X ==  45) { spot_433_X = 44; } 
     else if (spot_433_X ==  54) { spot_433_X = 55; xAisle='W'; } 
     else if (spot_433_X ==  63) { spot_433_X = 62; }  
     else if (spot_433_X ==  72) { spot_433_X = 73; xAisle='W'; }                 
     else if (spot_433_X ==  81) { spot_433_X = 80; }                 
     else if (spot_433_X ==  90) { spot_433_X = 91; xAisle='W'; } 
     else if (spot_433_X ==  99) { spot_433_X = 98; }                
     else if (spot_433_X == 108) { spot_433_X = 109; xAisle='W'; }                
     else if (spot_433_X == 117) { spot_433_X = 116; }                
     else if (spot_433_X == 126) { spot_433_X = 127; xAisle='W'; }                
     else if (spot_433_X == 135) { spot_433_X = 134; }  
                   
     // field aisle
     else if (spot_433_X == 144) { spot_433_X = 143; }                
     else if (spot_433_X == 145) { spot_433_X = 146; xAisle='W'; }                
     else if (spot_433_X == 154) { spot_433_X = 153; }                
     else if (spot_433_X == 163) { spot_433_X = 164; xAisle='W'; }                
     else if (spot_433_X == 172) { spot_433_X = 171; }                
     else if (spot_433_X == 181) { spot_433_X = 182; xAisle='W'; }                
     else if (spot_433_X == 190) { spot_433_X = 189; }                
     else if (spot_433_X == 199) { spot_433_X = 200; xAisle='W'; }                
     else if (spot_433_X == 208) { spot_433_X = 207; }                
     else if (spot_433_X == 217) { spot_433_X = 218; xAisle='W'; }                
     else if (spot_433_X == 226) { spot_433_X = 225; }                
     else if (spot_433_X == 235) { spot_433_X = 236; xAisle='W'; }                
     else if (spot_433_X == 244) { spot_433_X = 243; }                
     else if (spot_433_X == 253) { spot_433_X = 254; xAisle='W'; }                
     else if (spot_433_X == 262) { spot_433_X = 261; }                
     else if (spot_433_X == 271) { spot_433_X = 272; xAisle='W'; }                
     else if (spot_433_X == 280) { spot_433_X = 279; }                

     // field aisle
     else if (spot_433_X == 289) { spot_433_X = 288; }                
     else if (spot_433_X == 290) { spot_433_X = 291; xAisle='W'; }                
     else if (spot_433_X == 299) { spot_433_X = 298; }                
     else if (spot_433_X == 308) { spot_433_X = 309; xAisle='W'; }                
     else if (spot_433_X == 317) { spot_433_X = 316; }                
     else if (spot_433_X == 326) { spot_433_X = 327; xAisle='W'; }                
     else if (spot_433_X == 335) { spot_433_X = 334; }                
     else if (spot_433_X == 344) { spot_433_X = 345; xAisle='W'; }                
     else if (spot_433_X == 353) { spot_433_X = 352; }                
     else if (spot_433_X == 362) { spot_433_X = 363; xAisle='W'; }                
     else if (spot_433_X == 371) { spot_433_X = 370; }         
     else if (spot_433_X == 380) { spot_433_X = 381; xAisle='W'; }                
     else if (spot_433_X == 389) { spot_433_X = 388; }                
     else if (spot_433_X == 398) { spot_433_X = 399; xAisle='W'; }                
     else if (spot_433_X == 407) { spot_433_X = 406; }                
     else if (spot_433_X == 416) { spot_433_X = 417; xAisle='W'; }                
     else if (spot_433_X == 425) { spot_433_X = 424; }                
     else    { inXAisle=false; xAisle=' ';  }  // a valid spot on 4x4 clone array
     
     // y-coordinates

     inYAisle=true;	// code reducer -- assume selected point in a horizontal aisle
     yAisle='S';	// code reducer -- assume selected point south of a valid spot
     
     if      (spot_432_Y == 9) { spot_432_Y = 10; yAisle='N'; }
     else if (spot_432_Y == 18) { spot_432_Y = 17; }
     else if (spot_432_Y == 27) { spot_432_Y = 28; yAisle='N'; }    
     else if (spot_432_Y == 36) { spot_432_Y = 35; }
     else if (spot_432_Y == 45) { spot_432_Y = 46; yAisle='N'; }    
     else if (spot_432_Y == 54) { spot_432_Y = 53; }
     else if (spot_432_Y == 63) { spot_432_Y = 64; yAisle='N'; }    
     else if (spot_432_Y == 72) { spot_432_Y = 71; }
     else if (spot_432_Y == 81) { spot_432_Y = 82; yAisle='N'; }    
     else if (spot_432_Y == 90) { spot_432_Y = 89; }
     else if (spot_432_Y == 99) { spot_432_Y = 100; yAisle='N'; }    
     else if (spot_432_Y == 108) { spot_432_Y = 107; }
     else if (spot_432_Y == 117) { spot_432_Y = 118; yAisle='N'; }    
     else if (spot_432_Y == 126) { spot_432_Y = 125; }
     else if (spot_432_Y == 135) { spot_432_Y = 136; yAisle='N'; }    
     else if (spot_432_Y == 144) { spot_432_Y = 143; }
     else if (spot_432_Y == 153) { spot_432_Y = 154; yAisle='N'; }    
     else if (spot_432_Y == 162) { spot_432_Y = 161; }
     else if (spot_432_Y == 171) { spot_432_Y = 172; yAisle='N'; }    
     else if (spot_432_Y == 180) { spot_432_Y = 179; }
     else if (spot_432_Y == 189) { spot_432_Y = 190; yAisle='N'; }    
     else if (spot_432_Y == 198) { spot_432_Y = 197; }
     else if (spot_432_Y == 207) { spot_432_Y = 208; yAisle='N'; }    

     //field aisle
     else if (spot_432_Y == 216) { spot_432_Y = 215; }
     else if (spot_432_Y == 217) { spot_432_Y = 218; yAisle='N'; }    
     else if (spot_432_Y == 226) { spot_432_Y = 225; }
     else if (spot_432_Y == 235) { spot_432_Y = 236; yAisle='N'; }    
     else if (spot_432_Y == 244) { spot_432_Y = 243; }
     else if (spot_432_Y == 253) { spot_432_Y = 254; yAisle='N'; }    
     else if (spot_432_Y == 262) { spot_432_Y = 261; }
     else if (spot_432_Y == 271) { spot_432_Y = 272; yAisle='N'; }    
     else if (spot_432_Y == 280) { spot_432_Y = 279; }
     else if (spot_432_Y == 289) { spot_432_Y = 290; yAisle='N'; }    
     else if (spot_432_Y == 298) { spot_432_Y = 297; }
     else if (spot_432_Y == 307) { spot_432_Y = 308; yAisle='N'; }    
     else if (spot_432_Y == 316) { spot_432_Y = 315; }
     else if (spot_432_Y == 325) { spot_432_Y = 326; yAisle='N'; }    
     else if (spot_432_Y == 334) { spot_432_Y = 333; }
     else if (spot_432_Y == 343) { spot_432_Y = 344; yAisle='N'; }    
     else if (spot_432_Y == 352) { spot_432_Y = 351; }
     else if (spot_432_Y == 361) { spot_432_Y = 362; yAisle='N'; }    
     else if (spot_432_Y == 370) { spot_432_Y = 369; }
     else if (spot_432_Y == 379) { spot_432_Y = 380; yAisle='N'; }    
     else if (spot_432_Y == 388) { spot_432_Y = 387; }
     else if (spot_432_Y == 397) { spot_432_Y = 398; yAisle='N'; }    
     else if (spot_432_Y == 406) { spot_432_Y = 405; }
     else if (spot_432_Y == 415) { spot_432_Y = 416; yAisle='N'; }    
     else if (spot_432_Y == 424) { spot_432_Y = 423; }
     else                        { inYAisle=false; yAisle=' '; }

  // spot_433_X minus _*FIELD_AISLE (space between fields)     3
  // minus ___*SPOT_AISLE (space between 16-spot squares)       3
  // divided by ~2 = spot location on filter w/192x192 spots

     if (spot_433_X > 145)  	// not field 2 or 4, not columns 1-16
     {
        if (spot_433_X > 290)		// field 3 or 5, columns 33-48
        {
           if      (spot_433_X > 425 ) { spot_433_X -= 45*SPOT_AISLE; }
           else if (spot_433_X > 416 ) { spot_433_X -= 44*SPOT_AISLE; }
           else if (spot_433_X > 407 ) { spot_433_X -= 43*SPOT_AISLE; }
           else if (spot_433_X > 398 ) { spot_433_X -= 42*SPOT_AISLE; }
           else if (spot_433_X > 389 ) { spot_433_X -= 41*SPOT_AISLE; }
           else if (spot_433_X > 380 ) { spot_433_X -= 40*SPOT_AISLE; }
           else if (spot_433_X > 371 ) { spot_433_X -= 39*SPOT_AISLE; }
           else if (spot_433_X > 362 ) { spot_433_X -= 38*SPOT_AISLE; }
           else if (spot_433_X > 353 ) { spot_433_X -= 37*SPOT_AISLE; }
           else if (spot_433_X > 344 ) { spot_433_X -= 36*SPOT_AISLE; }
           else if (spot_433_X > 335 ) { spot_433_X -= 35*SPOT_AISLE; }
           else if (spot_433_X > 326 ) { spot_433_X -= 34*SPOT_AISLE; }
           else if (spot_433_X > 317 ) { spot_433_X -= 33*SPOT_AISLE; }
           else if (spot_433_X > 308 ) { spot_433_X -= 32*SPOT_AISLE; }
           else if (spot_433_X > 299 ) { spot_433_X -= 31*SPOT_AISLE; }
           else                        { spot_433_X -= 30*SPOT_AISLE; }
           
           spot_433_X -= 2*FIELD_AISLE;	// field 3 or 5 
        }
        else		// <= 290, field 6 or 1, columns 17-32
        {
           if      (spot_433_X > 280 ) { spot_433_X -= 30*SPOT_AISLE; }
           else if (spot_433_X > 271 ) { spot_433_X -= 29*SPOT_AISLE; }
           else if (spot_433_X > 262 ) { spot_433_X -= 28*SPOT_AISLE; }
           else if (spot_433_X > 253 ) { spot_433_X -= 27*SPOT_AISLE; }
           else if (spot_433_X > 244 ) { spot_433_X -= 26*SPOT_AISLE; }
           else if (spot_433_X > 235 ) { spot_433_X -= 25*SPOT_AISLE; }
           else if (spot_433_X > 226 ) { spot_433_X -= 24*SPOT_AISLE; }
           else if (spot_433_X > 217 ) { spot_433_X -= 23*SPOT_AISLE; }
           else if (spot_433_X > 208 ) { spot_433_X -= 22*SPOT_AISLE; }
           else if (spot_433_X > 199 ) { spot_433_X -= 21*SPOT_AISLE; }
           else if (spot_433_X > 190 ) { spot_433_X -= 20*SPOT_AISLE; }
           else if (spot_433_X > 181 ) { spot_433_X -= 19*SPOT_AISLE; }
           else if (spot_433_X > 172 ) { spot_433_X -= 18*SPOT_AISLE; }
           else if (spot_433_X > 163 ) { spot_433_X -= 17*SPOT_AISLE; }
           else if (spot_433_X > 154 ) { spot_433_X -= 16*SPOT_AISLE; }
           else  		       { spot_433_X -= 15*SPOT_AISLE; }

           spot_433_X -= FIELD_AISLE;	// field 6 or 1
        } // end if spot433x > 290
     }
     else		// <= 145, field 2 or 4, columns 1-16
     {
        if (spot_433_X > 9)	// adjust columns 2 to 16 for aisles
        {
           if      (spot_433_X > 135 ) { spot_433_X -= 15*SPOT_AISLE; }
           else if (spot_433_X > 126 ) { spot_433_X -= 14*SPOT_AISLE; }
           else if (spot_433_X > 117 ) { spot_433_X -= 13*SPOT_AISLE; }
           else if (spot_433_X > 108 ) { spot_433_X -= 12*SPOT_AISLE; }
           else if (spot_433_X >  99 ) { spot_433_X -= 11*SPOT_AISLE; }
           else if (spot_433_X >  90 ) { spot_433_X -= 10*SPOT_AISLE; }
           else if (spot_433_X >  81 ) { spot_433_X -= 9*SPOT_AISLE; }
           else if (spot_433_X >  72 ) { spot_433_X -= 8*SPOT_AISLE; }
           else if (spot_433_X >  63 ) { spot_433_X -= 7*SPOT_AISLE; }
           else if (spot_433_X >  54 ) { spot_433_X -= 6*SPOT_AISLE; }
           else if (spot_433_X >  45 ) { spot_433_X -= 5*SPOT_AISLE; }
           else if (spot_433_X >  36 ) { spot_433_X -= 4*SPOT_AISLE; }
           else if (spot_433_X >  27 ) { spot_433_X -= 3*SPOT_AISLE; }
           else if (spot_433_X >  18 ) { spot_433_X -= 2*SPOT_AISLE; }
           else                        { spot_433_X -= SPOT_AISLE; }
        } // end if spot433x > 9
     } // end if spot433x > 145

     realSpotX = (spot_433_X - 1)/2 + 1;  // spot on 192x192 grid // 1

  // spot_432_Y minus FIELD_AISLE minus __*SPOT_AISLE 
  // divided by ~2 = spot on 192x192 grid
  
     if (spot_432_Y > 217 )		// field 4, 1, or 5, rows 25-48
     {
     	if      (spot_432_Y > 424 ) { spot_432_Y -= 46*SPOT_AISLE; }		// 1164
        else if (spot_432_Y > 415 ) { spot_432_Y -= 45*SPOT_AISLE; }
        else if (spot_432_Y > 406 ) { spot_432_Y -= 44*SPOT_AISLE; }
        else if (spot_432_Y > 397 ) { spot_432_Y -= 43*SPOT_AISLE; }
        else if (spot_432_Y > 388 ) { spot_432_Y -= 42*SPOT_AISLE; }
        else if (spot_432_Y > 379 ) { spot_432_Y -= 41*SPOT_AISLE; }     
        else if (spot_432_Y > 370 ) { spot_432_Y -= 40*SPOT_AISLE; }
        else if (spot_432_Y > 361 ) { spot_432_Y -= 39*SPOT_AISLE; }
        else if (spot_432_Y > 352 ) { spot_432_Y -= 38*SPOT_AISLE; }
        else if (spot_432_Y > 343 ) { spot_432_Y -= 37*SPOT_AISLE; }
        else if (spot_432_Y > 334 ) { spot_432_Y -= 36*SPOT_AISLE; }
        else if (spot_432_Y > 325 ) { spot_432_Y -= 35*SPOT_AISLE; }
        else if (spot_432_Y > 316 ) { spot_432_Y -= 34*SPOT_AISLE; }
        else if (spot_432_Y > 307 ) { spot_432_Y -= 33*SPOT_AISLE; }
        else if (spot_432_Y > 298 ) { spot_432_Y -= 32*SPOT_AISLE; }
        else if (spot_432_Y > 289 ) { spot_432_Y -= 31*SPOT_AISLE; }
        else if (spot_432_Y > 280 ) { spot_432_Y -= 30*SPOT_AISLE; }
	else if (spot_432_Y > 271 ) { spot_432_Y -= 29*SPOT_AISLE; }
        else if (spot_432_Y > 262 ) { spot_432_Y -= 28*SPOT_AISLE; }        
	else if (spot_432_Y > 253 ) { spot_432_Y -= 27*SPOT_AISLE; }
        else if (spot_432_Y > 244 ) { spot_432_Y -= 26*SPOT_AISLE; }        
        else if (spot_432_Y > 235 ) { spot_432_Y -= 25*SPOT_AISLE; }        
        else if (spot_432_Y > 226 ) { spot_432_Y -= 24*SPOT_AISLE; } 
        else                        { spot_432_Y -= 23*SPOT_AISLE; }               
        
	spot_432_Y -= FIELD_AISLE;						// 1152
     }	
     else				// field 2, 6, or 3, rows 1-24
     {
       if (spot_432_Y > 9)		// adjust rows 2-24 for aisles
       {  
         if      (spot_432_Y > 207 ) { spot_432_Y -= 23*SPOT_AISLE; }
         else if (spot_432_Y > 198 ) { spot_432_Y -= 22*SPOT_AISLE; }
         else if (spot_432_Y > 189 ) { spot_432_Y -= 21*SPOT_AISLE; }
         else if (spot_432_Y > 180 ) { spot_432_Y -= 20*SPOT_AISLE; }
         else if (spot_432_Y > 171 ) { spot_432_Y -= 19*SPOT_AISLE; }
         else if (spot_432_Y > 162 ) { spot_432_Y -= 18*SPOT_AISLE; }
         else if (spot_432_Y > 153 ) { spot_432_Y -= 17*SPOT_AISLE; }
         else if (spot_432_Y > 144 ) { spot_432_Y -= 16*SPOT_AISLE; }
         else if (spot_432_Y > 135 ) { spot_432_Y -= 15*SPOT_AISLE; }
	 else if (spot_432_Y > 126 ) { spot_432_Y -= 14*SPOT_AISLE; }
	 else if (spot_432_Y > 117 ) { spot_432_Y -= 13*SPOT_AISLE; }
	 else if (spot_432_Y > 108 ) { spot_432_Y -= 12*SPOT_AISLE; }
	 else if (spot_432_Y >  99 ) { spot_432_Y -= 11*SPOT_AISLE; }
	 else if (spot_432_Y >  90 ) { spot_432_Y -= 10*SPOT_AISLE; }
	 else if (spot_432_Y >  81 ) { spot_432_Y -= 9*SPOT_AISLE; }
	 else if (spot_432_Y >  72 ) { spot_432_Y -= 8*SPOT_AISLE; }
	 else if (spot_432_Y >  63 ) { spot_432_Y -= 7*SPOT_AISLE; }
	 else if (spot_432_Y >  54 ) { spot_432_Y -= 6*SPOT_AISLE; }
	 else if (spot_432_Y >  45 ) { spot_432_Y -= 5*SPOT_AISLE; }
	 else if (spot_432_Y >  36 ) { spot_432_Y -= 4*SPOT_AISLE; }
	 else if (spot_432_Y >  27 ) { spot_432_Y -= 3*SPOT_AISLE; }
	 else if (spot_432_Y >  18 ) { spot_432_Y -= 2*SPOT_AISLE; }
	 else         	             { spot_432_Y -= SPOT_AISLE; }
       } // end if spot432y > 9
     } // end if spot432y > 217
  
     realSpotY = (spot_432_Y - 1)/2 + 1; // spot on 192x192 grid 
   }
   catch (Exception e)
   {
     err1=err1+"calculateXY error: "+e;
     e.printStackTrace();
   }
  } // end calculateXY
//*****************************************************************************	
  void calculatePlate()	// after x-y on 192x192 grid derived from calculateXY() 
  {
   try
   {
    // FIELD					SAMPLE x,y=164,93
    // x 1-64    and y 1-96 field 2
    // x 1-64    and y >96  field 4

    if (realSpotX < 65)				// x=1
    {
      //      if (realSpotY < 97) { fieldNum = 2; }		
      //      else                { fieldNum = 4; }	// y=192 therefore field 4
      if (realSpotY < 97) { fieldNum = UPPER_LEFT; }		
      else                { fieldNum = LOWER_LEFT; }	// y=192 therefore field 4

    }

    // x 65-128  and y 1-96 field 6
    // x 65-128  and y > 96 field 1
  
    else if (realSpotX < 129)
    {
      //      if (realSpotY < 97) { fieldNum = 6; }
      //      else                { fieldNum = 1; }
      if (realSpotY < 97) { fieldNum = UPPER_CENTER; }
      else                { fieldNum = LOWER_CENTER; }

    }
  
    // x 129-192 and y 1-96 field 3			
    // x 129-192 and y >96  field 5
  
    else
    {
      //      if (realSpotY < 97) { fieldNum = 3; }
      //      else                { fieldNum = 5; }
      if (realSpotY < 97) { fieldNum = UPPER_RIGHT; }
      else                { fieldNum = LOWER_RIGHT; }

    }
  
    // COLUMN LOCATION ON PLATE
    // if field 3/5, subtract 128 from filter column
    // if field 6/1, subtract 64 
    // minus 1, divided by 4 is field column; if = 0, then column P     
    // minus 1, divided by 4 = 1, then column O
    // minus 1, divided by 4 = 2, then column N...
    // minus 1, divided by 4 = 15, then column A
  
    //    if ( (fieldNum == 3) || (fieldNum == 5) )
    if ( (fieldNum == UPPER_RIGHT) || (fieldNum == LOWER_RIGHT) )
    {
      colNum = (realSpotX - 129) / 4;
    }
    //    else if ( (fieldNum == 6) || (fieldNum ==  1) )
    else if ( (fieldNum == UPPER_CENTER) || (fieldNum ==  LOWER_CENTER) )
    {
      colNum = (realSpotX - 65) / 4;
    }
    else
    {
      colNum = (realSpotX - 1) / 4;		
    }
     
    if      (colNum == 0) { column = 'P'; }	// col=P for 1,192 
    else if (colNum == 1) { column = 'O'; }
    else if (colNum == 2) { column = 'N'; }
    else if (colNum == 3) { column = 'M'; }
    else if (colNum == 4) { column = 'L'; }
    else if (colNum == 5) { column = 'K'; }
    else if (colNum == 6) { column = 'J'; }
    else if (colNum == 7) { column = 'I'; }
    else if (colNum == 8) { column = 'H'; }
    else if (colNum == 9) { column = 'G'; }
    else if (colNum == 10) { column = 'F'; }
    else if (colNum == 11) { column = 'E'; }
    else if (colNum == 12) { column = 'D'; }
    else if (colNum == 13) { column = 'C'; }
    else if (colNum == 14) { column = 'B'; }
    else                   { column = 'A'; }
  
    // ROW LOCATION ON PLATE
    // if field 4, 1, or 5, subtract 96 from filter row
    // minus 1, divided by 4 is field row; if = 0, then row 1...     
    // minus 1, divided by 4 = 23, then row 24
    // e.g., y values of 93-96 & 189-192 from well in row 24 on plate

    //    if ( (fieldNum == 4) || (fieldNum == 5) || (fieldNum == 1) )
    if ( (fieldNum == LOWER_LEFT) || 
         (fieldNum == LOWER_RIGHT) || 
         (fieldNum == LOWER_CENTER) )
    {
      rowNum = 1 + ((realSpotY - 97)/4);		// rowNum=1+(95/4)=24
    }
    else						// field 2, 6, or 3
    {
      rowNum = 1 + ((realSpotY - 1)/4);
    }
  
    // WHICH OF PLATES 1 - 48?
    // 
    // x mod 4 = 1 & y mod 4 =1, then pos 1	 
    // x mod 4 = 1 & y mod 4 =2, then pos 4	
    // x mod 4 = 1 & y mod 4 =3, then pos 3
    // x mod 4 = 1 & y mod 4 =0, then pos 5
    // x mod 4 = 2 & y mod 4 =1, then pos 2...
    // x mod 4 = 3 & y mod 4 =2, then pos 4...
    // x mod 4 = 0 & y mod 4 =3, then pos 7...
    // x mod 4 = 0 & y mod 4 =0, then pos 8
  
    if (realSpotX % 4 == 1)		// first column in 4x4 clone array
    {
    	if      (realSpotY % 4 == 1) { position = 1; p2RealSpotX=realSpotX+2; p2RealSpotY=realSpotY+2; }
    	else if (realSpotY % 4 == 2) { position = 4; p2RealSpotX=realSpotX+2; p2RealSpotY=realSpotY; }
    	else if (realSpotY % 4 == 3) { position = 3; p2RealSpotX=realSpotX+2; p2RealSpotY=realSpotY-2; }
    	else			     { position = 5; p2RealSpotX=realSpotX+1; p2RealSpotY=realSpotY-2; }	// 192%4=0 so 5
    }
    else if (realSpotX % 4 == 2)	// second column in 4x4 array
    {
      	if      (realSpotY % 4 == 1) { position = 2; p2RealSpotX=realSpotX; p2RealSpotY=realSpotY+2; }
      	else if (realSpotY % 4 == 2) { position = 5; p2RealSpotX=realSpotX-1; p2RealSpotY=realSpotY+2; }
    	else if (realSpotY % 4 == 3) { position = 2; p2RealSpotX=realSpotX; p2RealSpotY=realSpotY-2; }
    	else			     { position = 6; p2RealSpotX=realSpotX+2; p2RealSpotY=realSpotY-3; }
    }
    else if (realSpotX % 4 == 3)	// third column in 4x4 array
    {
    	if      (realSpotY % 4 == 1) { position = 3; p2RealSpotX=realSpotX-2; p2RealSpotY=realSpotY+2; }
    	else if (realSpotY % 4 == 2) { position = 4; p2RealSpotX=realSpotX-2; p2RealSpotY=realSpotY; }
    	else if (realSpotY % 4 == 3) { position = 1; p2RealSpotX=realSpotX-2; p2RealSpotY=realSpotY-2; }
    	else			     { position = 8; p2RealSpotX=realSpotX+1; p2RealSpotY=realSpotY; }
    }
    else	// realSpotX % 4 == 0, the fourth column in 4x4 array
    {
    	if      (realSpotY % 4 == 1) { position = 6; p2RealSpotX=realSpotX-2; p2RealSpotY=realSpotY+3; }
    	else if (realSpotY % 4 == 2) { position = 7; p2RealSpotX=realSpotX; p2RealSpotY=realSpotY+1; }
    	else if (realSpotY % 4 == 3) { position = 7; p2RealSpotX=realSpotX; p2RealSpotY=realSpotY-1; }
    	else			     { position = 8; p2RealSpotX=realSpotX-1; p2RealSpotY=realSpotY; }
    }
    
    // GET PLATE NUMBER using field & position
    // if field 2 pos 1, then plate 2
    // if field 2 pos 2, then plate 8...		
    // if field 2 pos 8, then plate 44
    // if field 6 pos 1, then plate 6
                                     
    plateNum = ( plateMultiplier * 48 ) + (( position - 1 ) * 6 + fieldNum );
                                                  // plateNum=(5-1)*6+4=28
   }
   catch (Exception e)
   {
     err1=err1+"calculatePlate error: "+e;
     e.printStackTrace();
   }
  } // end calculatePlate()
//*****************************************************************************	
  public void reposition()		// if user chooses another position
  {					// 	able to recalculate x,y, given
  					// 	field, row, column, & position
   try
   {
    // once user has used 4x4 grid properly to reposition, safe to assume choice no longer in an aisle!
    inXAisle = false;	
    xAisle = ' ';
    inYAisle = false;
    yAisle = ' ';

    if ( newPosition.equals("1a") )
    {
      position = 1;
      
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 1 + ( 4 * colNum );
        realSpotY = 1 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 65 + ( 4 * colNum );
        realSpotY = 1 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 129 + ( 4 * colNum );
        realSpotY = 1 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 1 + ( 4 * colNum );
        realSpotY = 97 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 65 + ( 4 * colNum );
        realSpotY = 97 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 129 + ( 4 * colNum );
        realSpotY = 97 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX+2; 
      p2RealSpotY=realSpotY+2;
      
    }  // end if 1a
    else if ( newPosition.equals("1b") )	// the other clone 1
    {
      position = 1;
    
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 3 + ( 4 * colNum );
        realSpotY = 3 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 67 + ( 4 * colNum );
        realSpotY = 3 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 131 + ( 4 * colNum );
        realSpotY = 3 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 3 + ( 4 * colNum );
        realSpotY = 99 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 67 + ( 4 * colNum );
        realSpotY = 99 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 131 + ( 4 * colNum );
        realSpotY = 99 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX-2; 
      p2RealSpotY=realSpotY-2;
      
    } // end newPosition 1
    
    else if ( newPosition.equals("2a") )
    {
      position = 2;
    
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 2 + ( 4 * colNum );
        realSpotY = 1 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 66 + ( 4 * colNum );
        realSpotY = 1 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 130 + ( 4 * colNum );
        realSpotY = 1 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 2 + ( 4 * colNum );
        realSpotY = 97 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 66 + ( 4 * colNum );
        realSpotY = 97 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 130 + ( 4 * colNum );
        realSpotY = 97 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX; 
      p2RealSpotY=realSpotY+2;
      
    } // end if 2a
    else if ( newPosition.equals("2b") )
    {
      position = 2;
    
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 2 + ( 4 * colNum );
        realSpotY = 3 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 66 + ( 4 * colNum );
        realSpotY = 3 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 130 + ( 4 * colNum );
        realSpotY = 3 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 2 + ( 4 * colNum );
        realSpotY = 99 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 66 + ( 4 * colNum );
        realSpotY = 99 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 130 + ( 4 * colNum );
        realSpotY = 99 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX; 
      p2RealSpotY=realSpotY-2;
      
    } // newPosition 2
    
    else if ( newPosition.equals("3a") )
    {
      position = 3;
      
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 3 + ( 4 * colNum );
        realSpotY = 1 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 67 + ( 4 * colNum );
        realSpotY = 1 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 131 + ( 4 * colNum );
        realSpotY = 1 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 3 + ( 4 * colNum );
        realSpotY = 97 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 67 + ( 4 * colNum );
        realSpotY = 97 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 131 + ( 4 * colNum );
        realSpotY = 97 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX-2; 
      p2RealSpotY=realSpotY+2;
      
    } // end if 3a
    else if ( newPosition.equals("3b") )
    {
      position = 3;
      
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 1 + ( 4 * colNum );
        realSpotY = 3 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 65 + ( 4 * colNum );
        realSpotY = 3 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 129 + ( 4 * colNum );
        realSpotY = 3 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 1 + ( 4 * colNum );
        realSpotY = 99 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 65 + ( 4 * colNum );
        realSpotY = 99 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 129 + ( 4 * colNum );
        realSpotY = 99 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX+2; 
      p2RealSpotY=realSpotY-2;
      
    } // newPosition 3
    
    else if ( newPosition.equals("4a") )
    {
      position = 4;
      
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 1 + ( 4 * colNum );
        realSpotY = 2 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 65 + ( 4 * colNum );
        realSpotY = 2 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 129 + ( 4 * colNum );
        realSpotY = 2 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 1 + ( 4 * colNum );
        realSpotY = 98 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 65 + ( 4 * colNum );
        realSpotY = 98 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 129 + ( 4 * colNum );
        realSpotY = 98 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX+2; 
      p2RealSpotY=realSpotY;
      
    } // end if 4a
    else if ( newPosition.equals("4b") )
    {
      position = 4;
      
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 3 + ( 4 * colNum );
        realSpotY = 2 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 67 + ( 4 * colNum );
        realSpotY = 2 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 131 + ( 4 * colNum );
        realSpotY = 2 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 3 + ( 4 * colNum );
        realSpotY = 98 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 67 + ( 4 * colNum );
        realSpotY = 98 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 131 + ( 4 * colNum );
        realSpotY = 98 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX-2; 
      p2RealSpotY=realSpotY;
          
    } // newPosition 4
    
    else if ( newPosition.equals("5a") )
    {
      position = 5;
      
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 2 + ( 4 * colNum );
        realSpotY = 2 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 66 + ( 4 * colNum );
        realSpotY = 2 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 130 + ( 4 * colNum );
        realSpotY = 2 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 2 + ( 4 * colNum );
        realSpotY = 98 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 66 + ( 4 * colNum );
        realSpotY = 98 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 130 + ( 4 * colNum );
        realSpotY = 98 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX-1; 
      p2RealSpotY=realSpotY+2;
      
    } // end if 5a
    else if ( newPosition.equals("5b") )
    {
      position = 5;
      
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 1 + ( 4 * colNum );
        realSpotY = 4 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 65 + ( 4 * colNum );
        realSpotY = 4 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 129 + ( 4 * colNum );
        realSpotY = 4 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 1 + ( 4 * colNum );
        realSpotY = 100 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 65 + ( 4 * colNum );
        realSpotY = 100 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 129 + ( 4 * colNum );
        realSpotY = 100 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX+1; 
      p2RealSpotY=realSpotY-2;
      
    } // newPosition 5
    
    else if ( newPosition.equals("6a") )
    {
      position = 6;
      
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 4 + ( 4 * colNum );
        realSpotY = 1 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 68 + ( 4 * colNum );
        realSpotY = 1 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 132 + ( 4 * colNum );
        realSpotY = 1 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 4 + ( 4 * colNum );
        realSpotY = 97 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 68 + ( 4 * colNum );
        realSpotY = 97 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 132 + ( 4 * colNum );
        realSpotY = 97 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX-2; 
      p2RealSpotY=realSpotY+3;
      
    } // end if 6a
    else if ( newPosition.equals("6b") )
    {
      position = 6;
      
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 2 + ( 4 * colNum );
        realSpotY = 4 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 66 + ( 4 * colNum );
        realSpotY = 4 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 130 + ( 4 * colNum );
        realSpotY = 4 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 2 + ( 4 * colNum );
        realSpotY = 100 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 66 + ( 4 * colNum );
        realSpotY = 100 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 130 + ( 4 * colNum );
        realSpotY = 100 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX+2; 
      p2RealSpotY=realSpotY-3;
      
    } // newPosition 6
    
    else if ( newPosition.equals("7a") )
    {
      position = 7;
      
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 4 + ( 4 * colNum );
        realSpotY = 2 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 68 + ( 4 * colNum );
        realSpotY = 2 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 132 + ( 4 * colNum );
        realSpotY = 2 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 4 + ( 4 * colNum );
        realSpotY = 98 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 68 + ( 4 * colNum );
        realSpotY = 98 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 132 + ( 4 * colNum );
        realSpotY = 98 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX; 
      p2RealSpotY=realSpotY+1;
      
    } // end if 7a
    else if ( newPosition.equals("7b") )
    {
      position = 7;
      
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 4 + ( 4 * colNum );
        realSpotY = 3 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 68 + ( 4 * colNum );
        realSpotY = 3 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 132 + ( 4 * colNum );
        realSpotY = 3 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 4 + ( 4 * colNum );
        realSpotY = 99 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 68 + ( 4 * colNum );
        realSpotY = 99 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 132 + ( 4 * colNum );
        realSpotY = 99 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX; 
      p2RealSpotY=realSpotY-1;
      
    } // newPosition 7
    
    else if ( newPosition.equals("8a") )
    {
      position = 8;
      
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 3 + ( 4 * colNum );
        realSpotY = 4 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 67 + ( 4 * colNum );
        realSpotY = 4 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 131 + ( 4 * colNum );
        realSpotY = 4 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 3 + ( 4 * colNum );
        realSpotY = 100 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 67 + ( 4 * colNum );
        realSpotY = 100 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 131 + ( 4 * colNum );
        realSpotY = 100 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX+1; 
      p2RealSpotY=realSpotY;
      
    } // end if 8a
    else if ( newPosition.equals("8b") )
    {
      position = 8;
      
      if ( fieldNum == UPPER_LEFT ) 
      {
        realSpotX = 4 + ( 4 * colNum );
        realSpotY = 4 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_CENTER )
      {
        realSpotX = 68 + ( 4 * colNum );
        realSpotY = 4 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == UPPER_RIGHT )
      {
        realSpotX = 132 + ( 4 * colNum );
        realSpotY = 4 + ( 4 * ( rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_LEFT )
      {
        realSpotX = 4 + ( 4 * colNum );
        realSpotY = 100 + ( 4 * (rowNum - 1 ) );
      }
      else if ( fieldNum == LOWER_CENTER )
      {
        realSpotX = 68 + ( 4 * colNum );
        realSpotY = 100 + ( 4 * (rowNum - 1 ) );
      }
      else // ( fieldNum == LOWER_RIGHT )
      {      
        realSpotX = 132 + ( 4 * colNum );
        realSpotY = 100 + ( 4 * (rowNum - 1 ) );
      }
      
      p2RealSpotX=realSpotX-1; 
      p2RealSpotY=realSpotY;
      
    } // newPosition 8
    else {} // do nothing if newPosition not valid value
    
    // realSpotX/Y:  192x192 grid
    // Now, we need to backtrack to figure out what the screen x,y coords would be
    
    mouseX=getXCoord(realSpotX);	// screen coordinates for selected clone
    mouseY=getYCoord(realSpotY);
    
    p2MouseX=getXCoord(p2RealSpotX);	// screen coordinates for clone's twin
    p2MouseY=getYCoord(p2RealSpotY);

    // Finally, calculate the plate number
    
    plateNum = ( plateMultiplier * 48 ) + (( position - 1 ) * 6 + fieldNum );
// added 6/20/2003 so that report shows repositioned plate # (Mike the intern found this bug!)
          // convert to strings and add leading zeros as appropriate
          // plate numbers        
               if (plateNum < 10)   { plateString = "000"+String.valueOf(plateNum); } 
          else if (plateNum < 100)  { plateString = "00"+String.valueOf(plateNum); }
          else if (plateNum < 1000) { plateString = "0"+String.valueOf(plateNum); }
          else                      { plateString = String.valueOf(plateNum); }     

    repaint();  // to repaint grid panel AND filter image
          
   }
   catch (Exception e)
   {
     err1=err1+"reposition error: "+e;
     e.printStackTrace();
   }
  }  // end reposition()
//*****************************************************************************	
  public int getXCoord(int x)
  {
    // convert x on 192x192 to x on 433x432 grid
    
    if ( ( fieldNum == UPPER_RIGHT ) || 
         ( fieldNum == LOWER_RIGHT ) )
    {
      if ( x > 188 )     { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (45 * SPOT_AISLE); }
      else if ( x > 184) { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (44 * SPOT_AISLE); }
      else if ( x > 180) { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (43 * SPOT_AISLE); }
      else if ( x > 176) { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (42 * SPOT_AISLE); }
      else if ( x > 172) { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (41 * SPOT_AISLE); }
      else if ( x > 168) { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (40 * SPOT_AISLE); }
      else if ( x > 164) { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (39 * SPOT_AISLE); }
      else if ( x > 160) { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (38 * SPOT_AISLE); }
      else if ( x > 156) { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (37 * SPOT_AISLE); }
      else if ( x > 152) { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (36 * SPOT_AISLE); }
      else if ( x > 148) { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (35 * SPOT_AISLE); }
      else if ( x > 144) { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (34 * SPOT_AISLE); }
      else if ( x > 140) { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (33 * SPOT_AISLE); }
      else if ( x > 136) { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (32 * SPOT_AISLE); }
      else if ( x > 132) { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (31 * SPOT_AISLE); }
      else // if ( x > 128) 
      { spot_433_X = (2*x-1) + (2*FIELD_AISLE) + (30 * SPOT_AISLE); }
    }
    else if ( ( fieldNum == UPPER_CENTER ) || 
              ( fieldNum == LOWER_CENTER ) )
    {
      if ( x > 124)      { spot_433_X = (2*x-1) + FIELD_AISLE + (30 * SPOT_AISLE); }
      else if ( x > 120) { spot_433_X = (2*x-1) + FIELD_AISLE + (29 * SPOT_AISLE); }
      else if ( x > 116) { spot_433_X = (2*x-1) + FIELD_AISLE + (28 * SPOT_AISLE); }
      else if ( x > 112) { spot_433_X = (2*x-1) + FIELD_AISLE + (27 * SPOT_AISLE); }
      else if ( x > 108) { spot_433_X = (2*x-1) + FIELD_AISLE + (26 * SPOT_AISLE); }
      else if ( x > 104) { spot_433_X = (2*x-1) + FIELD_AISLE + (25 * SPOT_AISLE); }
      else if ( x > 100) { spot_433_X = (2*x-1) + FIELD_AISLE + (24 * SPOT_AISLE); }
      else if ( x > 96)  { spot_433_X = (2*x-1) + FIELD_AISLE + (23 * SPOT_AISLE); }
      else if ( x > 92)  { spot_433_X = (2*x-1) + FIELD_AISLE + (22 * SPOT_AISLE); }
      else if ( x > 88)  { spot_433_X = (2*x-1) + FIELD_AISLE + (21 * SPOT_AISLE); }
      else if ( x > 84)  { spot_433_X = (2*x-1) + FIELD_AISLE + (20 * SPOT_AISLE); }
      else if ( x > 80)  { spot_433_X = (2*x-1) + FIELD_AISLE + (19 * SPOT_AISLE); }
      else if ( x > 76)  { spot_433_X = (2*x-1) + FIELD_AISLE + (18 * SPOT_AISLE); }
      else if ( x > 72)  { spot_433_X = (2*x-1) + FIELD_AISLE + (17 * SPOT_AISLE); }
      else if ( x > 68)  { spot_433_X = (2*x-1) + FIELD_AISLE + (16 * SPOT_AISLE); }
      else // if ( x > 64) 
      { spot_433_X = (2*x-1) + FIELD_AISLE + (15 * SPOT_AISLE); }
    }
    else  // left two fields
    {
      if ( x > 60)      { spot_433_X = (2*x-1) + (15 * SPOT_AISLE); }
      else if ( x > 56) { spot_433_X = (2*x-1) + (14 * SPOT_AISLE); }
      else if ( x > 52) { spot_433_X = (2*x-1) + (13 * SPOT_AISLE); }
      else if ( x > 48) { spot_433_X = (2*x-1) + (12 * SPOT_AISLE); }
      else if ( x > 44) { spot_433_X = (2*x-1) + (11 * SPOT_AISLE); }
      else if ( x > 40) { spot_433_X = (2*x-1) + (10 * SPOT_AISLE); }
      else if ( x > 36) { spot_433_X = (2*x-1) + (9 * SPOT_AISLE); }
      else if ( x > 32) { spot_433_X = (2*x-1) + (8 * SPOT_AISLE); }
      else if ( x > 28) { spot_433_X = (2*x-1) + (7 * SPOT_AISLE); }
      else if ( x > 24) { spot_433_X = (2*x-1) + (6 * SPOT_AISLE); }
      else if ( x > 20) { spot_433_X = (2*x-1) + (5 * SPOT_AISLE); }
      else if ( x > 16) { spot_433_X = (2*x-1) + (4 * SPOT_AISLE); }
      else if ( x > 12) { spot_433_X = (2*x-1) + (3 * SPOT_AISLE); }
      else if ( x > 8)  { spot_433_X = (2*x-1) + (2 * SPOT_AISLE); }
      else if ( x > 4)  { spot_433_X = (2*x-1) + SPOT_AISLE; }
      else // first column on filter
      { spot_433_X = 2*x-1; } // off by -1 unit on occasion
    }

    // Now, reposition x (mouseX & p2MouseX needed to paint cyan spots on image)    

    spotX = (int)((spot_433_X/xMultiplier) + 0.5); // off by +1/-1 unit on occasion
    return (spotX + x1);	// return value of (new mouseX) or (p2MouseX)

  } // end getXCoord()
//*****************************************************************************	
  public int getYCoord(int y)
  {
    // convert y on 192x192 to y on 433x432 grid

    if ( ( fieldNum == LOWER_LEFT ) ||
         ( fieldNum == LOWER_CENTER ) ||
         ( fieldNum == LOWER_RIGHT ) )
    {				// add back pixels for field/spot aisles
      if ( y > 188 )      { spot_432_Y = (2*y-1) + FIELD_AISLE + (46 * SPOT_AISLE); }
      else if ( y > 184 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (45 * SPOT_AISLE); }
      else if ( y > 180 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (44 * SPOT_AISLE); }
      else if ( y > 176 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (43 * SPOT_AISLE); }
      else if ( y > 172 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (42 * SPOT_AISLE); }
      else if ( y > 168 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (41 * SPOT_AISLE); }
      else if ( y > 164 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (40 * SPOT_AISLE); }
      else if ( y > 160 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (39 * SPOT_AISLE); }
      else if ( y > 156 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (38 * SPOT_AISLE); }
      else if ( y > 152 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (37 * SPOT_AISLE); }
      else if ( y > 148 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (36 * SPOT_AISLE); }
      else if ( y > 144 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (35 * SPOT_AISLE); }
      else if ( y > 140 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (34 * SPOT_AISLE); }
      else if ( y > 136 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (33 * SPOT_AISLE); }
      else if ( y > 132 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (32 * SPOT_AISLE); }
      else if ( y > 128 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (31 * SPOT_AISLE); }
      else if ( y > 124 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (30 * SPOT_AISLE); }
      else if ( y > 120 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (29 * SPOT_AISLE); }
      else if ( y > 116 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (28 * SPOT_AISLE); }
      else if ( y > 112 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (27 * SPOT_AISLE); }
      else if ( y > 108 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (26 * SPOT_AISLE); }
      else if ( y > 104 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (25 * SPOT_AISLE); }
      else if ( y > 100 ) { spot_432_Y = (2*y-1) + FIELD_AISLE + (24 * SPOT_AISLE); }

      else // if ( y > 96 ) [the first row in lower three fields]
      { spot_432_Y = (2*y-1) + FIELD_AISLE + (23 * SPOT_AISLE); }
    }
    else // upper three fields have no field aisle
    {
      if ( y > 92 )  { spot_432_Y = (2*y-1) + (23 * SPOT_AISLE); }
      else if ( y > 88 ) { spot_432_Y = (2*y-1) + (22 * SPOT_AISLE); }
      else if ( y > 84 ) { spot_432_Y = (2*y-1) + (21 * SPOT_AISLE); }
      else if ( y > 80 ) { spot_432_Y = (2*y-1) + (20 * SPOT_AISLE); }
      else if ( y > 76 ) { spot_432_Y = (2*y-1) + (19 * SPOT_AISLE); }
      else if ( y > 72 ) { spot_432_Y = (2*y-1) + (18 * SPOT_AISLE); }
      else if ( y > 68 ) { spot_432_Y = (2*y-1) + (17 * SPOT_AISLE); }
      else if ( y > 64 ) { spot_432_Y = (2*y-1) + (16 * SPOT_AISLE); }
      else if ( y > 60 ) { spot_432_Y = (2*y-1) + (15 * SPOT_AISLE); }
      else if ( y > 56 ) { spot_432_Y = (2*y-1) + (14 * SPOT_AISLE); }
      else if ( y > 52 ) { spot_432_Y = (2*y-1) + (13 * SPOT_AISLE); }
      else if ( y > 48 ) { spot_432_Y = (2*y-1) + (12 * SPOT_AISLE); }
      else if ( y > 44 ) { spot_432_Y = (2*y-1) + (11 * SPOT_AISLE); }
      else if ( y > 40 ) { spot_432_Y = (2*y-1) + (10 * SPOT_AISLE); }
      else if ( y > 36 ) { spot_432_Y = (2*y-1) + (9 * SPOT_AISLE); }
      else if ( y > 32 ) { spot_432_Y = (2*y-1) + (8 * SPOT_AISLE); }
      else if ( y > 28 ) { spot_432_Y = (2*y-1) + (7 * SPOT_AISLE); }
      else if ( y > 24 ) { spot_432_Y = (2*y-1) + (6 * SPOT_AISLE); }
      else if ( y > 20 ) { spot_432_Y = (2*y-1) + (5 * SPOT_AISLE); }
      else if ( y > 16 ) { spot_432_Y = (2*y-1) + (4 * SPOT_AISLE); }
      else if ( y > 12 ) { spot_432_Y = (2*y-1) + (3 * SPOT_AISLE); }
      else if ( y > 8  ) { spot_432_Y = (2*y-1) + (2 * SPOT_AISLE); }
      else if ( y > 4  ) { spot_432_Y = (2*y-1) + SPOT_AISLE; }
      else { spot_432_Y = 2*y-1; } // no aisles [first row on filter]
    }						// off by -1 unit on occasion

    // Now, reposition y (mouseY and p2MouseY needed to paint cyan spots on image)    

    spotY = (int)((spot_432_Y/yMultiplier) + 0.5); // off by +1/-1 unit on occasion
    return (spotY + y1);	// return value of (new mouseY) or (p2MouseY)

  } // end getYCoord()
//****************************************************************************  
  class HybGrid2PosHelpFrame extends JFrame 
  {
    HybGrid2PosHelpFrame(String title)	// constructor
    {
      super(title);		// call Frame's constructor

      //create an object to handle window events
      HybGrid2PosWindowAdapter adapter = new HybGrid2PosWindowAdapter(this);

      //register it to receive those events
      addWindowListener(adapter);
    }  // end constructor

    public void paint (Graphics g)	// text displayed in help box
    {
      g.drawString("LOADING THE IMAGE:",10,40); 
      g.drawString("Enter file name of image (must be *.gif or *.jpg) in text field.",10,52); 
      g.drawString("File must be in the same directory as, or a subdirectory of, that for the applet's",10,64); 
      g.drawString("html/class files.  Examples:  image1.gif, subdir_of_images/image1.gif",10,76); 

      g.drawString("FILTER & PLATE NUMBERS:  Select filter number and plate number range.",10,96);

      g.drawString("TOP LEFT & BOTTOM RIGHT:  (reference points to account for different image sizes)",10,116); 
      g.drawString("Select \"Top Left\" radio button, then click on upper left-hand corner of spotted area.",10,128);
      g.drawString("Select \"Bottom Right\" radio button, then click on bottom right-hand corner.",10,140); 
      g.drawString("Repeat as necessary until the outline appears just outside of the spotted area.",10,152); 

      g.drawString("PICK SPOT:",10,172); 
      g.drawString("Select third radio button and begin picking hybridization signals.",10,184); 
      g.drawString("Click left button of mouse on filter image to select either clone in a clone pair.",10,196); 
      g.drawString("Hint:  use 4x4 duplication diagram as an aid to clicking accurately.",10,208); 

      g.drawString("REFRESH:  Removes reference points and all saved plate/well locations.",10,228);

      g.drawString("SAVE COORDINATES:",10,248); 
      g.drawString("Clone selection within a 4x4 area may be adjusted by clicking on duplication pattern.",10,260); 
      g.drawString("Use \"Save Coordinates\" button to save plate number and well coordinates for clone.",10,272); 
      g.drawString("Alternatively, you can Ctrl-click (either Ctrl-right-click or Ctrl-left-click anywhere)",10,284); 
      g.drawString("to save plate/well data.",10,296); 

      g.drawString("INTENSITY:",10,316);
      g.drawString("If needed, rate the intensity of the signal selected--scale is 1 to 5.",10,328);
    
      g.drawString("REPORT:",10,348); 
      g.drawString("When you have finished picking and saving points, use pop-up menu to select report:",10,360); 
      g.drawString("   - Order Saved:  reports plate/well locations in the order they were saved",10,372); 
      g.drawString("   - Plate Order:  reports plate/well locations ordered by plate number",10,384); 

      g.drawString("CUT & PASTE TO SAVE:",10,404); 
      g.drawString("Since applets cannot write to local files, you can save plate/well locations by cutting",10,416); 
      g.drawString("and pasting from this text area (highlight by clicking in front of first character,",10,428); 
      g.drawString("scrolling down, then Shift-clicking after last character) to a text editor like Notepad.",10,440); 

      g.drawString("SHOW:",10,460);
      g.drawString("To highlight a set of clones on the filter, triple-click on (or otherwise select) ONE line ",10,472);
      g.drawString("in report, then press \"Show\" button.",10,484);

      g.drawString("REMOVE:",10,504);
      g.drawString("To remove a set of coordinates, triple-click on (or otherwise select) ONE line in report,",10,516);
      g.drawString(" then press \"Remove\" button.",10,528);

    }  // end paint
  } // end class HybGrid2PosHelpFrame
//*****************************************************************************	
//****************************************************************************  
  class HybGrid2PosWindowAdapter extends WindowAdapter // need this class so frame will close
  {
    HybGrid2PosHelpFrame helpFrame;
    public HybGrid2PosWindowAdapter(HybGrid2PosHelpFrame helpFrame)
    {
      this.helpFrame = helpFrame;
    }
    public void windowClosing(WindowEvent we)
    {
      helpFrame.setVisible(false); // removes window from screen when closed
    }
  } // end class HybGrid2PosWindowAdapter
//****************************************************************************  
//*****************************************************************************
  class HybDataPanel extends JPanel 	// data area to left of image
  {
    HybGrid2Pos controller;

    //*****************************************************************************
    public HybDataPanel(HybGrid2Pos controller) 
    {
        this.controller = controller;
    }

    //*****************************************************************************
    public void paintComponent(Graphics g) 
    {
     try
     {
       super.paintComponent(g);  		// paint background first

       t.setText("");				// to prevent duplicate data in text area

       // reference points NOT YET picked
       if (x1==0)				// 1st ref point hasn't been selected yet
       {
         setTopLeft.setForeground(PURPLE);	// cue user ("Top Left" highlighted)
         setTopLeft.setSelected(true);		// first reference point
         pickSpot.setForeground(Color.black);
       }
       else if ((x1>0) && (x2==0))		// other ref point not yet picked
       {
         setBottomRight.setForeground(PURPLE);	// cue user (highlight "Bottom Right" button)
         setTopLeft.setForeground(Color.black);	// upper left point already set
       }
       else if ((x1>0) && (x2>0) && (x1>x2))	// ref points in wrong orientation
       {
         setTopLeft.setForeground(PURPLE);  	// cue user
         setBottomRight.setForeground(PURPLE);  // cue user
         pickSpot.setForeground(Color.black);	
       }
       else    					// two ref points have been selected 
       {
         setTopLeft.setForeground(Color.black);
         setBottomRight.setForeground(Color.black);
         pickSpot.setForeground(PURPLE);	// cue user (highlight "Pick Spot" button)
       }

 
       // a reference point has been picked
       if ( (x1 > 0) || (x2 > 0) )	
       {
         refresh.setEnabled(true); 	// enable "Refresh" button
       }
       else				// mouse has yet to be clicked
       {
         refresh.setEnabled(false);	// disable "Refresh" button
       }

       // OUTPUT list of clone plate/well coordinates
       if ( (printReport) && ( signalCounter > 0) )	// must have something saved to print report
       {
         showCoords.setEnabled(true);			// OK to enable buttons
         removeCoords.setEnabled(true);

         t.append("IMAGE: "+imageName.getText()+"\n");    // write to text area
         t.append((signalCounter+1)/2+" clone pair"+(signalCounter > 2 ? "s" : "")+" saved\n");
         t.append("Filter\tPlate\tRow\tCol\tScore\tField\tPosition\n");		// C is plate column (filter row)
 
         if (inPlateOrder)				// user requested plate-ordered report
         {
           sortClones();	// put here so that both # clone pairs and plate/well locations updated
        
           for (int i=0; i<stringCounter; i++)
           {
             t.append(outputByPlate.elementAt(i)+"\n");	// write to text area
           } // end for
         }
         else						// user requested saved-order report	
         {
           for (int i=0; i<stringHashKey; i++)	// loop only through maximum possible hash key
           {
             hashStringValue = (String)outputStrings.get(String.valueOf(i));
             if ( hashStringValue != null )
             {
               t.append(""+hashStringValue+"\n");   	// write to text area
             } 
           } // end for
         } // end if inPlateOrder/SavedOrder
       } 
       else	// "No Report" requested --> can't use show/remove buttons
       {
         showCoords.setEnabled(false);
         removeCoords.setEnabled(false);
       } // end if printReport & more than one signal saved


       if ( (doNotSaveAgain) ||		// if clone coordinates have just been saved
            (!drawPoint1) )		// 	or point off of image selected
       {	      
         saveCoords.setEnabled(false); 	// disable "Save Coordinates" button 
       }        
       else				// clone just picked, not yet saved
       {
         g.setColor(FUCHSIA);		// boxes turn fuchsia-colored
         saveCoords.setEnabled(true); 	// enable "Save Coordinates" button
       }
     }
     catch (Exception e)
     { 
       err1=err1+"hybDataPanelPaint error: "+e;
       e.printStackTrace();
     }
    } // end paintComponents()
  } // end class HybDataPanel
//*****************************************************************************
//*****************************************************************************
  class HybGridPanel extends JPanel implements MouseListener, MouseMotionListener
  // grid area in data panel
  {
    HybGrid2Pos controller;
    //*****************************************************************************
    public HybGridPanel(HybGrid2Pos controller) 
    {
      this.controller = controller;

      addMouseListener(this); 	// register grid panel as mouse event listener 
      addMouseMotionListener(this);
    }
    //*****************************************************************************
    public void paintComponent(Graphics g) 	// HybGridPanel
    {
     try
     {
      super.paintComponent(g);  //paint background

      // filter coordinates
      g.drawRect(5,5,124,67);		// box - filter/plate data
      g.drawLine(5,40,128,40);
      
      // display clone stats in two boxes 
      g.drawString ("X:  ",10,20);   	// coordinates on filter: variable names
      g.drawString ("Y:  ",10,33);
      g.drawString("Field: ",75,20);
      g.drawString("Pos: ",75,33);
      g.drawString("Plate: ",10,55);	// plate number
      g.drawString("Row: ",75,55);	// well row = filter column
      g.drawString("Col: ",75,68);	// well coordinates

      g.drawString("Clone prs. saved: "+(signalCounter+1)/2,5,180);
      
      if (doNotSaveAgain)		// match color of #s to color of saved points on filter
      {  
        g.setColor(FUCHSIA);	
      }

      g.drawString (""+realSpotX,28,20);// coordinates on filter: variable values
      g.drawString (""+realSpotY,28,33);
      g.drawString(""+fieldNum,108,20);
      g.drawString(""+position,108,33);
      g.drawString(""+plateNum,45,55);	// plate number
      g.drawString(""+column,106,55);	// well row = filter column
      g.drawString(""+rowNum,106,68);	// well coordinates


      //4x4 grid
      g.setColor(Color.white);	
      g.fillRect(25,77,88,88);		// white BORDER around 4x4 pattern    
      g.setColor(getForeground());	// default foregrd color=black
      g.drawRect(25,77,88,88);		// outline around 4x4 pattern
 
    
      // paint selected spot on upper 4x4 clone array
      if (drawPoint1)  			// if point on filter, then show point on 4x4 pattern, too
      {
        if (inXAisle)			// Point in VERTICAL aisle between 4x4 squares
        {
          if (xAisle=='E') { xSpot = 105; }	// show spot in vertical aisle 
          if (xAisle=='W') { xSpot = 27; }
        }
        else 				// Point NOT in vertical aisle between 4x4s
        {
          if      ((realSpotX % 4)==1) { xSpot = 33; }	// coords for valid spot locations
          else if ((realSpotX % 4)==2) { xSpot = 51; } 
          else if ((realSpotX % 4)==3) { xSpot = 69; }
          else                   { xSpot = 87; }
        } // end if Point 1 in a vertical aisle
      
        if (inYAisle) 			// Point in HORIZONTAL aisle between 4x4s
        {  
          if (yAisle=='S') { ySpot = 157; }	// show spot in horiz aisle on grid
          if (yAisle=='N') { ySpot = 79; }
        } 
        else	 			// Point NOT in horizontal aisle between 4x4s
        {
          if      ((realSpotY % 4)==1) { ySpot = 85; }
          else if ((realSpotY % 4)==2) { ySpot = 103; }
          else if ((realSpotY % 4)==3) { ySpot = 121; }
          else                   { ySpot = 139; }
        } // end if point in a horizontal aisle

        if ((inXAisle) || (inYAisle))	// INVALID spot in aisle between 4x4s
        {
          if (!inXAisle) { xSpot += 6; }	// align x,y 
          if (!inYAisle) { ySpot += 6; }
          g.setColor(Color.gray);
          g.fillOval(xSpot,ySpot,6,6);		// paint grey aisle spot
        }
        else				// a VALID spot location on 4x4 grid
        {
          g.setColor(CYAN);
          g.fillOval(xSpot,ySpot,18,18);	// paint cyan-colored spot on 4x4 grid
        }
      } // end if drawPoint1

      // MUST follow spot-painting so that black circles numbers will show on top of CYAN color
      g.setColor(getForeground());	// default foregrd color=black

      for (int i=33; i<88; i=i+18)	// draws CIRCLES for 4x4 dup pattern
      { 
        for (int j=85; j<140; j=j+18)
        {
          g.drawOval(i,j,18,18);
        }
      }

      g.drawString("1",40,98);		// NUMBERS inside circles in 4x4 pattern
      g.drawString("2",58,98);
      g.drawString("3",76,98);
      g.drawString("6",94,98);
      g.drawString("4",40,116);
      g.drawString("5",58,116);
      g.drawString("4",76,116);
      g.drawString("7",94,116);
      g.drawString("3",40,134);
      g.drawString("2",58,134);
      g.drawString("1",76,134);
      g.drawString("7",94,134);
      g.drawString("5",40,152);
      g.drawString("6",58,152);
      g.drawString("8",76,152);
      g.drawString("8",94,152); 


      // MUST be last action in paintComponent to properly send focus
      if ( showSelectedClone )
      {
        t.requestFocus();      	// selection can occur w/o focus, but focus --> can move cursor in textarea
				// t.requestFocusInWindow(); works, too
				// t.grabFocus(); works, too
        t.setSelectionStart(textStart); 	// so easier for user to make selection for removal
        t.setSelectionEnd(textEnd);
      } // end if showSelectedClone
     }
     catch (Exception e)
     { 
       err1=err1+"hybGridPanelPaint error: "+e;
       e.printStackTrace();
     }
    } // end paintComponent() in HybGridPanel
    //*****************************************************************************
    public void mouseClicked(MouseEvent me)	// HybGridPanel
    {
      try
      { 
        gridX=me.getX() - ADJUSTMENT;	// adj causes selected spot to 
        gridY=me.getY() - ADJUSTMENT;	// display at mouse pointer tip

        if ( ( gridX > 29  ) && ( gridX < 48  ) ) // positions 1,4,3,5 on dup pattern
        {
          if ( ( gridY > 81 ) && ( gridY < 100 ) )       { newPosition = "1a"; reposition();}
          else if ( ( gridY > 99 ) && ( gridY < 118 ) )  { newPosition = "4a"; reposition();}
          else if ( ( gridY > 117 ) && ( gridY < 136 ) ) { newPosition = "3b"; reposition();}
          else if ( ( gridY > 135 ) && ( gridY < 154 ) ) { newPosition = "5b";reposition(); } 
          else 
          { 
            drawPoint1=false;	// gridY in invalid location -> don't display point clicked
          			// (this doesn't work if point w/"JLabel", e.g, "Adjust Position," clicked)
          } // end if gridY in correct place
        }
        else if ( ( gridX > 47 ) && ( gridX < 66 ) ) // positions 2,5,2,6
        {
          if ( ( gridY > 81 ) && ( gridY < 100 ) )       { newPosition = "2a"; reposition();}
          else if ( ( gridY > 99 ) && ( gridY < 118 ) )  { newPosition = "5a"; reposition();}
          else if ( ( gridY > 117 ) && ( gridY < 136 ) ) { newPosition = "2b"; reposition();}
          else if ( ( gridY > 135 ) && ( gridY < 154 ) ) { newPosition = "6b"; reposition();}
          else 
          { 
            drawPoint1=false;  // gridY in invalid location -> don't display point clicked
          } // end if gridY in correct place          
        }
        else if ( ( gridX > 65 ) && ( gridX < 84 ) ) // positions 3,4,1,8
        {
          if ( ( gridY > 81 ) && ( gridY < 100 ) )       { newPosition = "3a"; reposition();}
          else if ( ( gridY > 99 ) && ( gridY < 118 ) )  { newPosition = "4b"; reposition();}
          else if ( ( gridY > 117 ) && ( gridY < 136 ) ) { newPosition = "1b"; reposition();}
          else if ( ( gridY > 135 ) && ( gridY < 154 ) ) { newPosition = "8a"; reposition();} 
          else 
          { 
            drawPoint1=false;  // gridY in invalid location -> don't display point clicked
          } // end if gridY in correct place  
        }
        else if ( ( gridX > 83 ) && ( gridX < 102 ) ) // positions 6,7,7,8
        {
          if ( ( gridY > 81 ) && ( gridY < 100 ) )       { newPosition = "6a"; reposition();}
          else if ( ( gridY > 99 ) && ( gridY < 118 ) )  { newPosition = "7a"; reposition();}
          else if ( ( gridY > 117 ) && ( gridY < 136 ) ) { newPosition = "7b"; reposition();}
          else if ( ( gridY > 135 ) && ( gridY < 154 ) ) { newPosition = "8b"; reposition();} 
          else 
          { 
            drawPoint1=false;  // gridY in invalid location -> don't display point clicked
          } // end if gridY in correct place  
        }
        else // gridX < x1 but not on dup pattern
        {
          drawPoint1=false;
        } // end if gridX on/off dup pattern
      }
      catch (Exception e)
      {
        err1=err1+"hybGridMouseClicked error: "+e;
        e.printStackTrace();
      }
    } // end mouseClicked for if clicking in grid on data panel (left of image)
    //****************************************************************************  
    public void mouseEntered(MouseEvent me) {} // empty implementation instead of
    public void mouseExited(MouseEvent me) {}  // using MouseAdapter class
    public void mousePressed(MouseEvent me) {}
    public void mouseReleased(MouseEvent me) {}
    public void mouseDragged(MouseEvent me) {}
    public void mouseMoved(MouseEvent me) {}
    //****************************************************************************  
} // end class HybGridPanel
//*****************************************************************************
//*****************************************************************************
  class HybImagePanel extends JPanel 
  // "public" results in reqt to be in separate *.java file
  // need to make another component, JPanel, for painting -- can't paint in applet when using Swing
  {
    HybGrid2Pos controller;

    //****************************************************************************  
    public HybImagePanel(HybGrid2Pos controller) 
    {
        this.controller = controller;
    } 
    
    //****************************************************************************  
    public void paintComponent(Graphics g) 
    {
     try
     {
        super.paintComponent(g);  //paint background
//comment out after debug
//g.drawString("Error: "+err1,10,10);

      if ( !imageName.getText().equals("here") )
      {
//comment out after debug 
//g.drawImage(autorad,5,15,this);	// load image
	//if not debugging:        
 	g.drawImage(autorad,10,10,this);	// load image
      }
     

      // Draw GRID LINES on filter
      if ( (x2>x1) && (x1>0) && (x2>0) ) // ref points picked correctly
      {
        // draw lines around 4x4 patterns on filter
        g.setColor(PINK);		 // grid lines around 4x4 patterns
      
        for (int i=1; i<16; i++)
        {
          // 15 grid lines between vertical lines
          xIncrement = (int)(i*9/xMultiplier + .5);	// (8 units in 4x4) + (1 unit for aisle) = 9

          g.drawLine(x1+xIncrement,y1,	
                     x1+xIncrement,y2);
          g.drawLine(x1+(int)(145/xMultiplier + .5)+xIncrement,y1,	
                     x1+(int)(145/xMultiplier + .5)+xIncrement,y2);	// middle two fields
          g.drawLine(x1+(int)(290/xMultiplier + .5)+xIncrement,y1,	
                     x1+(int)(290/xMultiplier + .5)+xIncrement,y2);	// right two fields
        }

        // 23 grid lines between horizontal lines
        for (int i=1; i<24; i++)	// 23 grid lines between horizontal lines
        {
          yIncrement=(int)(i*9/yMultiplier + .5);	// (8 units in 4x4) + (1 unit for aisle) = 9
                
          g.drawLine(x1,y1+yIncrement,
          	   x2,y1+yIncrement);					// upper half of filter
          g.drawLine(x1,y1+(int)(217/yMultiplier + .5)+yIncrement,	
          	   x2,y1+(int)(217/yMultiplier + .5)+yIncrement);	// bottom half of filter
        }      

        // FIELD borders on filter	
        g.setColor(PURPLE);		// stands out more than getForeground()
        g.drawRect(x1,y1,x2-x1,y2-y1); 	// draw border around filter & fields

        g.drawLine(x1+(int)(144/xMultiplier + .5),y1,
                   x1+(int)(144/xMultiplier + .5),y2);	// double vertical line
        g.drawLine(x1+(int)(145/xMultiplier + .5),y1,
                   x1+(int)(145/xMultiplier + .5),y2);
                 
        g.drawLine(x1+(int)(289/xMultiplier + .5),y1,
                   x1+(int)(289/xMultiplier + .5),y2);	// another double vertical line
        g.drawLine(x1+(int)(290/xMultiplier + .5),y1,
                   x1+(int)(290/xMultiplier + .5),y2);
                                  
        g.drawLine(x1,y1+(int)((216.0/yMultiplier) + .5),
                   x2,y1+(int)((216.0/yMultiplier) + .5));	// double horiz. line
        g.drawLine(x1,y1+(int)((217.0/yMultiplier) + .5),
                   x2,y1+(int)((217.0/yMultiplier) + .5));
      } // end if x2>x1 etc.
    

      // HELP WINDOW
      if (showHelp)		// show help frame window
      {
        f.setVisible(true);
        showHelp=false;		// otherwise, help window won't go away
      }
      else
      {
        f.setVisible(false);
      }


      // Draw CLONES on filter
      // paint TENTATIVELY-selected points as CYAN-colored dots
      if (drawPoint1)		// OK to draw as point selected lies on image
      {      
        g.setColor(CYAN);
        g.fillOval(mouseX,mouseY,4,4); 
        g.fillOval(p2MouseX,p2MouseY,4,4); 
      }
      
      // SAVED CLONES
      if ( signalCounter > 0 )
      {
        // paint saved points as MAGENTA dots
        g.setColor(Color.magenta);	

        for (int i=0; i<signalHashKey; i++)	// cycle only through max possible # signals
        {
          hashXValue = (Integer)xMatchedSignals.get(String.valueOf(i));
  
          if ( hashXValue != null )		// this key is linked to a value (i.e., not removed)
          {
            g.fillOval((hashXValue.intValue()),
    	              ((Integer)yMatchedSignals.get(String.valueOf(i))).intValue(),4,4);
          }
        } // end for

        // paint selected clone as LIGHTER_YELLOW dots
	if ( showSelectedClone )
	{
          g.setColor(LIGHTER_YELLOW);
          g.fillOval(((Integer)xMatchedSignals.get(hashKeyToShow1st)).intValue(),
    	             ((Integer)yMatchedSignals.get(hashKeyToShow1st)).intValue(),4,4);
    	             
 	  // coordinates for clone twin
          g.fillOval(((Integer)xMatchedSignals.get(hashKeyToShow2nd)).intValue(),
    	             ((Integer)yMatchedSignals.get(hashKeyToShow2nd)).intValue(),4,4);
	} // end if showSelectedClone
      } // end if signalCounter > 0
     }
     catch (Exception e)
     {
       err1=err1+"hybimagepaint error: "+e;
       e.printStackTrace();
     }
    } // end paintComponent(g)
   //****************************************************************************  
  } // end class HybImagePanel
//*****************************************************************************

} // end class HybGrid2Pos (encloses all other classes)
//*****************************************************************************
// END OF PROGRAM	
//*****************************************************************************	
// ---------------------------------------------------------------------
//  This software is a "United States Government Work" under the terms 
//  of the United States Copyright Act. It was written as part of 
//  official duties performed by a United States Government employee(s) 
//  and thus cannot be copyrighted. This software is freely available 
//  to the public for use. The United States Department of Agriculture 
//  and the U.S. Government have not placed any restriction on its use 
//  or reproduction. 
// ---------------------------------------------------------------------
