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


