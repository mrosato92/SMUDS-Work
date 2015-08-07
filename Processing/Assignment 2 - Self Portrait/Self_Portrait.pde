//MARK ROSATO
//PROJECT 2 SELF PORTRAIT
//VISUALIZATION OF INFORMATION, IRA GREENBERG

void setup() {
  size(450, 450);
  background(130);
  
    //neck and torso
   fill(0, 102, 51);
   stroke(255);
   strokeWeight(2);
  beginShape();
  vertex(0, 450);
  vertex(0, 375);
  vertex(170, 300);
  vertex(280, 300);
  vertex(450, 410);
  vertex(450, 450);
  endShape(CLOSE);
   
}

void shirt() {
  //shirt
  beginShape();
  fill(20);
  //fill(0, 102, 51);
  noStroke();
  vertex(0, 450);
  vertex(0, 375);
  vertex(121.43, 325);
  vertex(160, 360);
  vertex(285, 360);
  vertex(280, 300);
  vertex(450, 410);
  vertex(450, 450);
  endShape(CLOSE); 
}


void draw() {
  
  //face
  beginShape();
  fill(0, 102, 51);
  stroke(255);
  strokeWeight(2);
  ellipse(222, 200, 190, 250);  
  endShape(CLOSE);

  //left ear
  noStroke();
  rotate(-.1);
  fill(0, 102, 51);
  ellipse(103, 205, 20, 70); 

  //left ear shading
  fill(0);
  rotate(.3);
  ellipse(148, 144, 6, 25);

  rotate(.3);
  ellipse(200, 115, 12, 20);

  rotate(-.5);
  quad(120, 200, 127, 213, 133, 213, 127, 198);

  //right ear
  fill(0, 102, 51);
  ellipse(320, 200, 20, 70); 

  //right ear shading
  rotate(-.10);
  fill(0);
  ellipse(305, 210, 6, 15);

  rotate(.10);
  triangle(320, 195, 330, 205, 320, 215);

  //hair
  fill(0);
  noStroke();
  triangle(120, 180, 120, 120, 150, 120);
  arc(220, 120, 200, 120, PI, TWO_PI);
  triangle(320, 120, 300, 120, 320, 180);
  rotate(-.4);
  rect(225, 225, 19, 19);
  rotate(.4);
  rect(120, 159, 12, 25);

  //forehead dot
  ellipse(180, 130, 3.5, 3.5);

  //left eyebrow
  bezier(150, 165, 143, 158, 200, 135, 200, 165);

  //right eyebrow
  arc(250, 165, 20, 15, PI, TWO_PI);

  //left eye
  rotate(-.15);
  ellipse(148, 208, 50, 30);
 //pushmatrix
 //popmatrix
 //can call these around transformation calls and all will be isolated

//right eye
rotate(.25);
arc(275, 160, 40, 20, PI/2, PI+HALF_PI);
rotate(-.1);
quad(257, 185, 269, 190, 271, 188, 257, 180);

//mouth
quad(170, 250, 200, 270, 205, 268, 205, 247);
quad(205, 247, 205, 255, 235, 255, 215, 247);
quad(200, 270, 200, 265, 235, 265, 235, 270);
quad(235, 270, 235, 265, 252, 255, 263, 255);


  //random circles around nose
beginShape();
  fill(0);
for (int i=0; i<100; ++i){
 ellipse(random(170, 220), random(200, 250), 5, 5);
}
endShape(CLOSE);

//random circles around chin
beginShape();
  fill(0);
  
for (int i=0; i<100; ++i){
 ellipse(random(170, 220), random(300, 330), 15, 15);
}
endShape(CLOSE);


shirt();

}

