void windmillTwo() {
  
  //CENTER THE WINDMILL
  translate(width/3, height/2);
 
  //WINDMILL BLADES
  pushMatrix();
  //ALLOW BLADES TO ROTATE IN SYNC WITH FRAME RATE
  rotate(radians(frameCount));
  
  noStroke();
  fill(255);
  
  //BUILD A CROSS FOR BLADES
  rect(origin+bladeWidth, origin-(bladeWidth/2), bladeHeight, bladeWidth);
  rect(origin, origin, bladeWidth, bladeHeight);
  rect(origin, origin-bladeHeight, bladeWidth, bladeHeight);
  rect(origin-bladeHeight, origin-(bladeWidth/2), bladeHeight, bladeWidth);
  popMatrix();
  
  //WINDMILL BASE
  pushMatrix();
  smooth();
  triangle(origin, origin, width/(width/-bladeHeight), height, width/(width/bladeHeight), height);
  popMatrix();
  
}
