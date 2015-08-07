void windmillOne() {
  
  //CENTER THE WINDMILL
  translate(width/2, height/2);
 
  //WINDMILL BLADES
  pushMatrix();
  //ALLOW BLADES TO ROTATE IN SYNC WITH FRAME RATE
  rotate(radians(frameCount));
  
  noStroke();
  fill(120);
  
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

//push and pop only around translate, rotate, or scale
//will do nothing otherwise
//impact the 'internal transformation matrix'
//begin and end shape have no relationship - use them for vertex calls
//ellipse, rect, etc. do not need begin or end shape

//with windmills, try paramaterizing them by making one windmill function rather than three
//repeating structures - leverage transformation functions and just use push and pop
//draw one rectangle and rotate a few more times - save some code

