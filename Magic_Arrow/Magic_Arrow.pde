/*

 * Title of the sketch: Magic Arrow
 
 * Author: Or Leviteh
 
 * Date: Sep 21, 2012
 
 * Drag mouse in circles to spin the arrow.
 
 * Code adapted from "ezGestures"
 
 * by Elie Zananiri. Source code can be found here: http://www.silentlycrashing.net/ezgestures/
 
 */


Arrow ar;
PImage img;
import net.silentlycrashing.gestures.*;
import net.silentlycrashing.gestures.preset.*;



int NUM_PTS = 30;

float DEFAULT_ROTATION = 0.005;
float ROTATION_INC = 0.005;
float rotation = 1;
float currRotation;
int rotationState;

GestureAnalyzer brain;
ConcurrentGestureListener cwTwirlEar;
ConcurrentGestureListener ccwTwirlEar;
ConcurrentGestureListener hShakeEar;

void setup() {

  img = loadImage("600-600.png");

  ar = new Arrow ();

  size(600, 600);
  smooth();

  currRotation = DEFAULT_ROTATION;

  // init the gesture listeners
  brain = new MouseGestureAnalyzer(this);
  cwTwirlEar = new ConcurrentCWTwirlListener(this, brain);
  cwTwirlEar.registerOnAction("setRotationRight", this);
  cwTwirlEar.registerOffAction("setRotationDefault", this);
  ccwTwirlEar = new ConcurrentCCWTwirlListener(this, brain);
  ccwTwirlEar.registerOnAction("setRotationLeft", this);
  ccwTwirlEar.registerOffAction("setRotationDefault", this);
  hShakeEar = new ConcurrentHShakeListener(this, brain);
  hShakeEar.registerOnAction("toggleScaleUp", this);
  hShakeEar.registerOffAction("toggleScaleUp", this);
}

void draw() {
  
  image(img, 0, 0, 600, 600);
  
  rotation += currRotation;

  pushMatrix();
  translate(width/2, height/2);
  rotate(rotation);
  translate(-width/2, -height/2);

  ar.display();
  popMatrix();


  if (rotationState == 0) resetRotation();
  else if (rotationState == 1) incRotation();
  else decRotation();
}



void setRotationDefault() { 
  rotationState = 0;
}
void setRotationRight() { 
  rotationState = 1;
}
void setRotationLeft() { 
  rotationState = 2;
}

void incRotation() { 
  currRotation += ROTATION_INC;
}
void decRotation() { 
  currRotation -= ROTATION_INC;
}

void resetRotation() {
  if (currRotation > DEFAULT_ROTATION) decRotation();
  else if (currRotation < DEFAULT_ROTATION) incRotation();
}

