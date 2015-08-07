Windmill myWindmill1;
Windmill myWindmill2;
Windmill myWindmill3;
MovingSun sun1;
Lightning lightning1;
Lightning lightning2;
Lightning lightning3;
Rain rainDrops;

//SET ORIGIN POINT
float origin = 0;

//FREQUENCY OF LIGHTNING STRIKING & SUN DISAPPEARING
int frequency1 = int(random(20, 80));
int frequency2 = int(random(20, 80));
int frequency3 = int(random(20, 80));

void setup() {
  size(700, 700);
  smooth();
  noStroke();
  
  //SET FRAME RATE
  frameRate(20);
  
  myWindmill1 = new Windmill(.3, int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
  myWindmill2 = new Windmill(.5, int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
  myWindmill3 = new Windmill(.7, int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
  
  sun1 = new MovingSun();
  
  rainDrops = new Rain(int(random(50, 1000)));
  //CREATE RAIN
  rainDrops.makeRain();
  
   
}

void draw() {
  background(0);
  
  //INITIALIZE LIGHTNING BOLTS
  lightning1 = new Lightning(int(random(5, 20)), random(3, 3.9), frequency1, int(random(1, 10)));
  lightning2 = new Lightning(int(random(5, 20)), random(1.2, 2), frequency2, int(random(1, 20)));
  lightning3 = new Lightning(int(random(5, 20)), random(1.1, 1.5), frequency3, int(random(1, 15)));
  
  //DISPLAY LIGHTNING
  lightning1.display();
  lightning2.display();
  lightning3.display();

  //BUILD WINDMILLS + DISAPPEAR FUNCTION WHEN LIGHTNING STRIKES
  pushMatrix();
  //myWindmill1.disappear();
  myWindmill1.display();
  popMatrix(); 
  
  pushMatrix();
  //myWindmill2.disappear();
  myWindmill2.display();
  popMatrix();
  
  pushMatrix();
  //myWindmill3.disappear();
  myWindmill3.display();
  popMatrix();

  //DISPLAY SUN
 sun1.showSun();
 
  //RAIN FALLING
  
  rainDrops.rainFall();  
}
