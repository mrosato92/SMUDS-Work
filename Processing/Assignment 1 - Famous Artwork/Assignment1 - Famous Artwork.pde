void setup(){
  int backgroundWidth = 500;
  int backgroundHeight = 487;
 size(backgroundWidth, backgroundHeight);
background(255); 

//set initial stroke weight and color
strokeWeight(3.5);
stroke(60);

//A1 black
float blackColor = 30;
fill(blackColor);
float a1BlackHeight = 113;
float a1BlackWidth = 30;
rect(0, 0, a1BlackWidth, a1BlackHeight);

//A2 grey horizontal
float a2GreyHeight = 20;
float a2GreyWidth = 150;
float greyColor = 200;
fill(greyColor);
rect(a1BlackWidth, 0, a2GreyWidth, a2GreyHeight);

//A2 burgundry
float a2BurgundyWidth = 60;
fill(215, 40, 40);
rect(a1BlackWidth, a2GreyHeight, a2BurgundyWidth, a1BlackHeight - a2GreyHeight);

//A2 off-white
float offWhite = 230;
fill(offWhite);
rect(a1BlackWidth + a2BurgundyWidth, a2GreyHeight, a2GreyWidth - a2BurgundyWidth, a1BlackHeight - a2GreyHeight);

//A3 off-white
fill(offWhite);
float a30OWWidth = 130;
float a30OWHeight = 77;
rect(a1BlackWidth + a2GreyWidth, 0, a30OWWidth, a30OWHeight);

//A3 yellow
fill(240, 230, 50);
rect(a1BlackWidth + a2GreyWidth, a30OWHeight, a30OWWidth, a1BlackHeight - a30OWHeight);

//A4 gray
fill(greyColor);
rect(a1BlackWidth + a2GreyWidth + a30OWWidth, 0, a30OWWidth, a30OWHeight);

//A4 blue
fill(70, 70, 180);
rect(a1BlackWidth + a2GreyWidth + a30OWWidth, a30OWHeight, a30OWWidth, a1BlackHeight - a30OWHeight);

//A5 yellow
fill(240, 230, 50);
float a5YellowWidth = 58;
rect(a1BlackWidth + a2GreyWidth + a30OWWidth + a30OWWidth, 0, a5YellowWidth, a1BlackHeight);

//B1 off white
fill(offWhite);
float b1OWHeight = 194;
rect(0, a1BlackHeight, a1BlackWidth, b1OWHeight);

//B2 blue
fill(70, 70, 180);
float b2BlueHeight = 107;
rect(a1BlackWidth, a1BlackHeight, a2GreyWidth, b2BlueHeight);

//B2 Black
fill(blackColor);
rect(a1BlackWidth, a1BlackHeight + b2BlueHeight, a2GreyWidth, b1OWHeight - b2BlueHeight);

//B3 Yellow
fill(240, 230, 50);
rect(a1BlackWidth + a2GreyWidth, a1BlackHeight, a30OWWidth, b2BlueHeight);

//B3 off white
fill(offWhite);
rect(a1BlackWidth + a2GreyWidth, a1BlackHeight + b2BlueHeight, a30OWWidth, b1OWHeight - b2BlueHeight);

//B4 grey
fill(greyColor);
rect(a1BlackWidth + a2GreyWidth + a30OWWidth, a1BlackHeight, a30OWWidth, b2BlueHeight);

//BC4 black
fill(blackColor);
float bc4BlackHeight = 167;
rect(a1BlackWidth + a2GreyWidth + a30OWWidth, a1BlackHeight + b2BlueHeight, a30OWWidth, bc4BlackHeight);

//BC5 burgundy
fill(215, 40, 40);
rect(a1BlackWidth + a2GreyWidth + a30OWWidth + a30OWWidth, a1BlackHeight, a5YellowWidth / 2, b2BlueHeight + bc4BlackHeight);

//BC5 off white
fill(offWhite);
rect(a1BlackWidth + a2GreyWidth + a30OWWidth + a30OWWidth + (a5YellowWidth / 2), a1BlackHeight, a5YellowWidth / 2, b2BlueHeight + bc4BlackHeight);

//D1 grey
fill(greyColor);
float d1GreyHeight = 112;
rect(0, a1BlackHeight + b2BlueHeight + (b1OWHeight - b2BlueHeight), a1BlackWidth + a2BurgundyWidth, d1GreyHeight);

//E1 off white
fill(offWhite);
rect(0, a1BlackHeight + b2BlueHeight + (b1OWHeight - b2BlueHeight) + d1GreyHeight, a1BlackWidth + a2BurgundyWidth, backgroundHeight - (a1BlackHeight + b2BlueHeight + (b1OWHeight - b2BlueHeight) + d1GreyHeight));

//D2 burgundy
fill(215, 40, 40);
float e4YellowHeight = 70;
rect(a1BlackWidth + a2BurgundyWidth, a1BlackHeight + b2BlueHeight + (b1OWHeight - b2BlueHeight), a2GreyWidth - a2BurgundyWidth, (bc4BlackHeight - (b1OWHeight - b2BlueHeight)) + (e4YellowHeight));

//E2 black
fill(blackColor);
rect(a1BlackWidth + a2BurgundyWidth, a1BlackHeight + b2BlueHeight + bc4BlackHeight + e4YellowHeight, (a2GreyWidth - a2BurgundyWidth) + a30OWWidth, backgroundHeight - (b2BlueHeight + bc4BlackHeight + a1BlackHeight - e4YellowHeight));

//D3 off white
fill(offWhite);
rect(a1BlackWidth + a2GreyWidth, a1BlackHeight + b2BlueHeight + (b1OWHeight - b2BlueHeight), a30OWWidth, bc4BlackHeight - (b1OWHeight - b2BlueHeight));

//E3 blue
fill(70, 70, 180);
rect(a1BlackWidth + a2GreyWidth, a1BlackHeight + b2BlueHeight + bc4BlackHeight, a30OWWidth, e4YellowHeight);

//E4 yellow
fill(240, 230, 50);
rect(a1BlackWidth + a2GreyWidth + a30OWWidth, a1BlackHeight + b2BlueHeight + bc4BlackHeight, a30OWWidth, e4YellowHeight);

//E4 grey
fill(greyColor);
rect(a1BlackWidth + a2GreyWidth + a30OWWidth, a1BlackHeight + b2BlueHeight + bc4BlackHeight + e4YellowHeight, a30OWWidth, backgroundHeight - (b2BlueHeight + bc4BlackHeight + a1BlackHeight - e4YellowHeight));

//E5 off white
fill(offWhite);
rect(a1BlackWidth + a2GreyWidth + a30OWWidth + a30OWWidth, a1BlackHeight + b2BlueHeight + bc4BlackHeight, a5YellowWidth, backgroundHeight - (b2BlueHeight + bc4BlackHeight + a1BlackHeight));

}
