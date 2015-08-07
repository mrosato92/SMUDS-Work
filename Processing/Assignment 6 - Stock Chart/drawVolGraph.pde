void drawVolGraph(float[] dataOrdered, float VYMin, float VYMax) {
  stroke(0);
  beginShape();
  for(int i=0; i< dataOrdered.length; i++) {
    float x = map(i, 0, dataOrdered.length-1, VX1, VX2);
    float y = map(dataOrdered[i], VYMin, VYMax, VY2, VY1);
    curveVertex(x, y); 
  }
  endShape();   
}
