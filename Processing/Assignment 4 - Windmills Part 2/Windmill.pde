void windmill(float widthStart, float heightStart, float speed, int frequency1, int frequency2, int frequency3) {
  
  //CENTER THE WINDMILL
  translate(width/widthStart, height/heightStart);
 
  //WINDMILL BLADES
  pushMatrix();
  
  rotate(radians(speed));

  noStroke();
  int windmillColor1 = int(random(0, 255));
  int windmillColor2 = int(random(0, 255));
  int windmillColor3 = int(random(0, 255));

  
  //WINDMILL WILL DISAPPEAR WHEN LIGHTNING STRIKES
  if(frameCount % frequency1 == 0 ||frameCount % frequency2 == 0 || frameCount % frequency3 == 0) {
    fill(0, 0, 0);
  } 
  else fill(windmillColor1, windmillColor2, windmillColor3);
  
  //FOR LOOP TO BUILD BLADES
  for(int i = 0; i < 4; i++){
    rect(origin+bladeWidth, origin-(bladeWidth/2), bladeHeight, bladeWidth);
    rotate(TWO_PI/4); 
  }
  //BLADE BASE
  rect(origin-bladeWidth, origin-bladeWidth, bladeWidth*2, bladeWidth*2);
  popMatrix();
  
  //WINDMILL BASE
  pushMatrix();
  smooth();
  triangle(origin, origin, width/(width/-bladeHeight), height, width/(width/bladeHeight), height);
  popMatrix();
  
}

