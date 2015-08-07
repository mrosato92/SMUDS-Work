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
class Lightning {
  
  float[] lightningX;
  float[] lightningY;
  float th;
  float sp;
  float freq;
  int lp;
  
  Lightning(int lightningParts, float startPosition, int frequency, int thickness){
    this.lp = lightningParts;
    this.lightningX = new float[lightningParts];
    this.lightningY = new float[lightningParts];
    this.th = thickness;
    this.sp = startPosition;
    this.freq = frequency;
    strokeWeight(thickness);  
  }
  
  void display() {

    //LIGHTNING FREQUENCY
    if(frameCount % freq == 0) {
      stroke(255,255,0,240);
    } 
    else stroke(0);
    
    //DETERMINE LIGHTNING BOLT DIMENSIONS
    for(int i = 0; i < lightningX.length; i++){
      lightningX[i]= width/sp + random(-40,40);
      lightningY[i] = i*(height/(lightningY.length-1));
    }
  
    //DRAW THE LIGHTNING BOLT
    for(int i = 0; i < lp-1; i++){
      line(lightningX[i], lightningY[i], lightningX[i+1], lightningY[i+1]);
    }   
  }
}


class Rain {
  int rainDropCount;
  float rainDropCountCurrent;
  float[] x;
  float[] y;
  float[] rainWidth;
  float[] rainHeight;
  float[] rainSpeed;
  float[] rainGravity;
  
  Rain(int rdc) {
    this.rainDropCount = rdc;
    this.rainDropCountCurrent = 1;
    this.x = new float[rainDropCount];
    this.y = new float[rainDropCount];
    this.rainWidth = new float[rainDropCount];
    this.rainHeight = new float[rainDropCount];
    this.rainSpeed = new float[rainDropCount];
    this.rainGravity = new float[rainDropCount];
  }
  
  void makeRain() {
   
    //FOR LOOP TO SET DIMENSIONS FOR EACH OF THE X# RAINDROPS WITHIN ARRAY
    for(int i = 0; i < rainDropCount; i ++){
      x[i] = random(0, width-2);
      y[i] = random(0, height);
      rainWidth[i] = random(1, 2);
      rainHeight[i] = random(1, 10);
      rainSpeed[i] = random(5, 15);
      rainGravity[i] = random(.05, .5);
    }
  }
  
  void rainFall() {

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
  }
}

class Windmill {
  
  int windmillCount;
  float bladeWidth;
  float bladeHeight;
  float frameCountAddition = random(.4, 10);
  float ws;
  float hs;
  int red;
  int green;
  int blue;
  
  
  Windmill(float widthStart, int r, int g, int b) {
    this.windmillCount = 3;
    this.bladeWidth = 10;
    this.bladeHeight = 50;
    this.ws = widthStart;
    this.hs = 2;
    this.red = r;
    this.green = g;
    this.blue = b;
  }

  void display() {
    noStroke();
    //CENTER THE WINDMILL
    translate(width*ws, height/hs);
    
    //WINDMILL COLOR
    fill(red, green, blue);

    pushMatrix();
    //WINDMILL BLADES
    rotate(radians(frameCountAddition*frameCount));
    //BLADE BASE
    rect(origin-bladeWidth, origin-bladeWidth, bladeWidth*2, bladeWidth*2);
    //BLADES
    for(int i = 0; i < 4; i++){
      rect(origin+bladeWidth, origin-(bladeWidth/2), bladeHeight, bladeWidth);
      rotate(TWO_PI/4); 
    }
    popMatrix();
    
    //WINDMILL BASE
    smooth();
    triangle(origin, origin, width/(width/-bladeHeight), height, width/(width/bladeHeight), height);
  }

  void disappear() {
    noStroke();
      
     //WINDMILL WILL DISAPPEAR WHEN LIGHTNING STRIKES
    if(frameCount % frequency1 == 0 ||frameCount % frequency2 == 0 || frameCount % frequency3 == 0) {
      fill(0, 0, 0);
    } 
    else fill(red, green, blue);
  }
  
}
class MovingSun {
  
  float sunHeight;
  
  
  MovingSun() {
    this.sunHeight = 150;
  }
  
  void showSun() {
    
  //SUN WILL DISAPPEAR WHEN LIGHTNING STRIKES
  if(frameCount % frequency1 == 0 ||frameCount % frequency2 == 0 || frameCount % frequency3 == 0) {
    fill(0);
  } 
  else fill(255, 255, 0);
  
//BUILD THE SUN
  ellipse(mouseX, sunHeight, sunHeight/3, sunHeight/3);
  triangle(mouseX, sunHeight/2, mouseX - 10, sunHeight-30, mouseX + 10, sunHeight-30);
  triangle(mouseX, sunHeight+(sunHeight/2), mouseX - 10, sunHeight+30, mouseX + 10, sunHeight+30);
  triangle(mouseX - sunHeight+(sunHeight/2), sunHeight, mouseX - sunHeight/5, sunHeight+10, mouseX - sunHeight/5, sunHeight-10);
  triangle(mouseX + sunHeight/2, sunHeight, mouseX + sunHeight/5, sunHeight+10, mouseX + sunHeight/5, sunHeight-10);
    
  }
  
  
}

