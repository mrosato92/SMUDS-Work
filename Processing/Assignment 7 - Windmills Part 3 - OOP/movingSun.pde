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
