void drawXLabels() {
  fill(255);
  textSize(10);
  textAlign(CENTER);
  stroke(150);
  
  //VERTICAL LINES AT 30 TRADING DAY INTERVALS
  for(int i=0; i < dataLen; i+=30) {
    int x = int(map(i, 1, dataLen, width/12, (width/12)*11));
    text(i, x, (height/12*11)+10);
    line(x, PY1, x, PY2);
  }
  

}
