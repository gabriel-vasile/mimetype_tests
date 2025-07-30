// Hybsweeper.java
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
// Notes:
// May 2001 NL
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
// Reports can be displayed on screen--a short report for
// just a few signals, a long report for many, many signals.
// Addresses can be listed in the order saved or in plate order.
// Since applets can't write directly to a local file, 
// a text area is provided from which the user can 
// cut/paste a report of clone addresses for saving to a file.
//
// Users who do not use the ordering protocol of fields 2,6,3 in
// the top row and fields 4,1,5 in the bottom row of the filter
// can set the field numbers in the source code below.
// (See "UPPER_LEFT")


import java.awt.*;		// pkg needed for Image class
import java.awt.event.*;        // package needed for buttons
import java.applet.*;
import java.util.*;		// vectors & array lists

//<applet code = "Hybsweeper" WIDTH=1500 HEIGHT=1500></applet>

public class Hybsweeper extends Applet implements ActionListener, ItemListener, 
                                          MouseListener, MouseMotionListener
{   
  Image autorad;    		// image of autoradiogram of filter

  TextField imageName;		// to capture user-input filename
  
  Vector xMatchedSignals;	// for x-y coordinates of matching signals
  Vector yMatchedSignals;	// "
  Vector reportStrings;		// for plate/well data output to screen
  Vector reportByPlate;		//  " in plate order
  Vector outputStrings;		// for output to save to file
  Vector outputByPlate; 	//  " in plate order
  
  Choice whichFilter;		// pop-up list of filter/plate numbers
  Choice whichReport;		// pop-up list of report choices
  Choice whatIntensity;		// pop-up list of signal intensity ratings
 
  Frame f;

  String location;		// for plate location report
  String intensity;		// signal rating for report
  
  boolean shortPrint=false;	// report on plate locations in left column
  boolean removeImage=false;	// remove image for printing
  boolean longPrint=false;	// report in bigger area (image area)
  boolean inPlateOrder=false;	// print report in plate order
  boolean drawPoint1=false;	// paint point on 4x4 dup pattern / clone array
  boolean drawPoint2=false;	// "
  boolean inXAisle=false;	// if selected spot in vertical aisle
  boolean p1InXAisle,p2InXAisle;
  boolean inYAisle=false;	// if selected spot in horizontal aisle
  boolean p1InYAisle,p2InYAisle;
  boolean doNotSaveAgain;	// Don't save same points twice
  boolean showHelp=false;	// show help frame window
  
  int x1, y1; 			// top left coordinates
  int x2, y2;			// bottom right
  int x3, y3;                   // width & length of screen image

  double xMultiplier;		// to bring x coordinate to 433 scale; 433 / width
  double yMultiplier;           // to bring y coordinate to 432 scale; 432 / height

  int mouseX, mouseY;           // screen coordinates for selected spot
  int p1MouseX, p1MouseY;	// aka mouseX/Y for cyan-colored selected spots
  int p2MouseX, p2MouseY;	// "
  int spotX, spotY;		// coordinates for mouseX/Y net of x1 & y1
  int spot_433_X, spot_432_Y;   // coordinates on a 433x432 grid
  int realSpotX, realSpotY;	// coordinates on a 192x192 grid 
  int p1X, p1Y, p2X, p2Y;	// aka realSpotX/Y, displayed on 4x4 clone arrays 
  int xSpot,ySpot;		// coordinates for painted spots
  
  int fieldNum, position;	// location on filter
  int p1FieldNum, p2FieldNum;	// "
  int p1Position, p2Position;	// "
  
  int plateNum, rowNum, colNum;	// plate/well locations per calculatePlate()
  int p1PlateNum, p2PlateNum;	// plate number
  int p1RowNum, p2RowNum;	// row # on plate
  int plateMultiplier=0;		// to account for different filters
  
  String p1RowString, p2RowString;	// row # on plate (including leading zero)
  String p1PlateString, p2PlateString;	// plate number (including leading zeros)
 
  char column='0';		// column letter on plate:
  char p1Column='0';		//  initialized as zero because Netscape displays
  char p2Column='0';		//  "square" character if ' ' used
  char xAisle, p1XAisle, p2XAisle;	// x-aisle east(E)/west(W) of 4x4 pattern
  char yAisle, p1YAisle, p2YAisle;	// y-aisle north(N)/south(S) of 4x4 pattern
  
  int signalCounter=0;		// for vector of matchedSignals
  int stringCounter=0;		// to track strings of plate #s and well coordinates
  int yReport=10;		// for report of clone addresses
  int xReport=10;		// "
  
  final static double XSCALE = 433;
  final static double YSCALE = 432;
  final static double X3_Y3_ADJUSTER = 192.0/193.0; 
  final static Color  CYAN = new Color(150,245,255);
  final static Color  GREEN = new Color(0,77,30);
  final static Color  FUCHSIA = new Color(170,0,160);  // darker than Color.magenta
  final static Color  PURPLE = new Color(175,0,235);
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

  CheckboxGroup selectOption;
  Checkbox setTopLeft, setBottomRight, pickSpot;
  Checkbox cList[] = new Checkbox[3]; 	// pointers to reduce checkbox-related code
 
  Button help;				// displays instructions 
  Button refresh, savePoints;		// zero out | save values
  Button removeFilter, keepPicking;	// remove image | go back to picking spots
  
  Button bList[] = new Button[5];	// to reduce button-related code
  					// also needed for setEnabled() method
  
  TextArea t;				// text area to write report
  
  Font smallFont = new Font("SansSerif", Font.PLAIN, 9);
//*****************************************************************************	
  public void init() 
  {
    addMouseListener(this); 	// register applet as mouse event listener 
    addMouseMotionListener(this);
    
    setLayout(null);       	// kill layout manager (manually set format)
//  setBackground(Color.white);	// use default gray background 

    setFont(smallFont); 

    Label imageTitle = new Label("Enter image filename", Label.CENTER);
    imageTitle.setBounds(152,5,106,11);
    add(imageTitle);
    
    imageName = new TextField(12);	// get image file using a text field
    add(imageName);
    imageName.setBounds(155,18,100,28);
    imageName.addActionListener(this);
    
    whichFilter = new Choice();
    whichFilter.addItem(" 1 | 1-48");	// the 1st item selected by default
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
    whichFilter.setBounds(155,52,100,20);
    add(whichFilter);
    whichFilter.addItemListener(this);
    
    // help window
    f = new HybHelpFrame("Help Frame Window");
    f.setSize(550,560); // pixels wide, pixels high
    
    selectOption = new CheckboxGroup();	// three radio buttons
    
    setTopLeft=new Checkbox("",true,selectOption);  // Do buttons w/o label 1st...
    setTopLeft.setBounds(165,111,12,12);            // location of button
    setTopLeft.setBackground(getBackground());    
    Label s1 = new Label ("Top Left", Label.LEFT);  // ...then set label
    s1.setBackground(getBackground());              // no visible boundary
    s1.setBounds(180,110,65,12);                    // location of label
    
    setBottomRight=new Checkbox("",false,selectOption); 
    setBottomRight.setBounds(165,131,12,12);  
    setBottomRight.setBackground(getBackground());         
    Label s2 = new Label ("Bottom Right", Label.LEFT);   
    s2.setBackground(getBackground());             
    s2.setBounds(180,130,65,12); 
         
    pickSpot=new Checkbox("",false,selectOption); 
    pickSpot.setBounds(165,151,12,12);  
    pickSpot.setBackground(getBackground());         
    Label s3 = new Label ("Pick Spot", Label.LEFT);  
    s3.setBackground(getBackground());             
    s3.setBounds(180,150,65,12);      
    
    add(s1); add(s2); add(s3); 
    
    // store references to radio buttons as added
   
    cList[0]  = (Checkbox) add(setTopLeft);
    cList[1]  = (Checkbox) add(setBottomRight);
    cList[2]  = (Checkbox) add(pickSpot);    
       
    for (int i=0; i < 3; i++)           
    {
      cList[i].addItemListener(this);		// register to receive item events
    }

    help = new Button("Help");			// brings up help box
    help.setBackground(getBackground());
    help.setForeground(GREEN);
    help.setBounds(175,83,60,20);
    
    refresh = new Button("Refresh");     	// click to zero out values
    refresh.setBackground(getBackground());	// button color
    refresh.setForeground(PURPLE);		// purple backgrd too bright
    refresh.setBounds(175,170,60,20); 
           
    savePoints = new Button("Save 2 Points");	// record pairs of signals
    savePoints.setBackground(getBackground()); 
    savePoints.setForeground(FUCHSIA);		// Color.magenta too bright
    savePoints.setBounds(156,409,100,20);

  
    whatIntensity = new Choice();		// designate signal intensity
    whatIntensity.addItem("No Rating");
    whatIntensity.addItem("one..............");
    whatIntensity.addItem("two..............");
    whatIntensity.addItem("three............");
    whatIntensity.addItem("four.............");
    whatIntensity.addItem("five.............");
    whatIntensity.setBounds(158,434,100,20);
    add(whatIntensity);
    whatIntensity.addItemListener(this);

    whichReport = new Choice();
    whichReport.addItem("No Report");		// 1st item selected by default
    whichReport.addItem("Order Saved");
    whichReport.addItem("Plate Order");
    whichReport.addItem(">120, Saved");
    whichReport.addItem(">120, Plate");
    whichReport.setBounds(158,459,100,20);
    add(whichReport);
    whichReport.addItemListener(this);
    
    removeFilter = new Button("Remove Image");	// e.g., to print w/o image
    removeFilter.setBackground(getBackground());        
    removeFilter.setBounds(156,483,100,20);   

    keepPicking = new Button("Pick More Points");// return to picking spots
    keepPicking.setBackground(CYAN);
    keepPicking.setBounds(156,590,100,20);

    bList[0] = (Button) add(refresh);
    bList[1] = (Button) add(savePoints);
    bList[2] = (Button) add(removeFilter);	
    bList[3] = (Button) add(keepPicking);
    bList[4] = (Button) add(help);
    
    for (int i=0; i < 5; i++)           
    {
      bList[i].addActionListener(this); // register to receive events
    }
     
    Label outputTitle = new Label("Cut & paste to save", Label.CENTER);
    outputTitle.setBounds(152,508,106,11);
    add(outputTitle);			// text area label
 
    t = new TextArea();			// to hold output from outputStrings
    t.setBounds(158,520,97,65);
    add(t);

    xMatchedSignals = new Vector();	// dynamic array to hold saved signals (x,y)
    yMatchedSignals = new Vector();	// "
    reportStrings   = new Vector();	// dynamic array to hold plate/well loc's
    outputStrings   = new Vector();	// " 
    reportByPlate   = new Vector();	// report in plate order
    outputByPlate   = new Vector();	// "
    
  } // end init
//*******************************************************************************  
  public void stop()
  {
    f.setVisible(false);		// close help window
  }
//*******************************************************************************
  public void paint (Graphics g)
  {
    // refresh data area
    
    t.setText("");	// to prevent duplicate data in text area
    
    g.setColor(getBackground());	// default backgrd color=gray
    g.fillRect(0,0,275,getSize().height);	// clears left column
    g.fill3DRect(155,78,100,117,true);		// 3D box around radio buttons
    g.setColor(Color.red);	// red outlines of radio buttons to cue user
    if (x1==0)	// "Top Left" ref point hasn't been selected yet
    {
      g.drawRect(160,106,90,20);
    }
    else if ((x1>0) && (x2==0))	// highlight "Bottom Right" button
    {
      g.drawRect(160,126,90,20);
    }
    else if ((x1>0) && (x2>0) && (x1>x2))// ref points in wrong orientation
    {
      g.drawRect(160,106,90,20);	// highlight 1st two radio buttons
      g.drawRect(160,126,90,20);
    }
    else    			// highlight "Pick Spot" button
    {
      g.drawRect(160,146,90,20);
    }
    
    if ( (x1 > 0) || (x2 > 0) )	// a reference point has been picked
    {
      bList[0].setEnabled(true); 	// enable "Refresh" button
    }
    else			// mouse has yet to be clicked
    {
      bList[0].setEnabled(false);	// disable "Refresh" button
    }
    
    g.setColor(Color.white);	
    g.fillRect(160,212,88,88);		// wht border around 4x4 pattern
    g.fillRect(160,318,88,88);
    
    g.setColor(getForeground());	// default foregrd color=black
    g.drawRect(160,212,88,88);		// outline around 4x4 pattern
    g.drawRect(160,318,88,88);
    g.drawString("Left-click",180,209);	// 4x4 duplication pattern labels
    g.drawString("Right-click",180,315);
   
    // paint selected spot on upper 4x4 clone array
    
    if (drawPoint1)  		// Show Point 1 on 4x4 pattern
    {
      if (p1InXAisle)		// Point 1 in VERTICAL aisle between 4x4 squares
      {
        if (p1XAisle=='E') { xSpot = 240; }	// show spot in vertical aisle 
        if (p1XAisle=='W') { xSpot = 162; }
      }
      else 			// Point 1 not in vertical aisle between 4x4s
      {
        if      ((p1X % 4)==1) { xSpot = 168; }	// coords for valid spot locations
        else if ((p1X % 4)==2) { xSpot = 186; } 
        else if ((p1X % 4)==3) { xSpot = 204; }
        else                   { xSpot = 222; }
      } // end if Point 1 in a vertical aisle
      
      if (p1InYAisle) 		// Point 1 in a HORIZONTAL aisle between 4x4s
      {  
        if (p1YAisle=='S') { ySpot = 292; }	// show spot in horiz aisle on upper grid
        if (p1YAisle=='N') { ySpot = 214; }
      } 
      else	 		// Point 1 not in horizontal aisle between 4x4s
      {
        if      ((p1Y % 4)==1) { ySpot = 220; }
        else if ((p1Y % 4)==2) { ySpot = 238; }
        else if ((p1Y % 4)==3) { ySpot = 256; }
        else                   { ySpot = 274; }
      } // end if Point 1 in a horizontal aisle
      
      if ((p1InXAisle) || (p1InYAisle))	// invalid spot in aisle between 4x4s
      {
        if (!p1InXAisle) { xSpot += 6; }	// align x,y 
        if (!p1InYAisle) { ySpot += 6; }
        g.setColor(Color.gray);
        g.fillOval(xSpot,ySpot,6,6);	// paint grey aisle spot
      }
      else				// a valid spot location on 4x4 grid
      {
        g.setColor(CYAN);
        g.fillOval(xSpot,ySpot,18,18);	// paint cyan-colored spot
      }
    } // end if drawPoint1

    // paint selected spot on lower 4x4 pattern    
    
    if (drawPoint2) 		// Show Point 2 on 4x4 pattern
    {
      if (p2InXAisle)		// Point 2 in VERTICAL aisle between 4x4s
      {
        if (p2XAisle=='E') { xSpot = 240; }	// show spot in vertical aisle
        if (p2XAisle=='W') { xSpot = 162; }
      }
      else 			// Point 2 not in vertical aisle between 4x4s
      {
        if      ((p2X % 4)==1) { xSpot = 168; }	// coordinates for valid spot locations
        else if ((p2X % 4)==2) { xSpot = 186; } 
        else if ((p2X % 4)==3) { xSpot = 204; }
        else                   { xSpot = 222; }
      } // end if Point 2 in vertical aisle
      
      if (p2InYAisle)		// Point 2 in HORIZONTAL aisle between 4x4s
      {  
        if (p2YAisle=='S') { ySpot = 398; }	// put spot in horiz aisle on lower grid
        if (p2YAisle=='N') { ySpot = 320; }
      } // end if Point 2 in horiz aisle
      else			// Point 2 not in horizontal aisle between 4x4s
      {
        if      ((p2Y % 4)==1) { ySpot = 326; }
        else if ((p2Y % 4)==2) { ySpot = 344; }
        else if ((p2Y % 4)==3) { ySpot = 362; }
        else                   { ySpot = 380; }
      }

      if ((p2InXAisle) || (p2InYAisle))	// an invalid spot in aisle between 4x4s
      {
        if (!p2InXAisle) { xSpot += 6; }
        if (!p2InYAisle) { ySpot += 6; }
        g.setColor(Color.gray);
        g.fillOval(xSpot,ySpot,6,6);	// paint dark gray aisle spot
      }
      else				// a valid spot location on 4x4 grid
      {
        g.setColor(CYAN);
        g.fillOval(xSpot,ySpot,18,18);	// show cyan-colored spot
      }
    } // end if drawPoint2
    
    g.setColor(getForeground());	
    					// POINT 1
    for (int i=168; i<223; i=i+18)	// draws circles for 4x4 dup pattern
    { 
      for (int j=220; j<275; j=j+18)
      {
        g.drawOval(i,j,18,18);
      }
    }
    
    g.drawString("1",175,233);		// numbers inside circles in 4x4 pattern
    g.drawString("2",193,233);
    g.drawString("3",211,233);
    g.drawString("6",229,233);
    g.drawString("4",175,251);
    g.drawString("5",193,251);
    g.drawString("4",211,251);
    g.drawString("7",229,251);
    g.drawString("3",175,269);
    g.drawString("2",193,269);
    g.drawString("1",211,269);
    g.drawString("7",229,269);
    g.drawString("5",175,287);
    g.drawString("6",193,287);
    g.drawString("8",211,287);
    g.drawString("8",229,287);
					// POINT 2
    for (int i=168; i<223; i=i+18)	// draws circles for 4x4 dup pattern 
    { 
      for (int j=326; j<381; j=j+18)
      {
        g.drawOval(i,j,18,18);
      }
    }

    g.drawString("1",175,339);		// numbers for second 4x4 grid
    g.drawString("2",193,339);
    g.drawString("3",211,339);
    g.drawString("6",229,339);
    g.drawString("4",175,357);
    g.drawString("5",193,357);
    g.drawString("4",211,357);
    g.drawString("7",229,357);
    g.drawString("3",175,375);
    g.drawString("2",193,375);
    g.drawString("1",211,375);
    g.drawString("7",229,375);
    g.drawString("5",175,393);
    g.drawString("6",193,393);
    g.drawString("8",211,393);
    g.drawString("8",229,393);
    
    autorad = getImage(getDocumentBase(), imageName.getText()); // gets image file
    
    if (!removeImage)			// user has not requested image removal
    {    
      g.drawImage(autorad,275,0,this);	// load image
      bList[2].setEnabled(true); 	// enable "Remove Image" button
    }
    else				// image has to be removed
    {					// paint white space in image area
      g.setColor(Color.white);
      g.fillRect(275,0,getSize().width-275,getSize().height);
      bList[2].setEnabled(false); 	// disable "Remove Image" button
    }
    
    if ((shortPrint) || (longPrint))	// user requested report
    {
      bList[3].setEnabled(true);	// enable "Pick More Points" button
      g.setColor(Color.white);  	// make report area white

      if (shortPrint) 		// use left column for short report
      { 
        xReport=10;
        g.fillRect(0,0,135,getSize().height);
      }			
      else //  (longPrint) 
      { 			// use image area for long report
        xReport=285;
        g.fillRect(275,0,getSize().width-275,getSize().height);
      }  // end shortPrint/longPrint   		
       
      g.setColor(getForeground());
      g.drawString("IMAGE: "+imageName.getText(),xReport,yReport);
      t.append("IMAGE: "+imageName.getText()+"\n");    // write to text area
      yReport+=12;
      g.drawString((signalCounter+1)/2+" clone pairs saved",xReport,yReport);
      t.append((signalCounter+1)/2+" clone pairs saved\n");
      yReport+=12;
      g.drawString("Plate   R C Score",xReport,yReport); // R is plate row (filter column)
      t.append("Plate\tRow\tCol\tScore\n");		// C is plate column (filter row)
 
      if (inPlateOrder)			// user requested plate-ordered report
      {
        for (int i=0; i<stringCounter; i++)
        {
          yReport+=12;
          g.drawString(""+reportByPlate.elementAt(i),xReport,yReport);
          t.append(outputByPlate.elementAt(i)+"\n");	// write to text area
          if (yReport>(getSize().height-20))  // move to next column
          {
            xReport+=120;
            yReport=36;
          }
        } // end for
      }
      else	// user requested saved-order report	
      {
        for (int i=0; i<stringCounter; i++)
        {
          yReport+=12;
          g.drawString(""+reportStrings.elementAt(i),xReport,yReport);
          t.append(""+outputStrings.elementAt(i)+"\n");    // write to text area     
          if (yReport>(getSize().height-20))  // move to next column
          {
            yReport=36;
            xReport+=120;
          }
        }
      } // end if inPlateOrder/SavedOrder
      
      yReport=12;			// reinitialize y-coord
    }
    else 				// if not displaying report... 
    {
      if (!removeImage)			// and image is on screen
      {
        bList[3].setEnabled(false);	// disable "Pick More Points" button
      }
      else				// image not there; need to restore
      {
        bList[3].setEnabled(true);	// enable "Pick More Points" button
      }
      
      // use the leftmost column to show mock x,y grid
      g.setColor(getForeground());
      g.drawRect(45,105,38,38);  		// rect graphic as mock filter 
      g.drawString(""+x1+","+y1,14,104);      	// show x,y coords on mock filter
      g.drawString(""+x2+","+y2,70,154);
      g.drawString("Grid is: ",15,169);		// check that grid ~ square
      g.drawString(""+x3+" across "+y3+" down",15,179);	
      
      if ( clonesMatch() )	// public boolean clonesMatch()
      {				// if clones from the same plate/well 
        g.setColor(FUCHSIA);	// boxes turn fuchsia-colored 
        
        if (doNotSaveAgain) 	// if clone pair has just been saved
        {	      
          bList[1].setEnabled(false); 	// disable "Save 2 Points" button 
        }        
        else			// clone pair just picked, not yet saved
        {
          bList[1].setEnabled(true); 	// enable "Save 2 Points" button
        }
      }	
      else			// clones from different plates/wells
      { 
        bList[1].setEnabled(false); 	// disable "Save 2 Points" button
      }
      
      // display clone stats in two boxes in leftmost column
      						// POINT 1
      g.drawString("Point 1",5,215);
      g.drawRect(5,220,105,72);			// box - filter/plate data
      g.drawString ("X:  "+p1X,10,237);   	// coordinates on filter
      g.drawString ("Y:  "+p1Y,10,250);
      g.drawString("Field: "+p1FieldNum,67,237);
      g.drawString("Pos: "+p1Position,67,250);
      g.drawLine(5,257,108,257);
      g.drawString("Plate: "+p1PlateNum,10,272);// plate number
      g.drawString("Row: "+p1Column,67,272);	// well row = filter column
      g.drawString("Col: "+p1RowNum,67,285);	// well coordinates
				     		// POINT 2 
      g.drawString("Point 2",5,321);
      g.drawRect(5,326,105,72);			// box - filter/plate data
      g.drawString ("X:  "+p2X,10,343);   	// coordinates on filter
      g.drawString ("Y:  "+p2Y,10,356);
      g.drawString("Field: "+p2FieldNum,67,343);
      g.drawString("Pos: "+p2Position,67,356);
      g.drawLine(5,363,108,363);
      g.drawString("Plate: "+p2PlateNum,10,378);// plate number
      g.drawString("Row: "+p2Column,67,378);	// well coordinates
      g.drawString("Col: "+p2RowNum,67,391);	// well column = filter row
      
      g.drawString("Clone pairs saved: "+(signalCounter+1)/2,5,410);
      g.drawString("To save points, Ctrl-click or --->",5,422);

    } //end if (long/shortReport)
     
    if (!removeImage)   // user hasn't selected removeImage/longPrint option
    {
      // paint tentatively-selected points as cyan-colored dots
      g.setColor(CYAN);
      if (p1MouseX > 0)	{ g.fillOval(p1MouseX,p1MouseY,4,4); }
      if (p2MouseX > 0) { g.fillOval(p2MouseX,p2MouseY,4,4); }
        
      // paint saved points as magenta dots
      g.setColor(Color.magenta);	
      for (int i=0; i<signalCounter; i++)
      {
        g.fillOval(((Integer)xMatchedSignals.elementAt(i)).intValue(),
                   ((Integer)yMatchedSignals.elementAt(i)).intValue(),4,4);
      }
    } // end if (!removeImage)

    if ((x2>x1) && (x1>0) && (x2>0) && (!removeImage)) // ref points picked correctly
    {
      int xA = (int)(.33333*(x2-x1));	// line dividing fields
      int xB = (int)(.66666*(x2-x1));
      int yA = (int)(.5*(y2-y1));
      
      g.setColor(PURPLE);		// stands out more than getForeground()
      g.drawRect(x1,y1,x2-x1,y2-y1); 	// draw border around filter & fields
      g.drawLine((x1+xA),y1,(x1+xA),y2);	// vertical lines
      g.drawLine((x1+xB),y1,(x1+xB),y2);
      g.drawLine(x1,(y1+yA),x2,(y1+yA));	// horizontal line
    }
    
    if (showHelp)		// show help frame window
    {
      f.setVisible(true);
      showHelp=false;		// otherwise, help window won't go away
    }
    else
    {
      f.setVisible(false);
    }

  } // end paint()

//*****************************************************************************	
  void calculateXY()
  {
  // need to account for space between squares and fields
  // spotted area of filter = 21.65 cm x 21.60 cm = grid 433w X 432h 
  // where 5 mm is one unit (5 mm x 433 = 2165 mm)
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
  // The adjustment is 192.0/193.0.
    
     xMultiplier = XSCALE / (int)(X3_Y3_ADJUSTER*x3);  // remove off-filter part
     yMultiplier = YSCALE / (int)(X3_Y3_ADJUSTER*y3);
     
  // say x1=2,y1=2 and x2=502,y2=502 (filter reference points)
  // say mouseX, mouseY = 3, 502 (coordinate of selected signal)
  // need to subtract out x1 & y1 ==> spotX=1, spotY=500
  
     spotX = mouseX - x1;
     spotY = mouseY - y1;
     
  // multiply by .866 & .864: (spot_433_X, spot_432_Y) = (.866, 432)
  // then round to nearest integer
  
     spot_433_X = (int)((spotX * xMultiplier) + .5);  // 1
     spot_432_Y = (int)((spotY * yMultiplier) + .5);  // 432
     
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
     						
  } // end calculateXY
  
//*****************************************************************************	
  void calculatePlate()	// after x-y on 192x192 grid derived from calculateXY() 
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
    	if      (realSpotY % 4 == 1) { position = 1; }
    	else if (realSpotY % 4 == 2) { position = 4; }
    	else if (realSpotY % 4 == 3) { position = 3; }
    	else			     { position = 5; }	// 192%4=0 so 5
    }
    else if (realSpotX % 4 == 2)	// second column in 4x4 array
    {
      	if      (realSpotY % 4 == 1) { position = 2; }
      	else if (realSpotY % 4 == 2) { position = 5; }
    	else if (realSpotY % 4 == 3) { position = 2; }
    	else			     { position = 6; }
    }
    else if (realSpotX % 4 == 3)	// third column in 4x4 array
    {
    	if      (realSpotY % 4 == 1) { position = 3; }
    	else if (realSpotY % 4 == 2) { position = 4; }
    	else if (realSpotY % 4 == 3) { position = 1; }
    	else			     { position = 8; }
    }
    else	// realSpotX % 4 == 0, the fourth column in 4x4 array
    {
    	if      (realSpotY % 4 == 1) { position = 6; }
    	else if (realSpotY % 4 == 2) { position = 7; }
    	else if (realSpotY % 4 == 3) { position = 7; }
    	else			     { position = 8; }
    }
    
    // GET PLATE NUMBER using field & position
    // if field 2 pos 1, then plate 2
    // if field 2 pos 2, then plate 8...		
    // if field 2 pos 8, then plate 44
    // if field 6 pos 1, then plate 6
                                     
    plateNum = ( plateMultiplier * 48 ) + (( position - 1 ) * 6 + fieldNum );
                                                  // plateNum=(5-1)*6+4=28
  } // end calculatePlate()
//*****************************************************************************	
  public boolean clonesMatch()
  {
        if ( (p1PlateNum!=0) &&		// calculations done
           (p1PlateNum==p2PlateNum) &&	// same plate
           (p1RowNum==p2RowNum) &&	// same clone address - row
           (p1Column==p2Column) &&	//		      & column
           (!p1InXAisle) && (!p2InXAisle) &&	// spot not in aisle
           (!p1InYAisle) && (!p2InYAisle) &&
           (((p1X==p2X)&&(p1Y!=p2Y)) ||		// not the exact same spot
            ((p1X!=p2X)&&(p1Y==p2Y)) ||
            ((p1X!=p2X)&&(p1Y!=p2Y))) )
	{
	  return true;
	}
	return false;
  } // end clonesMatch()
//*****************************************************************************	
  public void sortClones()
  {
    reportByPlate.removeAllElements();  // refresh vectors of previous
    outputByPlate.removeAllElements();	// in-plate-order reports
     
    // make copies of the in-saved-order reports
    reportByPlate = (Vector)(reportStrings.clone());	
    outputByPlate = (Vector)(outputStrings.clone());  

    // Unable to use Arrays.sort as java.util.Arrays couldn't be accessed
    // (a security issue); therefore, for-loops were used to do the sorting:

    int outerCount;		// index for outer for loop
    int innerCount;
    int lowerNumberIndex;	// index for lower "string" in comparison
    String tmp;			// holding place for string
  
    // Go thru array, find lowest-value string, put at head of line, 
    // go thru all array elements except first one, find lowest value, put in 2nd spot...
    
    for (outerCount = 0; outerCount < stringCounter-1; outerCount++)
    {
      lowerNumberIndex = outerCount;	// initial assumption
      for (innerCount = outerCount + 1; innerCount < stringCounter; innerCount++)
      {
        // if current string > the next string, it should follow the next string
        if ( ((String)(reportByPlate.elementAt(lowerNumberIndex))).compareTo((String)(reportByPlate.elementAt(innerCount))) > 0) 
        {
          lowerNumberIndex = innerCount;// make the next string's index the "lower string index"
        } // end if  
      } // end for (innerCount)
    
      // switch the strings (-->sort report for output to screen)
      tmp = (String)(reportByPlate.elementAt(outerCount));
      reportByPlate.setElementAt(reportByPlate.elementAt(lowerNumberIndex),outerCount);
      reportByPlate.setElementAt(tmp,lowerNumberIndex);
         
      // (-->sort report for output to "Cut/Save" text area)
      tmp = (String)(outputByPlate.elementAt(outerCount));
      outputByPlate.setElementAt(outputByPlate.elementAt(lowerNumberIndex),outerCount);
      outputByPlate.setElementAt(tmp,lowerNumberIndex);
  
    } // end for (outerCount)
     
  } // end sortClones()
//*****************************************************************************	
public void saveClones()
{
      // POINT 1
      xMatchedSignals.addElement((new Integer(p1MouseX))); // cyan/fuchsia dots
      yMatchedSignals.addElement((new Integer(p1MouseY)));
      signalCounter++;
      // POINT 2       
      xMatchedSignals.addElement((new Integer(p2MouseX)));
      yMatchedSignals.addElement((new Integer(p2MouseY)));
      signalCounter++;

      // save plate/well data (NB:  filter column is plate row; filter row is plate column)

      location = p1PlateString+"   "+p1Column+" "+p1RowString+" "+intensity;
      reportStrings.insertElementAt(location,stringCounter); // screen output

      // need 2nd vector because "tabs" have strange screen output:
      location = p1PlateString+"\t"+p1Column+"\t"+p1RowString+"\t"+intensity;
      outputStrings.insertElementAt(location,stringCounter++); // text area output
			
      drawPoint1=false; 	// once points have been saved,
      drawPoint2=false;		// clear cyan circles from 4x4 dup pattern

      shortPrint=false;		// need left column for spot data
      longPrint=false;		// need image area to hold image
      removeImage=false;	// keep the image on screen
      
      doNotSaveAgain=true;	// once points saved, do not save again
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
    longPrint=false;	// code reducer - assume long report not required
    shortPrint=false;	// code reducer - assume short report not required
    inPlateOrder=false;	// code reducer - assume in-plate-order report not required
  
    if ( whichReport.getSelectedItem().equals("Order Saved") )
    {
      shortPrint=true;	// print short report in left column
      // removeImage can be true/false
    }
    else if ( whichReport.getSelectedItem().equals("Plate Order") )
    {
      shortPrint=true;
      sortClones();
      inPlateOrder=true;	// print short in-plate-order report
      // removeImage can be true/false
    }
    else if ( whichReport.getSelectedItem().equals(">120, Saved") )
    {
      longPrint=true;	// print long report in image area
      removeImage=true;
    }
    else if ( whichReport.getSelectedItem().equals(">120, Plate") )
    {
      longPrint=true;
      removeImage=true;
      sortClones();
      inPlateOrder=true;	// print long in-plate-order report
    }
    else	// no report requested
    {
      removeImage=false;
    }
    
    if      ( whichFilter.getSelectedItem().equals(" 1 | 1-48")) { plateMultiplier = 0; }	// the 1st item selected by default
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
    else 
    {
      if ( whichFilter.getSelectedItem().equals("28 | 1297-1344")) { plateMultiplier = 27; }
    }
    
    if  ( whatIntensity.getSelectedItem().equals("No Rating")) { intensity = ""; } // default
    else if ( whatIntensity.getSelectedItem().equals("one.............."))   { intensity = "one"; }
    else if ( whatIntensity.getSelectedItem().equals("two.............."))   { intensity = "two"; }
    else if ( whatIntensity.getSelectedItem().equals("three............")) { intensity = "three"; }
    else if ( whatIntensity.getSelectedItem().equals("four............."))  { intensity = "four"; }
    else						       { intensity = "five"; }
      
    repaint();
  } // end itemStateChanged
//****************************************************************************    
  public void mouseClicked(MouseEvent me)
  {
    shortPrint=false;		// erase report in left column
    
    if ( cList[0].getState() || cList[1].getState() ) // ref pts
    {
      if ( cList[0].getState() ) // "Top Left" button selected
      {
        x1=me.getX() - ADJUSTMENT;  // choose point at mouse ptr tip
        y1=me.getY() - ADJUSTMENT;
      }
      else   			// "Lower Right" button selected
      {
        x2=me.getX() - ADJUSTMENT;
        y2=me.getY() - ADJUSTMENT;
      }
      
      if ( ((x2-x1) > 0) &&	// if both ref pts have been picked
           (x1 != 0)     &&	// and in correct relative orientation
           (x2 != 0) )
      {
        // x3=x2-x1 filter width, y3=y2-y1 filter height
        x3 = x2-x1;  		// calculate filter's screen dimensions
        y3 = y2-y1;
      }
    } 
    else			// "Pick Spot" button selected
    {
      mouseX=me.getX() - ADJUSTMENT;	// adj causes selected spot to 
      mouseY=me.getY() - ADJUSTMENT;	// display at mouse pointer tip

      calculateXY();		// calc spot's coordinates on filter
      calculatePlate();		// calc spot's plate number & well address
      
      // once mouse clicked after 2 points saved-->OK to enable "Save 2 Points" button
      doNotSaveAgain=false;

      if (me.isControlDown()) 	// control key held down
      {
        if (clonesMatch())	// public boolean clonesMatch()
        {
          saveClones();		// public void saveClones()
        }
      }
      else if (me.isMetaDown())	// if right button clicked,
      {				// record data for Point 2
        p2Position=position;
        p2MouseX=mouseX;
        p2MouseY=mouseY;
        p2X=realSpotX;
        p2Y=realSpotY;
        p2PlateNum=plateNum;
        p2RowNum=rowNum;
        
        // convert to strings and add leading zero(s) if appropriate
        // plate numbers        
        if      (p2PlateNum < 10)   { p2PlateString = "000"+String.valueOf(p2PlateNum); } 
        else if (p2PlateNum < 100)  { p2PlateString = "00"+String.valueOf(p2PlateNum); }
        else if (p2PlateNum < 1000) { p2PlateString = "0"+String.valueOf(p2PlateNum); }
        else                        { p2PlateString = String.valueOf(p2PlateNum); } 
        
        // row numbers
        if (p2RowNum < 10) { p2RowString = "0"+String.valueOf(p2RowNum); }	
        else               { p2RowString = String.valueOf(p2RowNum); }
        
        p2Column=column;
        p2FieldNum=fieldNum;
        drawPoint2=true;
        p2InXAisle=inXAisle;
        p2InYAisle=inYAisle;
        p2YAisle=yAisle;
        p2XAisle=xAisle;
      }
      else			// if left button clicked,
      { 			// record data for Point 1
        p1Position=position;
        p1MouseX=mouseX;
        p1MouseY=mouseY;
        p1X=realSpotX;
        p1Y=realSpotY;
        p1PlateNum=plateNum;
        p1RowNum=rowNum;

        // convert to strings and add leading zeros as appropriate
        // plate numbers        
             if (p1PlateNum < 10)   { p1PlateString = "000"+String.valueOf(p1PlateNum); } 
        else if (p1PlateNum < 100)  { p1PlateString = "00"+String.valueOf(p1PlateNum); }
        else if (p1PlateNum < 1000) { p1PlateString = "0"+String.valueOf(p1PlateNum); }
        else                        { p1PlateString = String.valueOf(p1PlateNum); } 
        
        // row numbers
        if (p1RowNum < 10) { p1RowString = "0"+String.valueOf(p1RowNum); }
        else		   { p1RowString = String.valueOf(p1RowNum); }
        
        p1Column=column;
        p1FieldNum=fieldNum;
        drawPoint1=true;
        p1InXAisle=inXAisle;
        p1InYAisle=inYAisle;
        p1YAisle=yAisle;
        p1XAisle=xAisle;
      } // end if Ctrl-key down or left click or right click

    } // end if radio button
    
    repaint();
  } // end mouseClicked
//****************************************************************************  
  public void mouseEntered(MouseEvent me) {} // empty implementation instead of
  public void mouseExited(MouseEvent me) {}  // using MouseAdapter class
  public void mousePressed(MouseEvent me) {}
  public void mouseReleased(MouseEvent me) {}
  public void mouseDragged(MouseEvent me) {}
  public void mouseMoved(MouseEvent me) {}
  
//****************************************************************************  
  public void actionPerformed(ActionEvent ae)
  {
    if (ae.getActionCommand().equals("Help"))
    {
      showHelp=true;
    }
    else if (ae.getActionCommand().equals("Refresh"))
    {
      x1=0; x2=0; y1=0; y2=0; x3=0; y3=0; 
      mouseX=0; p1MouseX=0; p2MouseX=0; 
      mouseY=0; p1MouseY=0; p2MouseY=0;
      spotX=0; spotY=0;
      
      xMultiplier=0; yMultiplier=0;
      spot_433_X=0; spot_432_Y=0;
      realSpotX=0; p1X=0; p2X=0;
      realSpotY=0; p1Y=0; p2Y=0;
      xSpot=0; ySpot=0;
         
      plateNum=0; p1PlateNum=0; p2PlateNum=0;
      p1PlateString=null; p2PlateString=null;
      rowNum=0; p1RowNum=0; p2RowNum=0;
      p1RowString=null; p2RowString=null;
      plateMultiplier=0;

//    colNum=' '; 
      colNum=0; 
      column='0'; p1Column='0'; p2Column='0';	// ' '->odd character in Netscape
      position=0; p1Position=0; p2Position=0;
      fieldNum=0; p1FieldNum=0; p2FieldNum=0;
      
      inPlateOrder=false;
      shortPrint=false; longPrint=false;
      removeImage=false;
      drawPoint1=false; drawPoint2=false;
      inXAisle=false; p1InXAisle=false; p2InXAisle=false;
      inYAisle=false; p1InYAisle=false; p2InYAisle=false;
      showHelp=false;
      xAisle=' '; p1XAisle=' '; p2XAisle=' ';
      yAisle=' '; p1YAisle=' '; p2YAisle=' ';
      
      xMatchedSignals.removeAllElements();
      yMatchedSignals.removeAllElements();
      reportStrings.removeAllElements();
      outputStrings.removeAllElements();
      reportByPlate.removeAllElements();
      outputByPlate.removeAllElements();
      stringCounter=0;
      signalCounter=0;
      
      t.setText("");
      whichReport.select("No Report");
      whichFilter.select(" 1 | 1-48");
      whatIntensity.select("No Rating");
      
//    imageName.setText("");  // (better just have user enter/change file name)
    }
    else if (ae.getActionCommand().equals("Save 2 Points"))
    {
      saveClones();		// public void saveClones()
    }
    else if (ae.getActionCommand().equals("Remove Image"))
    {
      removeImage=true;		// if, e.g., to print screen w/o image
    }
    else 
    {
      if (ae.getActionCommand().equals("Pick More Points"))
      {
        longPrint=false;	// take away reports
        shortPrint=false;
        removeImage=false;	// bring back image
        whichReport.select("No Report");
      }
    }
    
    repaint();
  } // end actionPerformed()

} // end class Hybsweeper
//*****************************************************************************	
//****************************************************************************  
class HybHelpFrame extends Frame 
{
  HybHelpFrame(String title)	// constructor
  {
    super(title);		// call Frame's constructor

    //create an object to handle window events
    HybWindowAdapter adapter = new HybWindowAdapter(this);

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
    g.drawString("Select third radio button and begin picking pairs of hybridization signals.",10,184); 
    g.drawString("Use right and left buttons on mouse (in any order) to select two spots in a pair.",10,196); 
    g.drawString("Hint:  use 4x4 duplication diagrams as an aid to clicking in right place.",10,208); 

    g.drawString("REFRESH:  Removes reference points and all saved plate/well locations.",10,228);

    g.drawString("SAVE 2 POINTS:",10,248); 
    g.drawString("When two spots \"match\" (have same position number), use \"Save 2 Points\" button to",10,260); 
    g.drawString("save plate number and well coordinates for that clone.",10,272); 
    g.drawString("Alternatively, you can Ctrl-click (either Ctrl-right-click or Ctrl-left-click anywhere)",10,284); 
    g.drawString("to save plate/well data.",10,296); 

    g.drawString("INTENSITY:",10,316);
    g.drawString("If needed, rate the intensity of the signal selected--scale is 1 to 5.",10,328);
    
    g.drawString("REPORT:",10,348); 
    g.drawString("When you have finished picking and saving points, use pop-up menu to select report:",10,360); 
    g.drawString("   - Order Saved:  Short report of plate/well locations in the order they were saved",10,372); 
    g.drawString("   - Plate Order:  Short report of plate/well locations ordered by plate number",10,384); 
    g.drawString("   - >120, Saved Order &",10,396); 
    g.drawString("   - >120, Plate Order:  Long report--if more than 120 clone pairs have been saved",10,408); 

    g.drawString("REMOVE IMAGE provides option of removing image from screen for the short reports.",10,428); 

    g.drawString("CUT & PASTE TO SAVE:",10,448); 
    g.drawString("Since applets cannot write to local files, you can save plate/well locations by cutting",10,460); 
    g.drawString("and pasting from this text area (highlight by clicking in front of first character,",10,472); 
    g.drawString("scrolling down, then Shift-clicking after last character).",10,484); 

    g.drawString("PICK MORE POINTS:",10,504); 
    g.drawString("To reload image and continue selecting any remaining hybridization signals.",10,516);
  }  // end paint
  
} // end class HybHelpFrame
//*****************************************************************************	
//****************************************************************************  
class HybWindowAdapter extends WindowAdapter // need this class so frame will close
{
  HybHelpFrame helpFrame;
  public HybWindowAdapter(HybHelpFrame helpFrame)
  {
    this.helpFrame = helpFrame;
  }
  public void windowClosing(WindowEvent we)
  {
    helpFrame.setVisible(false); // removes window from screen when closed
  }
} // end class HybWindowAdapter

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
