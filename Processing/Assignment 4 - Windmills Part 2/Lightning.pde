void lightning (float startPosition, int frequency, int thickness) {
  
strokeWeight(thickness);  
  
//LIGHTNING FREQUENCY
  if(frameCount % frequency == 0) {
    stroke(255,255,0,240);
  } 
  else stroke(0);

//DETERMINE LIGHTNING BOLT DIMENSIONS
  for(int i = 0; i < lightningX.length; i++){
    lightningX[i]= width/startPosition + random(-40,40);
    lightningY[i] = i*(height/(lightningY.length-1));
    
  }

//DRAW THE LIGHTNING BOLT
  for(int i = 0; i < lightningParts-1; i++){
    line(lightningX[i], lightningY[i], lightningX[i+1], lightningY[i+1]);
  }   
  
}

