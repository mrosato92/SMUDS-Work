//MARK ROSATO
//ASSIGNMENT 6: NET VISUALIZATION
//Adapted from Ira's Stock Example in his textbook
//I am charting TWOU's stock price from IPO to date

//File Import Specs
//Date  Open  High  Low  Close  Volume  Adj Close

//INITIALIZE VARIABLES
float[] closePrice;
float[] volume;
float minPrice, maxPrice;
float minVolume, maxVolume;
float minDate, maxDate;
float PX1, PY1, PX2, PY2;
float VX1, VY1, VX2, VY2;
float dataLen;

void setup() {
  
  //SET DIMENSIONS FOR BOTH CHARTS
  size(800, 600);
  PX1 = width/12; 
  PY1 = height/12;
  PX2 = width - (width/12); 
  PY2 = height - (height/4);
  VX1 = width/12; 
  VY1 = height/4;
  VX2 = width - (width/12); 
  VY2 = height - (height/12);
//could lose precision here - integer division
  
  //IMPORT DATA FROM YAHOO FINANCE API.  REMOVE HEADER ROW AND ORDER BY DATE ASCENDING
  String[] data = loadStrings("http://ichart.yahoo.com/table.csv?s=TWOU&a=0&b=1&c=2014");
  String[] dataSub = subset(data, 1, data.length-1);
  String[] dataOrdered = reverse(dataSub);
  dataLen = dataOrdered.length;
  
  //INITIALIZE ARRAYS FOR CLOSE PRICE AND VOLUME - WHICH ARE BEING CHARTED
  closePrice = new float[dataOrdered.length];
  volume = new float[dataOrdered.length];
  
  //POPULATE CLOSE PRICE AND VOLUME INFO
  for (int i=0; i < dataOrdered.length; i++) {
    String[] columns = split(dataOrdered[i], ",");
    //choose column to determine what you want to view
    //1 = open price, 2 = high, 3 = low, 4 = close price, 5 = volume
    closePrice[i] = float(columns[4]);
    volume[i] = float(columns[5]);
   }
  
  //SET MIN AND MAX CLOSE PRICE AND VOLUME
  minPrice = min(closePrice);
  maxPrice = max(closePrice);
  minVolume = min(volume);
  maxVolume = max(volume);

  background(50);
  
  //DRAW WHITE RECTANGLES FOR PRICE AND VOLUME CHARTS
  //RECT MODE CORNERS INTERPRETS RECTANGLE PARAMETERS AS OPPOSITE CORNERS
  rectMode(CORNERS);
  noStroke();
  fill(255);
  rect(PX1, PY1, PX2, PY2);
  rect(VX1, VY1, VX2, VY2);
  
  //TITLE THE CHART
  textSize(25);
  textAlign(CENTER);
  stroke(255);
  text("TWOU Price + Volume History Since IPO", width/2, 30);
  textSize(18);
  text("Trading Days Since IPO", width/2, height-10);
  textAlign(RIGHT);
  textSize(14);
  text("Source - Yahoo Finance API",width-10, height-5);
  
  //FUNCTIONS TO DRAW PRICE AND VOLUME CHARTS
  drawPriceGraph(closePrice, minPrice, maxPrice);
  drawVolGraph(volume, minVolume, maxVolume);
  
  //DRAW X AND Y AXIS LABELS
  drawYLabels();
  drawXLabels();
  
  //20 DAY MOVING AVERAGE
  movingAverage(closePrice, minPrice, maxPrice, 20, 255, 0, 0);
  fill(255,0,0);
  textSize(12);
  text("SMA20", (width/12*11)+30, (height/12)+40);
  
  //50 DAY MOVING AVERAGE
  movingAverage(closePrice, minPrice, maxPrice, 50, 0, 255, 0);
  fill(0,255,0);
  textSize(12);
  text("SMA50", (width/12*11)+30, (height/12)+70);
  
  //200 DAY MOVING AVERAGE
  movingAverage(closePrice, minPrice, maxPrice, 200, 0, 0, 255);
  fill(0, 0, 255);
  textSize(12);
  text("SMA200", (width/12*11)+35, (height/12)+200);
}

