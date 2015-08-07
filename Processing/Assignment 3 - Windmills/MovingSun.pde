//mouseX CONTAINS THE VERTICAL COORDINATE OF THE MOUSE
//DEFAULT VALUE IS 0, SO SUN STAYS TO THE LEFT UNTIL I MOVE MY MOUSE

float sunHeight = 150;

void movingSun() {
  fill(255, 255, 0);
  ellipse(mouseX, sunHeight, sunHeight/3, sunHeight/3);
  triangle(mouseX, sunHeight/2, mouseX - 10, sunHeight-30, mouseX + 10, sunHeight-30);
  triangle(mouseX, sunHeight+(sunHeight/2), mouseX - 10, sunHeight+30, mouseX + 10, sunHeight+30);
  triangle(mouseX - sunHeight+(sunHeight/2), sunHeight, mouseX - sunHeight/5, sunHeight+10, mouseX - sunHeight/5, sunHeight-10);
  triangle(mouseX + sunHeight/2, sunHeight, mouseX + sunHeight/5, sunHeight+10, mouseX + sunHeight/5, sunHeight-10);
}
