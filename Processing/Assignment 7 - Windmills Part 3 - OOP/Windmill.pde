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
