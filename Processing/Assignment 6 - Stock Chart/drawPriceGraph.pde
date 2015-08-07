//DRAW STOCK PRICE CHART
void drawPriceGraph(float[] dataOrdered, float PYMin, float PYMax) {
  stroke(0);
 beginShape();
  for(int i=0; i< dataOrdered.length; i++) {
    float x = map(i, 0, dataOrdered.length-1, PX1, PX2);
    float y = map(dataOrdered[i], PYMin, PYMax, PY2, PY1);
    curveVertex(x, y);
  }
 endShape();
}
