//mouseX CONTAINS THE VERTICAL COORDINATE OF THE MOUSE
//DEFAULT VALUE IS 0, SO SUN STAYS TO THE LEFT UNTIL I MOVE MY MOUSE

float sunHeight = 150;

void movingSun(int frequency1, int frequency2, int frequency3) {

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
