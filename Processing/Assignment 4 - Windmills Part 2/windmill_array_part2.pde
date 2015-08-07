//MARK ROSATO
//Assignment 4: Dynamic Composition Part 2

//SET ORIGIN
  float origin = 0;

//WINDMILL INPUTS
  int windmillCount = 3;

  //SET DIMENSIONS FOR EACH WINDMILL BLADE.  4 BLADES PER WINDMILL
  float bladeWidth = 10;
  float bladeHeight = 50;

  //WINDMILL ROTATION INPUTS
  float[] windmillRotation = new float[windmillCount];
  float[] frameCountAddition = new float[windmillCount];

//RAINDROP INPUTS
  int rainDropCount = 500;
  float rainDropCountCurrent = 1;

  float[] x = new float[rainDropCount];
  float[] y = new float[rainDropCount];
  float[] rainWidth = new float[rainDropCount];
  float[] rainHeight = new float[rainDropCount];
  float[] rainSpeed = new float[rainDropCount];
  float[] rainGravity = new float[rainDropCount];
  

//LIGHTNING INPUTS
  int lightningParts = 11;
  float[] lightningX = new float[lightningParts];
  float[] lightningY = new float[lightningParts];

//FREQUENCY OF LIGHTNING STRIKING & SUN DISAPPEARING
int frequency1 = 30;
int frequency2 = 50;
int frequency3 = 70;

void setup() {
  size(700, 700);
  smooth();
  noStroke();

//SET FRAME RATE FOR VOID DRAW TO BE 20 RATHER THAN 60
  frameRate(20);

//FOR LOOP TO SET DIMENSIONS FOR EACH OF THE 500 RAINDROPS WITHIN ARRAY
  for(int i = 0; i < rainDropCount; i ++){
    x[i] = random(0, width-2);
    y[i] = random(0, height);
    rainWidth[i] = random(1, 2);
    rainHeight[i] = random(1, 10);
    rainSpeed[i] = random(5, 15);
    rainGravity[i] = random(.05, .5);
  }
  
//FOR LOOP FOR WINDMILL ROTATION
  for(int i = 0; i < windmillRotation.length; i++){
    frameCountAddition[i] = random(.4, 10);
  }     

}
 
void draw() {
  background(0);
  
  //LIGHTNING BOLTS
  
  lightning(random(3, 3.9), frequency1, int(random(1, 10)));
  lightning(random(1.2, 2), frequency2, int(random(1, 20)));
  lightning(random(1.1, 1.5), frequency3, int(random(1, 15)));
  
  
  //FOR LOOP FOR WINDMILL ROTATION
  for(int i = 0; i < windmillRotation.length; i++){
    windmillRotation[i] = frameCount*frameCountAddition[i];
  }     
  
  //INSERT WINDMILL 1
  pushMatrix();
  windmill(2, 2, windmillRotation[0], frequency1, frequency2, frequency3);
  popMatrix();

  //INSERT WINDMILL 2
  pushMatrix();
  windmill(3, 2, windmillRotation[1], frequency1, frequency2, frequency3);
  popMatrix();

  //INSERT WINDMILL 3
  pushMatrix();
  windmill(1.5, 2, windmillRotation[2], frequency1, frequency2, frequency3);
  popMatrix();

  //RAINDROP COLOR
  fill(50, 0, 255);

  //FOR LOOP TO BUILD RAINDROPS
  for(int i = 0; i < rainDropCount; i ++){
    ellipse(x[i], y[i], rainWidth[i], rainHeight[i]);
    rainSpeed[i] += rainGravity[i];
    y[i] += rainSpeed[i];
  }
  
  //FOR LOOP TO RESET RAINDROPS
  //WHEN THEY TOUCH THE GROUND, THEY BEGIN FALLING AGAIN FROM THE TOP
  for(int i = 0; i < rainDropCount; i++){
      if (y[i] > height) {
      y[i] = 0;
      rainSpeed[i] = random(5, 15);
      }
  }

  //INSERT MOVING SUN
  pushMatrix();
  movingSun(frequency1, frequency2, frequency3);
  popMatrix();

}

