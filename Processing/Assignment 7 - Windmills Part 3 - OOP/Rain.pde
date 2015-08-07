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

