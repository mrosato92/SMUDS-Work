void movingAverage(float[] dataOrdered, float PYMin, float PYMax, int sma, float r, float g, float b) {
  noFill();
  stroke(r, g, b);
  strokeWeight(1);
  beginShape();
  //CALCULATE SUM PER DAY THAT SHOULD BE COUNTED FOR MOVING AVERAGE
  for(int i=sma-1; i < dataOrdered.length; i++) {
    float sum = 0;
    for (int j=i-(sma-1); j<=i; j++) {
    sum += dataOrdered[j];
  }
   
  //CALCULATE MOVING AVERAGE AND MAP IT ONTO CHART
  float MA = sum/sma;
  float x = map(i, 0, dataOrdered.length-1, PX1, PX2);
  float y = map(MA, PYMin, PYMax, PY2, PY1);
  curveVertex(x, y);
  }
  endShape();
}
  
