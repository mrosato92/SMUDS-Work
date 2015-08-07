//MARK ROSATO
//Assignment 3: Dynamic Composition 1

//SET ORIGIN POINT FOR REFERENCE
float origin = 0;

//SET DIMENSIONS FOR EACH WINDMILL BLADE.  4 BLADES PER WINDMILL
float bladeWidth = 10;
float bladeHeight = 50;

//SET UP RAINDROP INPUT VARIABLES
int rainDropCount = 500;
float rainDropCountCurrent = 1;

//RAINDROP ARRAY INPUTS
float[] x = new float[rainDropCount];
float[] y = new float[rainDropCount];
float[] rainWidth = new float[rainDropCount];
float[] rainHeight = new float[rainDropCount];


void setup() {
  size(700, 700);
  smooth();
  noStroke();
  
  //SET FRAME RATE FOR VOID DRAW TO BE 20 RATHER THAN 60
  frameRate(20);
  
 //change values you are incrementing things by

  //FOR LOOP TO SET DIMENSIONS FOR EACH OF THE 500 RAINDROPS WITHIN ARRAY
  for(int i = 0; i < rainDropCount; i ++){
    x[i] = random(0, width-2);
    y[i] = random(0, height);
    rainWidth[i] = random(1, 2);
    rainHeight[i] = random(1, 10);
  }
}
 
void draw() {
  background(0);
  
  //INSERT WINDMILL 1
  pushMatrix();
  windmillOne();
  popMatrix();

  //INSERT WINDMILL 2
  pushMatrix();
  windmillTwo();
  popMatrix();
  
  //INSERT WINDMILL 3
  pushMatrix();
  windmillThree();
  popMatrix();

  //FOR LOOP TO BUILD RAINDROPS
  for(int i = 0; i < rainDropCount; i ++){
    fill(50, 0, 255);
    ellipse(x[i], y[i], rainWidth[i], rainHeight[i]);
    //THIS CAN BE TOGGLED TO ADJUST THE SPEED AT WHICH THEY FALL
    y[i] += 10;
  }
  
  //fill command never changing
  //put fill out of loop to improve performance
  //keep as much out of for loops as possible
  //only put things in loops where change is happening
  
  //FOR LOOP TO RESET RAINDROPS
  //WHEN THEY TOUCH THE GROUND, THEY BEGIN FALLING AGAIN FROM THE TOP
  for(int i = 0; i < rainDropCount; i++){
      if (y[i] > height) {
      y[i] = 0;
    }
  }

  //INSERT MOVING SUN
  pushMatrix();
  movingSun();
  popMatrix();

}

