/*
DRAWING PROGRAM
 NATHAN FORSYTH
 */



PGraphics kb; //keyboard ui
PGraphics canvas; //canvas(where the paint stays) is stored on a seperate graphic so that pencil can follow.

int scroll; //wheteher mouse scrolls up or down
int currHue; //current hue
int currSat; //current saturation
int currBri; //current brightness

int brushView; //for toggling between different cursor styles
boolean mouseLeft; // checks to see if button is pressed for mouse UI
boolean mouseRight; // same as above
int mouseScroll; //checks to see if mouse is scrolled for UI

int brushSize; // tracks brush size
boolean brushShrink; // makes continuous brush shrinkage
boolean brushGrow; //makes continuous brush growth
boolean brushFlux; // makes brush grow and shrink to its maximums
boolean fluxMax; // checks to see if brush has hit maximum
boolean fluxMin; //checks to see if brush has hit minimum
float ranBrushSize; // assigns a random brush size

int leftWipe; // x value for when wipe is done to the left
int rightWipe; // x value for when wipe is done to the right
int upWipe; // y value for when wipe is done upward
int downWipe; // y value for when wipe is done downward
int wipeStroke; // changes wipe between white and black
int oppositeWipeStroke; // allows UI and other elements to have an opposite wipe stroke

boolean colourCycleForward; //toggles whether colour cycles forward
boolean colourCycleBackward; //toggles whether colour cycles backwards
float ranHue; //variable for random hues
boolean noHue; //boolean to track if the brush is currently white or black

String fileSaveName; // I would like the file to be named the combination of keys stroked, as a memory of button mashing for different effects
int numberOfTimesRenamed; //so it turns out windows has a limit of 250 some characters in file names so this is for a revised file naming system
int hideFace; //UI when saving an image
boolean faceHidden; //determinesif UI is hidden

int brushShape; // integer to determine shape of brush
float ranBrushShape; // for andom brush selection

int brushX; // assigns x value of the brush
int brushY; // assigns y value of the brush
int pbrushX; // assigns x value to anything tht would normally use pMouse (not including the pencil cursor)
int pbrushY; //assigns y value to anything that would normally use pmouse (not including the pencil cursor

boolean autoDraw; //tracks whether or not the computer should be drawing for itself
float autoDrawRan; // assigns value to be "randomly generated" for new x and y coordinates on autoDraw mode

boolean hideUI; // bool to determine if it hides keyboard UI
int keyOpacity; // allows keyboard to be more visible if user is having difficulty remembering key inputs
int activeKeyOpacity;
int keyTint; //tint of the keyboard
boolean firstKeyPress; // I want the UI to be hidden until the first key press, so this variable will only change once. I want the user to feel rewarded for their first discovery (after click and draw)

boolean mirror; // bool to determine if there should be a mirror on the x and the y axis
boolean mirrorX; // bool to determine if there should be a mirror on the x axis
boolean mirrorY; // bool to determine if there should be a mirror on the y axis

boolean invertColour; // bool to determine if canvas colour should be inverted
boolean posterizeColour; // bool to determine if canvas should be posterized
boolean blurColour; //bool to determine if canvas should be blurred
int effectCounter; //counts down so that effects don't last indefinetely otherwise it drops to 4fps
boolean effectPress; //prevents multiple presses of effects at once
boolean grayColour; //bool to determine if canvas should be greyscale
int opacityColour; //int of brush opacity

boolean bounce; //determines if the brush is bouncing or not
int xspeed;  // Speed of the shape
int yspeed;  // Speed of the shape
int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

float aRan; //random direction for a key interface 
int aX, aY; //position of a key interface
int activeCounter; //on the keyboard UI some keys light up only while being pressed, this int extends the visual cue so it can be perceived
//these determine if the key has been pressed the first time. if it has, it shows up on the UI
boolean aPress, bPress, cPress, dPress, ePress, fPress, gPress, hPress, iPress, jPress, kPress, lPress, mPress;
boolean nPress, oPress, pPress, qPress, rPress, sPress, tPress, uPress, vPress, wPress, xPress, yPress, zPress;

//these determine if the visual cue should be active for the keyboard UI
boolean aActive, bActive, cActive, dActive, eActive, fActive, gActive, hActive, iActive, jActive, kActive, lActive, mActive;
boolean nActive, oActive, pActive, qActive, rActive, sActive, tActive, uActive, vActive, wActive, xActive, yActive, zActive;


int zX, zY; //position of z key interface
int Xdir = 1;  //directions of the z key interface
int Ydir = 1;
// all of the rest of the variables control the ways keys look on the UI
boolean squigglePress, squiggleActive;
boolean onePress, twoPress, threePress, fourPress, fivePress, sixPress, sevenPress, eightPress, ninePress, zeroPress;
boolean oneActive, twoActive, threeActive, fourActive, fiveActive, sixActive, sevenActive, eightActive, nineActive, zeroActive;
int shrink;
boolean minusPress, minusActive;
int grow;
boolean plusPress, plusActive;
boolean backspacePress, backspaceActive;
boolean spacePress, spaceActive;
boolean tabPress, tabActive;
boolean shiftPress, shiftActive;
boolean ctrlPress, ctrlActive;
boolean upPress, upActive;
boolean downPress, downActive;
boolean leftPress, leftActive;
boolean rightPress, rightActive;
boolean sqrOPress, sqrOActive; //[
boolean sqrCPress, sqrCActive; //]
int backSlash;
boolean backMin;
boolean backMax;
boolean backslashPress, backslashActive;
boolean colonPress, colonActive;
boolean quotePress, quoteActive;
boolean enterPress, enterActive;
int commaHue;
boolean commaPress, commaActive;
int periodHue;
boolean periodPress, periodActive;
boolean questPress, questActive;


void setup () {
  fullScreen(1); //for me this makes it so I can have my code on one display and my program run on another, but if you only have one screen it uses the default display
  frameRate(60); //played around with framerate, left it at 60

  canvas = createGraphics(width, height);// sets where canvas is, same size as screen except for at bottom

  kb = createGraphics (1910, height/2); //sets width and height of UI

  colorMode(HSB); //makes the scrolling for hue
  currHue = 0; //sets HSB for variables
  currSat = 0;
  currBri = 359;

  brushView = 0; //sets mouse interface presets
  mouseScroll = -1;

  brushSize = 30; //sets brush presets
  brushShrink = false; //sets brush shrinking/growing variables as false to begin
  brushGrow = false;
  fluxMax = false;
  fluxMin = true;
  brushShape = 0;

  upWipe = 0; //sets "wipe" presets
  leftWipe = 0;
  rightWipe = width;
  downWipe = height;
  wipeStroke = 0;
  oppositeWipeStroke = 255;

  colourCycleForward = false; //sets colour prestes
  colourCycleBackward = false;
  noHue= true;

  fileSaveName = ""; //sets file save name presets
  numberOfTimesRenamed = 0;


  hideUI = true; //hides UI so it needs to be discovered
  keyTint = 100;
  firstKeyPress = false;


  opacityColour = 255; //opaque brush and no effects on the canvas graphic
  effectCounter = -1;

  xspeed = 20; //sets some of the specific key interfaces
  yspeed = 20;
  aX = 310;
  aY = 320;
  zX = 330;
  zY = 450;
  grow = 50;
  shrink = 50;
  backSlash = 50;
  backMin = true;
  backMax = false;
  commaHue = 0;
  periodHue = 0;
}

void draw() {

  if (faceHidden) { //if save button has been pressed, it checks the counter for how long things should be hidden (so the UI isn't in your saved drawing) and counts down each frame until its past 0, then it shows again
    if (hideFace < 0) {
      hideUI = false;
      brushView = 0;
      saveFrame(fileSaveName + ".jpg");
      faceHidden = false;
    } else {
      hideFace--;
    }
  }

  if (keyPressed == true) { //if a key has been pressed, show the UI and acknowledge a key has activated the UI through two booleans
    if (!firstKeyPress) {
      firstKeyPress = true;
      hideUI = false;
    }
  }


  noCursor(); //hides the cursor, use the pencil brush or mouse interface


  pbrushX = brushX; //assigns a pseudo pmouse and mouse value for the autodraw and bounce draw functions, otherwise uses the mouse coordinates
  pbrushY = brushY;
  if (!autoDraw && !bounce) { //
    brushX = mouseX;
    brushY = mouseY;
    aActive = false;
  }

  if (autoDraw) { //assigns new random X and Y values while AutoDraw is active
    aActive = true;
    autoDrawRan = random(-xspeed, xspeed);
    brushX = brushX + int(autoDrawRan);
    if (brushX > width) { //prevents brush from going off screen
      brushX = width - xspeed;
    }
    if (brushX < 0) {
      brushX = xspeed;
    }
    autoDrawRan = random(-xspeed, xspeed);
    brushY = brushY + int(autoDrawRan);
    if (brushY > height) { //prevents brush from going off screen
      brushY = height - xspeed;
    }
    if (brushY < 0) {
      brushY = xspeed;
    }
  }

  if (bounce) {

    // Update the position of the shape https://processing.org/examples/bounce.html
    brushX = brushX + ( xspeed * xdirection );
    brushY = brushY + ( yspeed * ydirection );

    // Test to see if the shape exceeds the boundaries of the screen
    // If it does, reverse its direction by multiplying by -1
    if (brushX > width-brushSize/2 || brushX < brushSize/2) {
      xdirection *= -1;
    }
    if (brushY > height-brushSize/2 || brushY < brushSize/2) {
      ydirection *= -1;
    }
  }

  /////////////////////////////////////////////KEYBOARD GRAPHIC//////////////////////////////////
  kb.beginDraw();
  keyBoard(); // I made a function for the keyboard UI cause i kept getting lost in the draw function
  kb.endDraw();


  //////////////////////////////////////////CANVAS GRAPHIC///////////////////////////
  canvas.beginDraw(); //this graphic is where the drawing actually is made

  automaticDraw(); //calls auto draw
  bounceDraw(); //calls bounce draw

  if (mousePressed) {
    deactivateDraw(); //deactivates the auo drawers if the mouse is pressed at all
    if (mouseButton == RIGHT) { //right click calls the erase functions of different brush shapes determined by brush shape int
      autoDraw = false;
      aActive = false;
      bounce = false;
      mouseRight = true;

      if (brushShape == 0 || brushShape == 4) {
        eraseLine();
      }

      //square shape brush
      if (brushShape == 1 || brushShape == 5) {
        eraseSquare();
      }

      //v shape brush
      if (brushShape == 3 || brushShape == 7) {
        eraseV();
      }

      //triangle shaped brush
      if (brushShape == 2 || brushShape ==6) {
        eraseTriangle();
      }
    }

    if (mouseButton == LEFT) { //left click calls the drawing functions of different shapes determined by brushShape int
      mouseLeft = true;
      bounce = false;
      autoDraw = false;
      aActive = false;

      //line shape (circle brush)
      if (brushShape == 0) {
        drawLine();
      }

      //square shape brush
      if (brushShape == 1) {
        drawSquare();
      }

      //v shape brush
      if (brushShape == 3) {
        drawV();
      }

      //triangle shaped brush
      if (brushShape == 2) {
        drawTriangle();
      }
      //"o" shape brush
      if (brushShape == 4) {
        drawO();
      }

      //box shape brush
      if (brushShape == 5) {
        drawBox();
      }

      //hollow triangle shaped brush
      if (brushShape == 6) {
        drawHollowTriangle();
      }
      //v hollow shape brush
      if (brushShape == 7) {
        drawHollowV();
      }
    }
  }

  //wipes
  canvas.stroke(wipeStroke); //wipe line colour
  canvas.strokeWeight(126); //wipe line weight needs to be 126 so not choppy
  canvas.line(0, upWipe, width, upWipe); // up line being drawn - see line 479-483 to see incraments of the wipes constantly being drawn
  canvas.line(0, downWipe, width, downWipe);//down line being drawn
  canvas.line(leftWipe, 0, leftWipe, height);//left line being drawn
  canvas.line(rightWipe, 0, rightWipe, height);//right line being drawn
  canvas.noFill(); //sets the canvas border so you know what colour your brush is at all times
  canvas.rectMode(CENTER);
  canvas.colorMode(HSB);
  canvas.stroke(currHue, currSat, currBri);
  canvas.strokeWeight(50);
  canvas.rect(width/2, height/2, width, height);

  canvas.endDraw();

  /////////////////////////////////////////////background layer/////////////////////////////////////////////
  background(0); //erases the cursor UI




  /////////////////////////////////////////////////layer that graphic is placed////////////////////////////////////////
  imageMode(CENTER);
  noTint();
  image(canvas, width/2, height/2); //draws the canvas onto the program

  if (grayColour) { //sets the filters for when you want to save a stylized image
    filter(GRAY);
  }
  if (blurColour) {
    filter(BLUR, 5);
  }
  if (invertColour) {
    filter(INVERT);
  }
  if (posterizeColour) {
    filter(POSTERIZE, 2);
  }
  if (!hideUI) { //only draws the keyboard graphic if the UI is not supposed to be hidden
    tint(255, keyTint);
    image(kb, width/2, 2 * height/3);
  }
  //////////////////ANYTHING THAT NEEDS TO SHOW PUT BELOW THIS LINE////////////////////////////////////////////////

  ///////////////////////////////////////////////////////square to show colour///////////////////////////////////////////////////////
  /* MOVED TO CANVAS GRAPHIC
   noFill();
   rectMode(CENTER);
   stroke(currHue, currSat, currBri);
   strokeWeight(50);
   rect(width/2, height/2, width, height);
   */
  /////////////////////////////////////brush UI//////////////////////////////////////////////////////////////
  if (brushView == 1 || brushView == 2) { //toggles between different integers to change how the cursor looks between a mouse, a pencil, or the shape of the brush. Some are functions because draw is so cluttered
    pencilCursor();
  }

  if (brushView == 2 || brushView == 3) {
    noFill();
    strokeWeight(2);
    rectMode(CENTER);
    stroke(oppositeWipeStroke);
    if (brushShape == 0 || brushShape == 4) {
      ellipse(brushX, brushY, brushSize + 1, brushSize + 1);
    }
    if (brushShape == 1 || brushShape == 5) {
      rect(brushX, brushY, brushSize + 1, brushSize + 1);
    }
    if (brushShape == 2 || brushShape == 6) {
      triangle(brushX, brushY - brushSize/2, brushX + brushSize/2, brushY + brushSize/3, brushX - brushSize/2, brushY + brushSize/3);
    }
    if (brushShape == 3 || brushShape == 7) {
      triangle(brushX, brushY + brushSize/2, brushX + brushSize/2, brushY - brushSize/3, brushX - brushSize/2, brushY - brushSize/3);
    }
  }

  if (brushView == 0) {

    //pencilCursor();
    mouseCursor();
  }

  ///////////////////////////////////////////////VARIABLE INTERACTIONS//////////////////////////////////////////////
  //everything below this line is a little bit of a mess because I was just trying to get things in working order in time, but it does work and I'm happy.
  if (brushGrow) { //incrament to grow brush with a maximum of 900 pixel radius
    brushSize = brushSize + 10;
    if (brushSize > 900) {
      brushSize = 900;
    }
  }

  if (brushShrink) { //incrament to shrink brush with a minimum 0 pixel radius
    brushSize = brushSize - 10;
    if (brushSize < 0) {
      brushSize = 0;
    }
  }

  if (brushFlux) { //so this bunch of code is wierd cause I had to make a whole bunch of bool statements
    if (!fluxMax) { //checks to see if the brush is set to max
      brushSize = brushSize + 10; //increases brush by 10
      if (brushSize >= 1010) { //checks to see if brush should be set to max, if it is, it moves along
        fluxMax = true; //sets max and min respectively
        fluxMin = false;
      }
    }
    if (!fluxMin) { //checks to see if brush is set to min
      brushSize = brushSize - 10; //decreases brush by 10
      if (brushSize <= 10) { //checks to see if brush should be set to max
        fluxMax = false;// sets max and min respectively
        fluxMin = true;
      }
    }
  }

  if (colourCycleBackward) {
    currHue = currHue - 5; //changes value of current hue continuously
    if (currHue > 255) { //if statements are here to loop the values so they remain in the hue range
      currHue = 0;
    }
    if (currHue < 0) {
      currHue = 255;
    }
  }

  if (colourCycleForward) {
    currHue = currHue + 5; //changes value of current hue continuously
    if (currHue > 255) { //if statements are here to loop the values so they remain in the hue range
      currHue = 0;
    }
    if (currHue < 0) {
      currHue = 255;
    }
  }

  leftWipe = leftWipe - 125; //incramentally wipes the screen
  rightWipe = rightWipe + 125;
  upWipe = upWipe - 125;
  downWipe = downWipe + 125;

  if (fileSaveName.length() > 240) { //prevents file name from getting too long which happens if you hold down keys very quickly or press a lot of keys
    numberOfTimesRenamed++;
    fileSaveName = "SHORTENED_" + numberOfTimesRenamed + "_TIMES";
  }

  if (effectCounter > 0) { //depending on where the counter is for the effects it will either hide the UI, save the frame, or cancel the effect and show the UI again
    effectCounter--;
    //blurColour = true;
    brushView = 5;
    hideUI = true;
  } 
  if (effectCounter == 0) {
    saveFrame(fileSaveName + ".jpg");
    effectCounter--;
    brushView = 0;
    hideUI = false;
  }
  if (effectCounter < 0) {
    blurColour = false;
    posterizeColour = false;
    grayColour = false;
    invertColour = false;
    effectPress = false;
  }

  mouseScroll--; //prevents the scroller on the mouse UI from staying "active" forever and counts it down each frame

  grow = grow + 3;  //sets ints for the size of the brush on the keyboard UI of the plus and minus keys, and resets them after 60 frames (once per second)
  if (grow > 80) {
    grow = 20;
  }
  shrink = shrink - 3;
  if (shrink < 20) {
    shrink = 80;
  }

  if (!backMax) { //checks to see if the brush is set to max
    backSlash = backSlash + 3; //increases brush by 3
    if (backSlash >= 80) { //checks to see if brush should be set to max, if it is, it moves along
      backMax = true; //sets max and min respectively
      backMin = false;
    }
  }
  if (!backMin) { //checks to see if brush is set to min
    backSlash = backSlash - 3; //decreases brush by 3
    if (backSlash <= 20) { //checks to see if brush should be set to max
      backMax = false;// sets max and min respectively
      backMin = true;
    }
  }

  aRan = random(-5, 5); //sets the position of the little circle on a by moving it up to 5 pixels, then it resets it if it would leave the boundary. does both x and y.
  aX = aX + int(aRan);
  if (aX > 355) {
    aX = 355 - 5;
  }
  if (aX < 265) {
    aX = 265 + 5;
  }
  aRan = random(-5, 5);
  aY = aY + int(aRan);
  if (aY > 365) {
    aY = 365 - 5;
  }
  if (aY < 275) {
    aY = 275 + 5;
  }
  // Update the position of the circle in the z key https://processing.org/examples/bounce.html
  zX = zX + ( 4 * Xdir );
  zY = zY + ( 3 * Ydir );

  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (zX > 375 || zX < 285 ) {
    Xdir *= -1;
  }
  if (zY > 495 || zY < 405) {
    Ydir *= -1;
  }

  commaHue = commaHue - 5; //makes the triangles in the comma and period keys cycle through hues
  if (commaHue < 0) {
    commaHue = 255;
  }
  periodHue = periodHue + 5;
  if (periodHue > 255) {
    periodHue = 0;
  }


  deactivateSP(); //makes sure all single press keys don't stay "active" forever in UI
}

///////////////////////////////////////////////////////END OF DRAW////////////////////////////////////////////////////////////////////
void mouseWheel(MouseEvent event) {
  deactivateColAn(); //deactivates keyboard ui for , and .
  //changes colour of current hue
  if (noHue) {
    currSat = 359;
    currBri = 359;
    colourCycleBackward = false; //stops colour from cycling if it was cycling
    colourCycleForward = false;
    noHue = false; //gives brush colour
  }
  scroll = event.getCount(); //retreieves input from wheel on mouse
  println(scroll); //lets me see if it registers a scroll
  currHue = currHue + (scroll*5); //changes value of current hue
  println(currHue); //lets me see if scroll was added to the hue
  if (currHue > 255) { //if statements are here to loop the values so they remain in the hue range
    currHue = 0;
  }
  if (currHue < 0) {
    currHue = 255;
  }
  colourCycleForward = false;
  colourCycleBackward = false;
  mouseScroll = 3; //shows that the mouse is being scrolled on mouse UI by putting counter above 0, changing the color
}


void keyPressed() { //all key presses interact with a lot of booleans and integers but they work. Most of it honestly is just contolling the keyboard UI
  //////////////////////////COLOUR ADJUSTMENTS//////////////////////////////////////////
  if (key == 'c' || key == 'C') {//sets saturation to 359, brush is now a bright colour again
    deactivateColour();
    cPress = true;
    cActive = true;
    currSat = 359;
    currBri = 359;
    colourCycleBackward = false;
    colourCycleForward = false;
    noHue = false;
    fileSaveName = fileSaveName + "c";
    println(currSat);
    //}
  }
  if (key == 'w' || key == 'W') {//sets saturation to 0, brush is now white
    deactivateColour();
    wPress = true;
    wActive = true;
    currSat = 0;
    currBri = 359;
    noHue = true;
    if (wipeStroke == 255) {
      currBri = 0;
    }
    fileSaveName = fileSaveName + "w";
    println(currSat);
  }
  if (key == 'u' || key == 'U') {//sets saturation to 100 and brightness to 100, brush is now ugly
    deactivateColour();
    uPress = true;
    uActive = true;
    currSat = 100;
    currBri = 150;
    noHue = false;
    fileSaveName = fileSaveName + "u";
    println(currSat);
  }
  if (key == 'd' || key == 'D') {//sets brightness to 30, brush is now dark
    deactivateColour();
    dPress = true;
    dActive = true;
    currSat = 359;
    currBri = 75;
    noHue = false;
    fileSaveName = fileSaveName + "d";
    println(currSat);
  }
  if (key == 'l' || key == 'L') {//sets saturation to 30 and brightness to 359 making brush light
    deactivateColour();
    lPress = true;
    lActive = true;
    currSat = 50;
    currBri = 359;
    noHue = false;
    fileSaveName = fileSaveName + "l";
    println(currSat);
  }


  /////////////////////////////////////BRUSH SIZE ADJUSTMENTS//////////////////////////////////
  if (key == '1'|| key == '!') {//brushSize to 1
    deactivateBZ();
    oneActive = true;
    onePress = true;
    brushSize = 10;
    brushShrink = false;
    brushGrow = false;
    brushFlux = false;
    fileSaveName = fileSaveName + "1";
  }
  if (key == '2'|| key == '@') {//brushSize to 2
    deactivateBZ();
    twoActive = true;
    twoPress = true;
    brushSize = 20;
    brushShrink = false;
    brushGrow = false;
    brushFlux = false;
    fileSaveName = fileSaveName + "2";
  }
  if (key == '3' || key == '#') {//brushSize to 3
    deactivateBZ();
    threeActive = true;
    threePress = true;
    brushSize = 30;
    brushShrink = false;
    brushGrow = false;
    brushFlux = false;
    fileSaveName = fileSaveName + "3";
  }
  if (key == '4' || key == '$') {//brushSize to 4
    deactivateBZ();
    fourActive = true;
    fourPress = true;
    brushSize = 40;
    brushShrink = false;
    brushGrow = false;
    fileSaveName = fileSaveName + "4";
  }
  if (key == '5' || key == '^') {//brushSize to 5
    deactivateBZ();
    fiveActive = true;
    fivePress = true;
    brushSize = 50;
    brushShrink = false;
    brushGrow = false;
    brushFlux = false;
    fileSaveName = fileSaveName + "5";
  }
  if (key == '6') {//brushSize to 6
    deactivateBZ();
    sixActive = true;
    sixPress = true;
    brushSize = 60;
    brushShrink = false;
    brushGrow = false;
    brushFlux = false;
    fileSaveName = fileSaveName + "6";
  }
  if (key == '7' || key == '&') {//brushSize to 7
    deactivateBZ();
    sevenActive = true;
    sevenPress = true;
    brushSize = 70;
    brushShrink = false;
    brushGrow = false;
    brushFlux = false;
    fileSaveName = fileSaveName + "7";
  }
  if (key == '8' || key == '*') {//brushSize to 8
    deactivateBZ();
    eightActive = true;
    eightPress = true;
    brushSize = 80;
    brushShrink = false;
    brushGrow = false;
    brushFlux = false;
    fileSaveName = fileSaveName + "8";
  }
  if (key == '9' || key == '(') {//brushSize to 9
    deactivateBZ();
    nineActive = true;
    ninePress = true;
    brushSize = 90;
    brushShrink = false;
    brushGrow = false;
    brushFlux = false;
    fileSaveName = fileSaveName + "9";
  }
  if (key == '0' || key == ')') {//brushSize to 0
    deactivateBZ();
    zeroActive = true;
    zeroPress = true;
    brushSize = 3;
    brushShrink = false;
    brushGrow = false;
    brushFlux = false;
    fileSaveName = fileSaveName + "0";
  }



  if (key == '[' || key == '{') {//brushSize goes down by 3
    deactivateSetBZ();
    sqrOPress = true;
    sqrOActive = true;
    activeCounter = 5;
    brushSize = brushSize - 10;
    brushShrink = false;
    brushGrow = false;
    brushFlux = false;
    if (brushSize <= 10) {
      brushSize = 1;
    }
    fileSaveName = fileSaveName + "SHRINK";
  }
  if (key == ']' || key == '}') {//brushSize goes up by 3
    deactivateSetBZ();
    sqrCPress = true;
    sqrCActive = true;
    activeCounter = 5;
    brushSize = brushSize + 10;
    brushShrink = false;
    brushGrow = false;
    brushFlux = false;
    fileSaveName = fileSaveName + "GROW";
  }

  /////////////////////////////////////////BRUSH SHAPES//////////////////////////////////////////////
  if (key == 'r' || key == 'R') {//brush goes back  to regular brush shape (line) by toggling the brushShape int
    deactivateBS();
    rActive = true;
    rPress = true;
    brushShape = 0;
    fileSaveName = fileSaveName + "r";
  }
  if (key == 'q' || key == 'Q') {//brush goes back  to square brush shape
    deactivateBS();
    qActive = true;
    qPress = true;
    brushShape = 1;
    fileSaveName = fileSaveName + "q";
  }
  if (key == 't' || key == 'T') {//brush goes back  to triangle brush shape
    deactivateBS();
    tActive = true;
    tPress = true;
    brushShape = 2;
    fileSaveName = fileSaveName + "t";
  }
  if (key == 'v' || key == 'V') {//brush goes back  to upsidedown triangle shape
    deactivateBS();
    vActive = true;
    vPress = true;
    brushShape = 3;
    fileSaveName = fileSaveName + "v";
  }
  if (key == 'o' || key == 'O') {//brush goes back  to regular o shape
    deactivateBS();
    oActive = true;
    oPress = true;
    brushShape = 4;
    fileSaveName = fileSaveName + "o";
  }
  if (key == 'h' || key == 'H') {//brush goes to hollow box shape
    deactivateBS();
    hActive = true;
    hPress = true;
    brushShape = 5;
    fileSaveName = fileSaveName + "h";
  }
  if (key == 'j' || key == 'J') {//brush goes to hollow triangle shape
    deactivateBS();
    jActive = true;
    jPress = true;
    brushShape = 6;
    fileSaveName = fileSaveName + "j";
  }

  if (key == 'k' || key == 'K') {//brush goes to hollow v shape
    deactivateBS();
    kActive = true;
    kPress = true;
    brushShape = 7;
    fileSaveName = fileSaveName + "k";
  }

  ////////////////////////////////////////////auto settings//////////////////////////////////////////
  if (key == 'a' || key == 'A') {//brushX and brushY values will be randomly generated
    deactivateDraw();
    aPress = true;
    aActive = true;
    autoDraw = true;
    bounce = false;
    fileSaveName = fileSaveName + "a";
  }
  if (key == 'z' || key == 'Z') {//brushX and brushY values will be algorithmically generated
    deactivateDraw();
    zPress = true;
    zActive = true;
    bounce = true;
    autoDraw = false;
    fileSaveName = fileSaveName + "z";
  }
  if (key == 's' || key == 'S') { //decreases speed of autodrawers by decreasing xspeed
    sPress = true;
    sActive = true;
    activeCounter = 5;
    xspeed = xspeed - 20;
    fileSaveName = fileSaveName + "s";
  }
  if (key == 'f' || key == 'F') { //increases speed of autodrawers
    fPress = true;
    fActive = true;
    activeCounter = 5;
    xspeed = xspeed + 20;
    fileSaveName = fileSaveName + "s";
  }
  if (key == '-' || key == '_') {//brush size goes down by 10 (although I may have changed it) contiuously to a minumum of 0
    deactivateBZ();
    minusActive = true;
    minusPress = true;
    brushShrink = true;
    brushGrow = false;
    brushFlux = false;
    fileSaveName = fileSaveName + "MINUS";
  }
  if (key == '='|| key == '+') {//brush size goes down by 3 continuously to a maximum of 300
    deactivateBZ();
    plusActive = true;
    plusPress = true;
    brushShrink = false;
    brushGrow = true;
    brushFlux = false;
    fileSaveName = fileSaveName + "PLUS";
  }
  if (key == '\\' || key == '|') {//brush size goes down by 3 continuously to a maximum of 300
    deactivateBZ();
    backslashActive = true;
    backslashPress = true;
    brushShrink = false;
    brushGrow = false;
    brushFlux = true;
    fileSaveName = fileSaveName + "FLUX";
  }
  if (key == ',' || key == '<') {//colour cycles backwards, acts as toggle for variable
    deactivateColAn();
    commaActive = true;
    commaPress = true;
    noHue = false;
    if (colourCycleBackward) { //prevents colour from cycling forward and backwards at the same time, causing them to freeze
      colourCycleBackward = false;
    } else {
      colourCycleBackward = true;
      colourCycleForward = false;
    }
    println(colourCycleBackward); //easy bool test
    fileSaveName = fileSaveName + "BACKWARD";
  }
  if (key == '.' || key == '>') {//colour cycles forwards, acts as toggle for variable
    deactivateColAn();
    periodActive = true;
    periodPress = true;
    noHue = false;
    if (colourCycleForward) {
      colourCycleForward = false;
    } else {
      colourCycleForward = true;
      colourCycleBackward = false;
    }
    println(colourCycleForward); //easy bool test
    fileSaveName = fileSaveName + "FORWARD";
  }
  //////////////////////////////////////////mirror settings/////////////////////////////////////////////////
  if (key == 'm' || key == 'M') {//brush will mirror on the x and y axis through booleans
    deactivateMirror();
    mActive = true;
    mPress = true;
    mirror = true;
    mirrorX = false;
    mirrorY = false;
    fileSaveName = fileSaveName + "m";
  }
  if (key == 'x' || key == 'X') {//brush will mirror on the x axis
    deactivateMirror();
    xActive = true;
    xPress = true;
    mirrorX = true;
    mirror = false;
    mirrorY = false;
    fileSaveName = fileSaveName + "x";
  }
  if (key == 'y' || key == 'Y') {//brush will mirror on the y axis
    deactivateMirror();
    yActive = true;
    yPress = true;
    mirrorY = true;
    mirrorX = false;
    mirror = false;
    fileSaveName = fileSaveName + "y";
  }
  if (key == 'n' || key == 'N') {//brush will mirror on the y axis
    deactivateMirror();
    nActive = true;
    nPress = true;
    mirrorY = false;
    mirrorX = false;
    mirror = false;
    fileSaveName = fileSaveName + "n";
  }


  //////////////////////////////////////////////////////random settings/////////////////////////////////////////////////////////////

  if (key == '/' || key == '?') {//brushShape, hue, and brush size are randomly selected by randomly setting the integers for those toggles
    deactivateBZ();
    deactivateBS();
    questPress= true;
    questActive = true;
    activeCounter = 5;
    ranBrushShape = random(0, 8);
    brushShape = int(ranBrushShape);
    brushShrink = false;
    brushGrow = false;
    println(brushShape);
    ranBrushSize = random(0, 10);
    brushSize = 50 + 100 * int(ranBrushSize);
    brushShrink = false;
    brushGrow = false;
    brushFlux = false;
    noHue = false;
    currSat = 359;
    ranHue = random(0, 255);
    currHue = int(ranHue);
    colourCycleBackward = false;
    colourCycleForward = false;
    fileSaveName = fileSaveName + "MYSTERY";
  }

  if (key == ';' || key == ':') {//brushShape is randomly selected
    deactivateBS();
    colonPress = true;
    colonActive = true;
    activeCounter = 5;
    ranBrushShape = random(0, 8);
    brushShape = int(ranBrushShape);
    brushShrink = false;
    brushGrow = false;
    println(brushShape);
    fileSaveName = fileSaveName + "MYSTERY_SHAPE";
  }

  if (key == '\'' || key == '"') {//brush size is randomly selected
    deactivateBZ();
    quotePress = true;
    quoteActive = true;
    activeCounter = 5;
    ranBrushSize = random(0, 10);
    brushSize = 50 + 100 * int(ranBrushSize);
    brushShrink = false;
    brushGrow = false;
    brushFlux = false;
    fileSaveName = fileSaveName + "MYSTERY_SIZE";
  }
  if ( key == ENTER || key == RETURN) { //selects a random colour for the paintbrush
    enterPress = true;
    enterActive = true;
    activeCounter = 5;
    noHue = false;
    currSat = 359;
    ranHue = random(0, 255);
    currHue = int(ranHue);
    colourCycleBackward = false;
    colourCycleForward = false;
    fileSaveName = fileSaveName + "MYSTERY_COLOUR";
  }
  ////////////////////////////////////////////////////////////////////effects///////////////////////////////////////////////////////////////////////

  if (key == 'e' || key == 'E') {//reduces brush opacity when pressed
    ePress = true;
    eActive = true;
    activeCounter = 5;
    opacityColour = opacityColour - 51;
    if (opacityColour == 0) { //resets if brush is equal to 0
      opacityColour = 255;
    }
    fileSaveName = fileSaveName + "e";
  }

  if (key == 'i' || key == 'I') { //so this works the same for i, p, g, and b. If one of those keys is pressed, effectPress = true, so that effects cant be stacked or extended. Then depending on how hard it is on processing, it sets a counter to deactivate itself
    iPress = true;
    if (!effectPress) {
      iActive = true;
      activeCounter = 5;
      fileSaveName = fileSaveName + "i";
      effectPress = true;
      invertColour = true;
      if (effectCounter < 0) {
        effectCounter = 10;
      }
    }
  }
  if (key == 'p' || key == 'P') {
    pPress = true;
    if (!effectPress) {
      pActive = true;
      activeCounter = 5;
      fileSaveName = fileSaveName + "p";
      effectPress = true;
      posterizeColour = true;
      if (effectCounter < 0) {
        effectCounter = 10;
      }
    }
  }

  if (key == 'g' || key == 'G') {
    gPress = true;
    if (!effectPress) {
      gActive = true;
      activeCounter = 5;
      fileSaveName = fileSaveName + "g";
      effectPress = true;
      grayColour = true;
      if (effectCounter < 0) {
        effectCounter = 10;
      }
    }
  }

  if (key == 'b' || key == 'B') {
    bPress = true;
    bActive = true;
    activeCounter = 5;
    if (!effectPress) {
      fileSaveName = fileSaveName + "b";
      effectPress = true;
      blurColour = true;
      if (effectCounter < 0) {
        effectCounter = 3;
      }
    }
  }

  if (key == CODED) { //calls keyboard check of arrow keys/shift/control

    ///////////////////////////////////////////////////////////////////UI Showing//////////////////////////////////////////////////////////////
    if (keyCode == CONTROL) { //pretty straight forward Boolean toggle for showing UI
      ctrlPress = true;
      fileSaveName = fileSaveName + "CONTROL";
      if (hideUI) {
        hideUI = false;
      } else {
        hideUI = true;
      }
    }
  }

  if ( key == TAB) { //toggles through the cursor views. If it exceeds 3, it resets to the default cursor
    tabPress = true;
    tabActive = true;
    activeCounter = 5;
    fileSaveName = fileSaveName + "TAB";
    brushView++;
    if (brushView > 3) {
      brushView = 0;
    }
  }

  if (key == '`' || key == '~') { //changes the opacity of the UI so that the icons can be seen clearer OR so the artwork beneath can be seen. Biggest design flaw: all my play testers hit escape.
    squigglePress = true;
    fileSaveName = fileSaveName + "SQUIGGLE";
    if (keyOpacity == 0) {
      squiggleActive = true;
      keyOpacity = 255;
      activeKeyOpacity = 255;
      keyTint = 255;
    } else {
      keyOpacity = 0;
      activeKeyOpacity = 75;
      keyTint = 100;
      squiggleActive = false;
    }
  }

  ////////////////////////////////////////////RESET TOOLS////////////////////////////////////////////////////////
  if ( key == ' ') { //anything that has a continuously changing value is paused
    spacePress = true;
    spaceActive = true;
    activeCounter = 5;
    autoDraw = false;
    bounce = false;
    brushShrink = false;
    brushGrow = false;
    brushFlux = false;
    colourCycleForward = false;
    colourCycleBackward = false;
    deactivateColAn();
    minusActive = false;
    plusActive = false;
    backslashActive = false;
    deactivateDraw();
    fileSaveName = fileSaveName + "SPACE";
  }

  if (key == BACKSPACE || key == DELETE) { // hard reset on the image by sending it to -1 frame, got this idea from https://forum.processing.org/two/discussion/25970/restart - jeremydouglass
    backspacePress = true; 
    backspaceActive = true;
    deactivateAll();
    activeCounter = 5;
    frameCount = -1;
    fileSaveName = fileSaveName + "BACKSPACE";
  }

  /////////////////////////////////////////WIPES/////////////////////////////////////////////////////////

  if (key == CODED) { //stylized erases that inverse the background colour and then go in a direction through drawing a new stroke every frame. 
    if (keyCode == UP) {
      upPress = true;
      upActive = true;
      activeCounter = 5;
      fileSaveName = fileSaveName + "UP";
      upWipe = height; //sets wipe to opposite end it needs to travel from
      if (wipeStroke == 255) { //inverses the stroke, a lot of other pieces of code use these values and variables to stand out from the background
        wipeStroke = 0;
        oppositeWipeStroke = 255;
        if (noHue) {
          currSat = 0;
          currBri = 359;
        }
      } else {
        wipeStroke = 255;
        oppositeWipeStroke = 0;
        if (noHue) {
          currSat = 0;
          currBri = 0;
        }
      }
    }
    if (keyCode == DOWN) {
      downPress = true;
      downActive = true;
      activeCounter = 5;
      fileSaveName = fileSaveName + "DOWN";
      downWipe = 0;
      if (wipeStroke == 255) {
        wipeStroke = 0;
        oppositeWipeStroke = 255;
        if (noHue) {
          currSat = 0;
          currBri = 359;
        }
      } else {
        wipeStroke = 255;
        oppositeWipeStroke = 0;
        if (noHue) {
          currSat = 0;
          currBri = 0;
        }
      }
    }
    if (keyCode == LEFT) {
      leftPress = true;
      leftActive = true;
      activeCounter = 5;
      fileSaveName = fileSaveName + "LEFT";
      leftWipe = width;
      if (wipeStroke == 255) {
        wipeStroke = 0;
        oppositeWipeStroke = 255;
        if (noHue) {
          currSat = 0;
          currBri = 359;
        }
      } else {
        wipeStroke = 255;
        oppositeWipeStroke = 0;
        if (noHue) {
          currSat = 0;
          currBri = 0;
        }
      }
    }
    if (keyCode == RIGHT) {
      rightPress = true;
      rightActive = true;
      activeCounter = 5;
      fileSaveName = fileSaveName + "RIGHT";
      rightWipe = 0;
      if (wipeStroke == 255) {
        wipeStroke = 0;
        oppositeWipeStroke = 255;
        if (noHue) {
          currSat = 0;
          currBri = 359;
        }
      } else {
        wipeStroke = 255;
        oppositeWipeStroke = 0;
        if (noHue) {
          currSat = 0;
          currBri = 0;
        }
      }
    }
    if (keyCode == SHIFT) {
      shiftActive = true;
      activeCounter = 5;
      shiftPress = true;
      hideUI = true;
      brushView = 5;
      hideFace = 2;
      faceHidden = true;
      fileSaveName = fileSaveName + "SHIFT";
      //saveFrame(fileSaveName + ".jpg");
      println(fileSaveName);
    }
  }
}

//so all of these function almost the same but with different shapes until line 1510
void drawLine() { //function for drawing ______
  deactivateBS(); //resets keyboard UI for shape
  rActive = true; //sets self as shape on keyboard UI
  canvas.colorMode(HSB); //need to set color mode for graphic seperately
  canvas.stroke(currHue, currSat, currBri, opacityColour);//retreives variables for brush colour
  canvas.strokeWeight(brushSize); //sets stroke weight for brush
  canvas.line(pbrushX, pbrushY, brushX, brushY); //uses "brush" instead of mouse so it can AutoDraw
  if (mirror || mirrorY) { //checks mirror function to see if it should be drawing any duplicates across an axis
    canvas.line(width - pbrushX, pbrushY, width - brushX, brushY);
  }
  if (mirror || mirrorX) {
    canvas.line(pbrushX, height - pbrushY, brushX, height - brushY);
  }
  if (mirror) {
    canvas.line(width - pbrushX, height - pbrushY, width - brushX, height - brushY);
  }
}

void eraseLine() {//same as above but it sets the colour to be the same as the background so it feels like an eraser
  deactivateBS();
  rActive = true;
  //canvas.colorMode(HSB); //need to set color mode for graphic seperately
  canvas.stroke(wipeStroke, opacityColour);//retreives variables
  canvas.strokeWeight(brushSize); //sets stroke weight
  canvas.line(pbrushX, pbrushY, brushX, brushY);
  if (mirror || mirrorY) {
    canvas.line(width - pbrushX, pbrushY, width - brushX, brushY);
  }
  if (mirror || mirrorX) {
    canvas.line(pbrushX, height - pbrushY, brushX, height - brushY);
  }
  if (mirror) {
    canvas.line(width - pbrushX, height - pbrushY, width - brushX, height - brushY);
  }
}


void drawSquare() {
  deactivateBS();
  qActive = true;
  canvas.rectMode(CENTER);
  canvas.colorMode(HSB); //need to set color mode for graphic seperately
  canvas.fill(currHue, currSat, currBri, opacityColour);//retreives variables
  canvas.noStroke();
  canvas.rect(brushX, brushY, brushSize, brushSize);
  if (mirror || mirrorY) {
    canvas.rect(width - brushX, brushY, brushSize, brushSize);
  }
  if (mirror || mirrorX) {
    canvas.rect(brushX, height - brushY, brushSize, brushSize);
  }
  if (mirror) {
    canvas.rect(width - brushX, height - brushY, brushSize, brushSize);
  }
}

void eraseSquare() {
  deactivateBS();
  qActive = true;
  canvas.rectMode(CENTER);
  //canvas.colorMode(HSB); //need to set color mode for graphic seperately
  canvas.fill(wipeStroke, opacityColour);//retreives variables
  canvas.noStroke();
  canvas.rect(brushX, brushY, brushSize, brushSize);
  if (mirror || mirrorY) {
    canvas.rect(width - brushX, brushY, brushSize, brushSize);
  }
  if (mirror || mirrorX) {
    canvas.rect(brushX, height - brushY, brushSize, brushSize);
  }
  if (mirror) {
    canvas.rect(width - brushX, height - brushY, brushSize, brushSize);
  }
}

void drawV() {
  deactivateBS();
  vActive = true;
  canvas.colorMode(HSB); //need to set color mode for graphic seperately
  canvas.fill(currHue, currSat, currBri, opacityColour);//retreives variables
  canvas.noStroke();
  canvas.triangle(brushX, brushY + brushSize/2, brushX + brushSize/2, brushY - brushSize/3, brushX - brushSize/2, brushY - brushSize/3);
  if (mirror || mirrorY) {
    canvas.triangle(width - brushX, brushY + brushSize/2, (width - brushX) + brushSize/2, brushY - brushSize/3, (width - brushX) - brushSize/2, brushY - brushSize/3);
  }
  if (mirror || mirrorX) {
    canvas.triangle(brushX, (height - brushY) + brushSize/2, brushX + brushSize/2, (height - brushY) - brushSize/3, brushX - brushSize/2, (height - brushY) - brushSize/3);
  }
  if (mirror) {
    canvas.triangle(width - brushX, (height - brushY) + brushSize/2, (width - brushX) + brushSize/2, (height - brushY) - brushSize/3, (width - brushX) - brushSize/2, (height - brushY) - brushSize/3);
  }
}

void eraseV() {
  deactivateBS();
  vActive = true;
  //canvas.colorMode(HSB); //need to set color mode for graphic seperately
  canvas.fill(wipeStroke, opacityColour);//retreives variables
  canvas.noStroke();
  canvas.triangle(brushX, brushY + brushSize/2, brushX + brushSize/2, brushY - brushSize/3, brushX - brushSize/2, brushY - brushSize/3);
  if (mirror || mirrorY) {
    canvas.triangle(width - brushX, brushY + brushSize/2, (width - brushX) + brushSize/2, brushY - brushSize/3, (width - brushX) - brushSize/2, brushY - brushSize/3);
  }
  if (mirror || mirrorX) {
    canvas.triangle(brushX, (height - brushY) + brushSize/2, brushX + brushSize/2, (height - brushY) - brushSize/3, brushX - brushSize/2, (height - brushY) - brushSize/3);
  }
  if (mirror) {
    canvas.triangle(width - brushX, (height - brushY) + brushSize/2, (width - brushX) + brushSize/2, (height - brushY) - brushSize/3, (width - brushX) - brushSize/2, (height - brushY) - brushSize/3);
  }
}

void drawTriangle() {
  deactivateBS();
  tActive = true;
  canvas.colorMode(HSB); //need to set color mode for graphic seperately
  canvas.fill(currHue, currSat, currBri, opacityColour);//retreives variables
  canvas.noStroke();
  canvas.triangle(brushX, brushY - brushSize/2, brushX + brushSize/2, brushY + brushSize/3, brushX - brushSize/2, brushY + brushSize/3);
  if (mirror || mirrorY) {
    canvas.triangle((width - brushX), brushY - brushSize/2, (width - brushX) + brushSize/2, brushY + brushSize/3, (width - brushX) - brushSize/2, brushY + brushSize/3);
  }
  if (mirror || mirrorX) {
    canvas.triangle(brushX, (height - brushY) - brushSize/2, brushX + brushSize/2, (height - brushY) + brushSize/3, brushX - brushSize/2, (height - brushY) + brushSize/3);
  }
  if (mirror) {
    canvas.triangle((width - brushX), (height - brushY) - brushSize/2, (width - brushX) + brushSize/2, (height - brushY) + brushSize/3, (width - brushX) - brushSize/2, (height - brushY) + brushSize/3);
  }
}

void eraseTriangle() {
  deactivateBS();
  tActive = true;
  //canvas.colorMode(HSB); //need to set color mode for graphic seperately
  canvas.fill(wipeStroke, opacityColour);//retreives variables
  canvas.noStroke();
  canvas.triangle(brushX, brushY - brushSize/2, brushX + brushSize/2, brushY + brushSize/3, brushX - brushSize/2, brushY + brushSize/3);
  if (mirror || mirrorY) {
    canvas.triangle((width - brushX), brushY - brushSize/2, (width - brushX) + brushSize/2, brushY + brushSize/3, (width - brushX) - brushSize/2, brushY + brushSize/3);
  }
  if (mirror || mirrorX) {
    canvas.triangle(brushX, (height - brushY) - brushSize/2, brushX + brushSize/2, (height - brushY) + brushSize/3, brushX - brushSize/2, (height - brushY) + brushSize/3);
  }
  if (mirror) {
    canvas.triangle((width - brushX), (height - brushY) - brushSize/2, (width - brushX) + brushSize/2, (height - brushY) + brushSize/3, (width - brushX) - brushSize/2, (height - brushY) + brushSize/3);
  }
}


void drawO() {
  deactivateBS();
  oActive = true;
  canvas.noFill();
  canvas.colorMode(HSB); //need to set color mode for graphic seperately
  canvas.stroke(currHue, currSat, currBri, opacityColour);//retreives variables
  canvas.strokeWeight(5);
  canvas.ellipse(brushX, brushY, brushSize, brushSize);
  if (mirror || mirrorY) {
    canvas.ellipse(width - brushX, brushY, brushSize, brushSize);
  }
  if (mirror || mirrorX) {
    canvas.ellipse(brushX, height - brushY, brushSize, brushSize);
  }
  if (mirror) {
    canvas.ellipse(width - brushX, height - brushY, brushSize, brushSize);
  }
}

void drawBox() {
  deactivateBS();
  hActive = true;
  canvas.rectMode(CENTER);
  canvas.colorMode(HSB); //need to set color mode for graphic seperately
  canvas.stroke(currHue, currSat, currBri, opacityColour);//retreives variables
  canvas.noFill();
  canvas.strokeWeight(4);
  canvas.rect(brushX, brushY, brushSize, brushSize);
  if (mirror || mirrorY) {
    canvas.rect(width - brushX, brushY, brushSize, brushSize);
  }
  if (mirror || mirrorX) {
    canvas.rect(brushX, height - brushY, brushSize, brushSize);
  }
  if (mirror) {
    canvas.rect(width - brushX, height - brushY, brushSize, brushSize);
  }
}

void drawHollowTriangle() {
  deactivateBS();
  jActive = true;
  canvas.colorMode(HSB); //need to set color mode for graphic seperately
  canvas.stroke(currHue, currSat, currBri, opacityColour);//retreives variables
  canvas.strokeWeight(4);
  canvas.noFill();
  canvas.triangle(brushX, brushY - brushSize/2, brushX + brushSize/2, brushY + brushSize/3, brushX - brushSize/2, brushY + brushSize/3);
  if (mirror || mirrorY) {
    canvas.triangle((width - brushX), brushY - brushSize/2, (width - brushX) + brushSize/2, brushY + brushSize/3, (width - brushX) - brushSize/2, brushY + brushSize/3);
  }
  if (mirror || mirrorX) {
    canvas.triangle(brushX, (height - brushY) - brushSize/2, brushX + brushSize/2, (height - brushY) + brushSize/3, brushX - brushSize/2, (height - brushY) + brushSize/3);
  }
  if (mirror) {
    canvas.triangle((width - brushX), (height - brushY) - brushSize/2, (width - brushX) + brushSize/2, (height - brushY) + brushSize/3, (width - brushX) - brushSize/2, (height - brushY) + brushSize/3);
  }
}

void drawHollowV() {
  deactivateBS();
  kActive = true;
  canvas.colorMode(HSB); //need to set color mode for graphic seperately
  canvas.stroke(currHue, currSat, currBri, opacityColour);//retreives variables
  canvas.strokeWeight(4);
  canvas.noFill();
  canvas.triangle(brushX, brushY + brushSize/2, brushX + brushSize/2, brushY - brushSize/3, brushX - brushSize/2, brushY - brushSize/3);
  if (mirror || mirrorY) {
    canvas.triangle(width - brushX, brushY + brushSize/2, (width - brushX) + brushSize/2, brushY - brushSize/3, (width - brushX) - brushSize/2, brushY - brushSize/3);
  }
  if (mirror || mirrorX) {
    canvas.triangle(brushX, (height - brushY) + brushSize/2, brushX + brushSize/2, (height - brushY) - brushSize/3, brushX - brushSize/2, (height - brushY) - brushSize/3);
  }
  if (mirror) {
    canvas.triangle(width - brushX, (height - brushY) + brushSize/2, (width - brushX) + brushSize/2, (height - brushY) - brushSize/3, (width - brushX) - brushSize/2, (height - brushY) - brushSize/3);
  }
}

void kbStyle(boolean test) { //a function for setting colours on the keyboard UI. If the key is active, it is assigned a contrasting outline from the background and has a thicker stroke. It is called for each key and uses the "_Active" variable
  if (!test) {
    kb.colorMode(RGB);
    kb.fill(wipeStroke, keyOpacity);
    kb.stroke(130, 130, 130);
    kb.strokeWeight(5);
    kb.rectMode(CORNER);
  } else {
    kb.colorMode(RGB);
    kb.fill(wipeStroke, 255);
    kb.stroke(oppositeWipeStroke);
    kb.strokeWeight(10);
    kb.rectMode(CORNER);
  }
}

void iconStyle() { //a function to simplify drawing icons out of primatives on each key by setting them to contrast the background and originate from center
  kb.rectMode(CENTER);
  kb.strokeWeight(2);
  kb.stroke(oppositeWipeStroke);
  kb.fill(oppositeWipeStroke);
}

void keyBoard() { //the function that the keybboard is stored in
  kb.clear(); //makes it so that it stays transparent instead of drawing over itself over and over.
  kb.fill(wipeStroke, keyOpacity); //original keyboard colour setup before kbStyle()
  kb.stroke(130, 130, 130);
  kb.strokeWeight(5);

  //2 keys are "pre-pressed" the hide UI key (control) and the Tilda key which makes the UI opaque
  //every other key follows the same pattern
  //if the key has been pressed already, it will be drawn
  //then it checks to see if the key should be drawn as an active key or not through the kbStyle function
  //then it draws the key
  //then it uses primatives to draw the icon on the key

  kbStyle(squiggleActive);
  kb.rect(10 + 0 * 130, 10 + 0 * 130, 100, 100, 10);//`
  iconStyle();
  kb.fill(wipeStroke);
  kb.rect(60, 60, 50, 50, 10);

  if (onePress) {
    kbStyle(oneActive);
    kb.rect(10 + 1 * 130, 10 + 0 * 130, 100, 100, 10);//1
    iconStyle();
    kb.ellipse(190, 60, 10, 10);
  }
  if (twoPress) {
    kbStyle(twoActive);
    kb.rect(10 + 2 * 130, 10 + 0 * 130, 100, 100, 10);//2
    iconStyle();
    kb.ellipse(320, 60, 20, 20);
  }
  if (threePress) {
    kbStyle(threeActive);
    kb.rect(10 + 3 * 130, 10 + 0 * 130, 100, 100, 10);//3
    iconStyle();
    kb.ellipse(450, 60, 30, 30);
  }
  if (fourPress) {
    kbStyle(fourActive);
    kb.rect(10 + 4 * 130, 10 + 0 * 130, 100, 100, 10);//4
    iconStyle();
    kb.ellipse(580, 60, 40, 40);
  }
  if (fivePress) {
    kbStyle(fiveActive);
    kb.rect(10 + 5 * 130, 10 + 0 * 130, 100, 100, 10);//5
    iconStyle();
    kb.ellipse(710, 60, 50, 50);
  }
  if (sixPress) {
    kbStyle(sixActive);
    kb.rect(10 + 6 * 130, 10 + 0 * 130, 100, 100, 10);//6
    iconStyle();
    kb.ellipse(840, 60, 60, 60);
  }
  if (sevenPress) {
    kbStyle(sevenActive);
    kb.rect(10 + 7 * 130, 10 + 0 * 130, 100, 100, 10);//7
    iconStyle();
    kb.ellipse(970, 60, 70, 70);
  }
  if (eightPress) {
    kbStyle(eightActive);
    kb.rect(10 + 8 * 130, 10 + 0 * 130, 100, 100, 10);//8
    iconStyle();
    kb.ellipse(1100, 60, 80, 80);
  }
  if (ninePress) {
    kbStyle(nineActive);
    kb.rect(10 + 9 * 130, 10 + 0 * 130, 100, 100, 10);//9
    iconStyle();
    kb.ellipse(1230, 60, 90, 90);
  }
  if (zeroPress) {
    kbStyle(zeroActive);
    kb.rect(10 + 10 * 130, 10 + 0 * 130, 100, 100, 10);//0
    iconStyle();
    kb.ellipse(1360, 60, 3, 3);
  }
  if (minusPress) {
    kbStyle(minusActive);
    kb.rect(10 +11 * 130, 10 + 0 * 130, 100, 100, 10);//-
    iconStyle();
    kb.ellipse(1490, 60, shrink, shrink);
  }
  if (plusPress) {
    kbStyle(plusActive);
    kb.rect(10 + 12 * 130, 10 + 0 * 130, 100, 100, 10);//=
    iconStyle();
    kb.ellipse(1620, 60, grow, grow);
  }
  if (backspacePress) {
    kbStyle(backspaceActive);
    kb.rect(10 + 13 * 130, 10 + 0 * 130, 200, 100, 10);//BACKSPACE
    kb.strokeWeight(10);
    kb.stroke(oppositeWipeStroke);
    kb.line(1840, 20, 1760, 100);
    kb.line(1760, 20, 1840, 100);
  }
  if (tabPress) {
    kbStyle(tabActive);
    kb.rect(10 + 0 * 130, 10 + 1 * 130, 150, 100, 10);//TAB
    kb.strokeWeight(10);
    kb.stroke(oppositeWipeStroke);
    kb.line(85, 190, 110, 215);
    iconStyle();
    kb.beginShape();
    kb.vertex (85, 190);
    kb.vertex (110, 190);
    kb.vertex (55, 160);
    kb.vertex (85, 215);
    kb.endShape();
  }
  if (qPress) {
    kbStyle(qActive);
    kb.rect(60 + 1 * 130, 10 + 1 * 130, 100, 100, 10);//q
    iconStyle();
    kb.rect(240, 190, 50, 50);
  }
  if (wPress) {
    kbStyle(wActive);
    kb.rect(60 + 2 * 130, 10 + 1 * 130, 100, 100, 10);//w
    iconStyle();
    kb.fill(oppositeWipeStroke);
    kb.ellipse(370, 190, 50, 50);
  }
  if (ePress) {
    kbStyle(eActive);
    kb.rect(60 + 3 * 130, 10 + 1 * 130, 100, 100, 10);//e
    iconStyle();
    kb.triangle(500, 205, 485, 185, 515, 185);
    kb.fill(oppositeWipeStroke, 150);
    kb.ellipse(500, 190, 50, 50);
  }
  if (rPress) {
    kbStyle(rActive);
    kb.rect(60 + 4 * 130, 10 + 1 * 130, 100, 100, 10);//r
    iconStyle();
    kb.ellipse(630, 190, 50, 50);
  }
  if (tPress) {
    kbStyle(tActive);
    kb.rect(60 + 5 * 130, 10 + 1 * 130, 100, 100, 10);//t
    iconStyle();
    kb.triangle(760, 190 - 50/2, 760 - 50/2, 190 + 50/3, 760 + 50/2, 190 + 50/3);
  }
  if (yPress) {
    kbStyle(yActive);
    kb.rect(60 + 6 * 130, 10 + 1 * 130, 100, 100, 10);//y
    kb.stroke(oppositeWipeStroke);
    kb.strokeWeight(10);
    kb.noFill();
    kb.line(890, 150, 890, 230);
    kb.line(875, 190, 875, 230);
    kb.line(875, 190, 855, 160);
    kb.line(905, 190, 905, 230);
    kb.line(905, 190, 925, 160);
  }
  if (uPress) {
    kbStyle(uActive);
    kb.rect(60 + 7 * 130, 10 + 1 * 130, 100, 100, 10);//u
    iconStyle();
    kb.colorMode(HSB);
    kb.fill(currHue, 100, 150);
    kb.ellipse(1020, 190, 50, 50);
  }
  if (iPress) {
    kbStyle(iActive);
    kb.rect(60 + 8 * 130, 10 + 1 * 130, 100, 100, 10);//i
    iconStyle();
    kb.rect(1130, 210, 15, 45);
    kb.ellipse(1130, 155, 15, 15);
    kb.rect(1170, 170, 15, 45);
    kb.ellipse(1170, 225, 15, 15);
  }
  if (oPress) {
    kbStyle(oActive);
    kb.rect(60 + 9 * 130, 10 + 1 * 130, 100, 100, 10);//o
    kb.noFill();
    kb.strokeWeight(10);
    kb.stroke(oppositeWipeStroke);
    kb.ellipse(1280, 190, 50, 50);
  }
  if (pPress) {
    kbStyle(pActive);
    kb.rect(60 + 10 * 130, 10 + 1 * 130, 100, 100, 10);//p
    iconStyle();
    kb.ellipse(1410, 190, 60, 60);
    kb.fill(wipeStroke);
    kb.noStroke();
    kb.ellipse(1410, 210, 15, 15);
    kb.rect(1410, 185, 15, 30);
  }
  if (sqrOPress) { //1545
    kbStyle(sqrOActive);
    kb.rect(60 + 11 * 130, 10 + 1 * 130, 100, 100, 10);//[
    iconStyle();
    kb.ellipse(1525, 190, 35, 35);
    kb.triangle(1565, 190 + 35/2, 1565 + 35/2, 190 - 35/3, 1565 - 35/2, 190 - 35/3);
  }
  if (sqrCPress) { //1670
    kbStyle(sqrCActive);
    kb.rect(60 + 12 * 130, 10 + 1 * 130, 100, 100, 10);//]
    iconStyle();
    kb.ellipse(1650, 190, 35, 35);
    kb.triangle(1690, 190 - 35/2, 1690 + 35/2, 190 + 35/3, 1690 - 35/2, 190 + 35/3);
  }
  if (backslashPress) {
    kbStyle(backslashActive);
    kb.rect(60 + 13 * 130, 10 + 1 * 130, 150, 100, 10);//\
    iconStyle();
    kb.ellipse(1825, 190, backSlash, backSlash);
  }
  if (aPress) {
    kbStyle(aActive);
    kb.rect(130 + 1 * 130, 10 + 2 * 130, 100, 100, 10);//a
    iconStyle();
    kb.ellipse(aX, aY, 10, 10);
  }
  if (sPress) {
    kbStyle(aActive);
    kb.rect(130 + 2 * 130, 10 + 2 * 130, 100, 100, 10);//s
    iconStyle();
    kb.triangle(450 - 35/2, 320, 450 + 35/3, 320 + 35/2, 450 + 35/3, 320 - 35/2);
    kb.triangle(430 - 35/2, 320, 430 + 35/3, 320 + 35/2, 430 + 35/3, 320 - 35/2);
  }
  if (dPress) {
    kbStyle(dActive);
    kb.rect(130 + 3 * 130, 10 + 2 * 130, 100, 100, 10);//d
    iconStyle();
    kb.colorMode(HSB);
    kb.fill(currHue, 359, 75);
    kb.ellipse(570, 320, 50, 50);
  }
  if (fPress) {
    kbStyle(fActive);
    kb.rect(130 + 4 * 130, 10 + 2 * 130, 100, 100, 10);//f
    iconStyle();
    kb.triangle(690 + 35/2, 320, 690 - 35/3, 320 + 35/2, 690 - 35/3, 320 - 35/2);
    kb.triangle(710 + 35/2, 320, 710 - 35/3, 320 + 35/2, 710 - 35/3, 320 - 35/2);
  }
  if (gPress) {
    kbStyle(gActive);
    kb.rect(130 + 5 * 130, 10 + 2 * 130, 100, 100, 10);//g
    iconStyle();
    kb.fill(127);
    kb.ellipse(830, 320, 50, 50);
  }
  if (hPress) {
    kbStyle(hActive);
    kb.rect(130 + 6 * 130, 10 + 2 * 130, 100, 100, 10);//h
    iconStyle();
    kb.noFill();
    kb.strokeWeight(10);
    kb.stroke(oppositeWipeStroke);
    kb.rect(960, 320, 50, 50);
  }
  if (jPress) {
    kbStyle(jActive);
    kb.rect(130 + 7 * 130, 10 + 2 * 130, 100, 100, 10);//j
    iconStyle();
    kb.noFill();
    kb.strokeWeight(10);
    kb.stroke(oppositeWipeStroke);
    kb.triangle(1090, 320 - 50/2, 1090 + 50/2, 320 + 50/3, 1090 - 50/2, 320 + 50/3);
  }
  if (kPress) {
    kbStyle(kActive);
    kb.rect(130 + 8 * 130, 10 + 2 * 130, 100, 100, 10);//k
    iconStyle();
    kb.noFill();
    kb.strokeWeight(10);
    kb.stroke(oppositeWipeStroke);
    kb.triangle(1220, 320 + 50/2, 1220 + 50/2, 320 - 50/3, 1220 - 50/2, 320 - 50/3);
  }
  if (lPress) {
    kbStyle(lActive);
    kb.rect(130 + 9 * 130, 10 + 2 * 130, 100, 100, 10);//l
    iconStyle();
    kb.colorMode(HSB);
    kb.fill(currHue, 50, 359);
    kb.ellipse(1350, 320, 50, 50);
  }
  if (colonPress) {
    kbStyle(colonActive);
    kb.rect(130 + 10 * 130, 10 + 2 * 130, 100, 100, 10);//;
    kb.fill(oppositeWipeStroke);
    kb.noStroke();
    kb.ellipse(1480, 355, 10, 10);
    kb.stroke(oppositeWipeStroke);
    kb.strokeWeight(10);
    kb.line(1480, 320, 1480, 340);
    kb.line(1480, 320, 1505, 320);
    kb.line(1505, 320, 1505, 295);
    kb.line(1505, 295, 1480, 295);
  }
  if (quotePress) {
    kbStyle(quoteActive);
    kb.rect(130 + 11 * 130, 10 + 2 * 130, 100, 100, 10);//'
    kb.fill(oppositeWipeStroke);
    kb.noStroke();
    kb.ellipse(1480 + 130, 355, 10, 10);
    kb.stroke(oppositeWipeStroke);
    kb.strokeWeight(10);
    kb.line(1480 + 130, 320, 1480 + 130, 340);
    kb.line(1480 + 130, 320, 1505 + 130, 320);
    kb.line(1505 + 130, 320, 1505 + 130, 295);
    kb.line(1505 + 130, 295, 1480 + 130, 295);
  }
  if (enterPress) {
    kbStyle(enterActive);
    kb.rect(130 + 12 * 130, 10 + 2 * 130, 210, 100, 10);//ENTER
    kb.fill(oppositeWipeStroke);
    kb.noStroke();
    kb.ellipse(1480 + 130 + 185, 355, 10, 10);
    kb.stroke(oppositeWipeStroke);
    kb.strokeWeight(10);
    kb.line(1480 + 130 + 185, 320, 1480 + 130 + 185, 340);
    kb.line(1480 + 130 + 185, 320, 1505 + 130 + 185, 320);
    kb.line(1505 + 130 + 185, 320, 1505 + 130 + 185, 295);
    kb.line(1505 + 130 + 185, 295, 1480 + 130 + 185, 295);
  }
  if (shiftPress) {
    kbStyle(shiftActive);
    kb.rect(10 + 0 * 130, 10 + 3 * 130, 240, 100, 10);//SHIFT
    iconStyle();
    kb.beginShape();
    kb.vertex(105, 425);
    kb.vertex(140, 425);
    kb.vertex(155, 440);
    kb.vertex(155, 475);
    kb.vertex(105, 475);
    kb.endShape();
    kb.fill(wipeStroke);
    kb.rect(130, 431, 25, 12);
    kb.ellipse(130, 450, 15, 15);
    kbStyle(shiftActive);
    kb.rect(150 + 11 * 130, 10 + 3 * 130, 320, 100, 10);//SHIFT
    iconStyle();
    kb.beginShape();
    kb.vertex(1645+65, 425);
    kb.vertex(1680+65, 425);
    kb.vertex(1695+65, 440);
    kb.vertex(1695+65, 475);
    kb.vertex(1645+65, 475);
    kb.endShape();
    kb.fill(wipeStroke);
    kb.rect(1670+65, 431, 25, 12);
    kb.ellipse(1670+65, 450, 15, 15);
  }
  if (zPress) {
    kbStyle(zActive);
    kb.rect(150 + 1 * 130, 10 + 3 * 130, 100, 100, 10);//z
    iconStyle();
    kb.ellipse(zX, zY, 10, 10);
  }
  if (xPress) {
    kbStyle(xActive);
    kb.rect(150 + 2 * 130, 10 + 3 * 130, 100, 100, 10);//x
    iconStyle();
    kb.strokeWeight(10);
    kb.line(420, 450, 500, 450);
    kb.line(460, 435, 430, 410);
    kb.line(460, 435, 490, 410);
    kb.line(430, 490, 460, 465);
    kb.line(460, 465, 490, 490);
  }
  if (cPress) {
    kbStyle(cActive);
    kb.rect(150 + 3 * 130, 10 + 3 * 130, 100, 100, 10);//c
    iconStyle();
    kb.colorMode(HSB);
    kb.fill(currHue, 359, 359);
    kb.ellipse(590, 450, 50, 50);
  }
  if (vPress) {
    kbStyle(vActive);
    kb.rect(150 + 4 * 130, 10 + 3 * 130, 100, 100, 10);//v
    iconStyle();
    kb.triangle(720, 450 + 50/2, 720 + 50/2, 450 - 50/3, 720 - 50/2, 450 - 50/3);
  }
  if (bPress) {
    kbStyle(bActive);
    kb.rect(150 + 5 * 130, 10 + 3 * 130, 100, 100, 10);//b
    iconStyle();
    kb.fill(oppositeWipeStroke, 100);
    kb.ellipse(850, 450, 50, 50);
  }
  if (nPress) {
    kbStyle(nActive);
    kb.rect(150 + 6 * 130, 10 + 3 * 130, 100, 100, 10);//n
    iconStyle();
    kb.fill(wipeStroke);
    kb.ellipse(980, 450, 50, 50);
    kb.strokeWeight(10);
    kb.line(980, 490, 980, 410);
    kb.line(940, 450, 1020, 450);
    kb.strokeWeight(15);
    kb.stroke(255, 0, 0);
    kb.line(940, 490, 1020, 410);
    kb.line(940, 410, 1020, 490);
  }
  if (mPress) {
    kbStyle(mActive);
    kb.rect(150 + 7 * 130, 10 + 3 * 130, 100, 100, 10);//m
    iconStyle();
    kb.fill(wipeStroke);
    kb.ellipse(1110, 450, 50, 50);
    kb.strokeWeight(10);
    kb.line(980+130, 490, 980+130, 410);
    kb.line(940+130, 450, 1020+130, 450);
  }
  if (commaPress) {
    kbStyle(commaActive);
    kb.rect(150 + 8 * 130, 10 + 3 * 130, 100, 100, 10);//,
    iconStyle();
    kb.colorMode(HSB);
    kb.fill(commaHue, 359, 359);
    kb.triangle(1240 - 50/2, 450, 1240 + 50/3, 450 + 50/2, 1240 + 50/3, 450 - 50/2);
  }
  if (periodPress) {
    kbStyle(periodActive);
    kb.rect(150 + 9 * 130, 10 + 3 * 130, 100, 100, 10);//.
    iconStyle();
    kb.colorMode(HSB);
    kb.fill(periodHue, 359, 359);
    kb.triangle(1370 + 50/2, 450, 1370 - 50/3, 450 - 50/2, 1370 - 50/3, 450 + 50/2);
  }
  if (questPress) {
    kbStyle(questActive);
    kb.rect(150 + 10 * 130, 10 + 3 * 130, 100, 100, 10);// /
    kb.fill(oppositeWipeStroke);
    kb.noStroke();
    kb.ellipse(1500, 485, 10, 10);
    kb.stroke(oppositeWipeStroke);
    kb.strokeWeight(10);
    kb.line(1500, 450, 1500, 470);
    kb.line(1500, 450, 1525, 450);
    kb.line(1525, 450, 1525, 425);
    kb.line(1525, 425, 1500, 425);
  }
  kb.colorMode(RGB);
  kb.fill(wipeStroke, keyOpacity);
  kb.stroke(130, 130, 130);
  kb.strokeWeight(5);
  kb.rectMode(CORNER);
  kb.rect(10 + 0 * 130, 10 + 4 * 130, 220, 100, 10);//CTRL
  iconStyle();
  kb.ellipse(120, 580, 125, 50);
  kb.fill(wipeStroke);
  kb.ellipse(120, 580, 50, 50);
  kb.stroke(255, 0, 0);
  kb.strokeWeight(15);
  kb.line(80, 540, 160, 620);

  if (spacePress) {
    kbStyle(spaceActive);
    kb.rect(500, 5 + 4 * 130, 580, 100, 10);//SPACE
    iconStyle();
    kb.rect(770, 580, 25, 75);
    kb.rect(810, 580, 25, 75);
  }
  if (upPress) {
    kbStyle(upActive);
    kb.rect(1680, 5 + 4 * 130, 100, 50, 10);//UP
    iconStyle();
    kb.fill(wipeStroke);
    kb.triangle(1730, 550 - 30/2, 1730 + 30/2, 550 + 30/3, 1730 - 30/2, 550 + 30/3);
    kb.fill(oppositeWipeStroke);
    kb.triangle(1730, 550 - 30/2, 1730 + 30/2, 550 + 10/3, 1730 - 30/2, 550 + 10/3);
  }
  if (leftPress) {
    kbStyle(leftActive);
    kb.rect(1560, 600, 100, 50, 10);//LEFT
    iconStyle();
    kb.fill(wipeStroke);
    kb.triangle( 1610 - 30/2, 625, 1610 + 30/3, 625 + 30/2, 1610 + 30/3, 625 - 30/2);
    kb.fill(oppositeWipeStroke);
    kb.triangle( 1610 - 30/2, 625, 1610 + 10/3, 625 + 30/2, 1610 + 10/3, 625 - 30/2);
  }
  if (downPress) {
    kbStyle(downActive);
    kb.rect(1680, 600, 100, 50, 10);//DOWN
    iconStyle();
    kb.fill(wipeStroke);
    kb.triangle(1730, 625 + 30/2, 1730 + 30/2, 625 - 30/3, 1730 - 30/2, 625 - 30/3);
    kb.fill(oppositeWipeStroke);
    kb.triangle(1730, 625 + 30/2, 1730 + 30/2, 625 - 10/3, 1730 - 30/2, 625 - 10/3);
  }
  if (rightPress) {
    kbStyle(rightActive);
    kb.rect(1800, 600, 100, 50, 10);//RIGHT
    iconStyle();
    kb.fill(wipeStroke);
    kb.triangle(1850 + 30/2, 625, 1850 - 30/3, 625 + 30/2, 1850 - 30/3, 625 - 30/2);
    kb.fill(oppositeWipeStroke);
    kb.triangle(1850 + 30/2, 625, 1850 - 10/3, 625 + 30/2, 1850 - 10/3, 625 - 30/2);
  }
}


void pencilCursor() {//pencil cursor that follows the mouse by using pmouse and mouse coordinates on an orange line
  stroke(#FFB324);
  strokeWeight(20);
  line(mouseX, mouseY-20, pmouseX, pmouseY - 155);
  stroke(#E55FC4);
  line(pmouseX, pmouseY -155, pmouseX, pmouseY - 150);
  fill(#E5CDA0);
  noStroke();
  triangle(mouseX, mouseY, mouseX + 10, mouseY -15, mouseX - 10, mouseY-15);
  fill(0);
  triangle(mouseX, mouseY, mouseX + 3, mouseY -3, mouseX - 3, mouseY-5);
}

void mouseCursor() { //default cursor
  rectMode(CENTER); //sets up primatives to draw the mouse
  strokeWeight(5);
  stroke(100);
  noFill();
  rect(mouseX, mouseY + 130 + brushSize/2, 120, 120, 30); //mouse body is drawn beneath the brush outline
  if (mouseLeft) { //checks if left mouse button is pressed
    stroke(oppositeWipeStroke); //changes the stroke and fill to give user feedback
    fill(0);
  } else {
    stroke(100);
    noFill();
  }
  rect(mouseX - 40, mouseY + 40 + brushSize/2, 40, 40, 30); // mouse left is drawn beneath the brush outline
  if (mouseRight) { //checks if right moue button is pressed
    stroke(oppositeWipeStroke); //changes the stroke and fill to provide user feedback
    fill(0);
  } else {
    noFill();
    stroke(100);
  }
  rect(mouseX + 40, mouseY + 40 + brushSize/2, 40, 40, 30); // mouse right is drawn beneath the brush outline
  if (mouseScroll >= 0) { //checks to see if the mouse scroll counter is still running (which is set to 3 frames each time the mouse is scrolled)
    fill(0); //changes stroke and fill to provide user feedback
    stroke(oppositeWipeStroke);
  } else {
    noFill();
    stroke(100);
  }
  rect(mouseX, mouseY + 40 + brushSize/2, 10, 40, 30); //mouse scroll wheel is drawn beneath the brush outline
  noFill();
  mouseRight = false; //prevents user feedback from continuing if the mouse is not being pressed, happens after the primitaves are drawn so there is a 1 frame delay
  mouseLeft = false;
  strokeWeight(2); //sets up brush outline on cursor UI
  stroke(oppositeWipeStroke);
  if (brushShape == 0 || brushShape == 4) { //checks to see what shape the brush is set to and draws accordingly
    ellipse(mouseX, mouseY, brushSize + 1, brushSize + 1);
  }
  if (brushShape == 1 || brushShape == 5) {
    rect(mouseX, mouseY, brushSize + 1, brushSize + 1);
  }
  if (brushShape == 2 || brushShape == 6) {
    triangle(mouseX, mouseY - brushSize/2, mouseX + brushSize/2, mouseY + brushSize/3, mouseX - brushSize/2, mouseY + brushSize/3);
  }
  if (brushShape == 3 || brushShape == 7) {
    triangle(mouseX, mouseY + brushSize/2, mouseX + brushSize/2, mouseY - brushSize/3, mouseX - brushSize/2, mouseY - brushSize/3);
  }
}

void automaticDraw() { //draws with randomly generated cordinates depending on the brush shape selected
  if (autoDraw) {
    if (brushShape == 0) {
      drawLine();
    }

    //square shape brush
    if (brushShape == 1) {
      drawSquare();
    }

    //v shape brush
    if (brushShape == 3) {
      drawV();
    }

    //triangle shaped brush
    if (brushShape == 2) {
      drawTriangle();
    }
    //"o" shape brush
    if (brushShape == 4) {
      drawO();
    }

    //box shape brush
    if (brushShape == 5) {
      drawBox();
    }

    //hollow triangle shaped brush
    if (brushShape == 6) {
      drawHollowTriangle();
    }
    //v hollow shape brush
    if (brushShape == 7) {
      drawHollowV();
    }
  }
}

void bounceDraw() { //draws with bouncy cordinates depending on the brush shape selected
  {
    if (bounce) {


      if (brushShape == 0) {
        drawLine();
      }

      //square shape brush
      if (brushShape == 1) {
        drawSquare();
      }

      //v shape brush
      if (brushShape == 3) {
        drawV();
      }

      //triangle shaped brush
      if (brushShape == 2) {
        drawTriangle();
      }
      //"o" shape brush
      if (brushShape == 4) {
        drawO();
      }

      //box shape brush
      if (brushShape == 5) {
        drawBox();
      }

      //hollow triangle shaped brush
      if (brushShape == 6) {
        drawHollowTriangle();
      }
      //v hollow shape brush
      if (brushShape == 7) {
        drawHollowV();
      }
    }
  }
}



//everything below here was put into functions for the keyboard UI so I didn't have to deativate "active" keys one by one in each keystroke

void deactivateSP() { //deactivates keys that are only active while actually being pressed by user through using a counter.
  activeCounter --;
  if (activeCounter == 0) {
    bActive = false;
    eActive = false;
    fActive = false;
    gActive = false;
    iActive = false;
    pActive = false;
    sActive = false;
    backspaceActive = false;
    spaceActive = false;
    tabActive = false;
    shiftActive = false;
    upActive = false;
    downActive = false;
    leftActive = false;
    rightActive = false;
    sqrOActive = false;
    sqrCActive = false;
    colonActive = false;
    quoteActive = false;
    enterActive = false;
    questActive = false;
  }
}

void deactivateDraw() { //deactivates autodraw keys
  aActive = false;
  zActive = false;
}

void deactivateColour() { //deactivates colour related keys
  cActive = false;
  dActive = false;
  lActive = false;
  uActive = false;
  wActive = false;
}

void deactivateBS() { //deactivates brush shape keys 
  hActive = false;
  jActive = false;
  kActive = false;
  oActive = false;
  qActive = false;
  rActive = false;
  tActive = false;
  vActive = false;
}

void deactivateBZ() { //deactivates brush size keys
  oneActive = false;
  twoActive = false;
  threeActive = false;
  fourActive = false;
  fiveActive = false;
  sixActive = false;
  sevenActive = false;
  eightActive = false;
  nineActive = false;
  zeroActive = false;
  minusActive = false;
  plusActive = false;
  backslashActive = false;
}

void deactivateSetBZ() { //deactivates brush size keys when open square bracket and close square bracket is pressed
  oneActive = false;
  twoActive = false;
  threeActive = false;
  fourActive = false;
  fiveActive = false;
  sixActive = false;
  sevenActive = false;
  eightActive = false;
  nineActive = false;
  zeroActive = false;
}

void deactivateMirror() { //deactivates mirror effect keys
  mActive = false;
  nActive = false;
  xActive = false;
  yActive = false;
}

void deactivateView() { //deactivates the view toggle key (tilda key)
  squiggleActive = false;
}

void deactivateColAn() { //deactivates keys that automatically change the hues
  commaActive = false;
  periodActive = false;
}

void deactivateAll() { //deactivates all keys
  mActive = false;
  nActive = false;
  xActive = false;
  yActive = false;
  commaActive = false;
  periodActive = false;
  squiggleActive = false;
  oneActive = false;
  twoActive = false;
  threeActive = false;
  fourActive = false;
  fiveActive = false;
  sixActive = false;
  sevenActive = false;
  eightActive = false;
  nineActive = false;
  zeroActive = false;
  minusActive = false;
  plusActive = false;
  backslashActive = false;
  hActive = false;
  jActive = false;
  kActive = false;
  oActive = false;
  qActive = false;
  rActive = false;
  tActive = false;
  vActive = false;
  cActive = false;
  dActive = false;
  lActive = false;
  uActive = false;
  wActive = false;
  aActive = false;
  zActive = false;
  bActive = false;
  eActive = false;
  fActive = false;
  gActive = false;
  iActive = false;
  pActive = false;
  sActive = false;
  //backspaceActive = false;
  spaceActive = false;
  tabActive = false;
  shiftActive = false;
  upActive = false;
  downActive = false;
  leftActive = false;
  rightActive = false;
  sqrOActive = false;
  sqrCActive = false;
  colonActive = false;
  quoteActive = false;
  enterActive = false;
  questActive = false;
}
