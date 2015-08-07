void drawYLabels() {
  fill(255);
  textSize(10);
  textAlign(RIGHT);
  stroke(150);
    
  //HORIZONTAL LINES AT $1 INTERVALS
  for(float i=minPrice; i < maxPrice; i++) {
    float y = map(i, minPrice, maxPrice, PY2, PY1);
    line(PX1-5, y, PX2, y);
  }
    
  //DOLLAR VALUES FOR EVERY 5TH TICK
  for(float i=minPrice; i < maxPrice; i+=5) {
    float y = map(i, minPrice, maxPrice, PY2, PY1);
    text("$"+floor(i), PX1-10, y+3);
  }

}
