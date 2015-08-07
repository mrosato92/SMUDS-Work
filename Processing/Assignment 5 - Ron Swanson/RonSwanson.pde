//MARK ROSATO
//ASSIGNMENT 5: IMAGING VISUALIZATION
//EXPLODING RON SWANSON

//SET INITIAL VARIABLES
PImage img;

//FOR 3D MAPPING
int rectsize = 3;
int col, row;
void setup() {
  img = loadImage("swansonpic.jpg");
  size(img.width,img.height,P3D);
  image(img, 0, 0);
  frameRate(15);
  col = width/rectsize;
  row = height/rectsize;
}

void draw(){
  //BACKGROUND GETS PROGRESSIVELY DARKER, THEN REDDER
  if(frameCount <= 30) {
    loadPixels();
    for(int i=0; i<pixels.length; i++) {
      //BACKGROUND INCREMENTALLY GETS DARKER
      if(frameCount < 20) {
        float r = red(pixels[i]);
        float g = green(pixels[i]);
        float b = blue(pixels[i]);
        b *= .95;
        g *= .95;
        r *= .95;
        pixels[i] = color(r, g, b);
      }
      //BACKGROUND INCREMENTALLY GETS REDDER
      if(frameCount > 20 && frameCount < 30) {
        float r = red(pixels[i]);
        float g = green(pixels[i]);
        float b = blue(pixels[i]);
        r *= 1.08;
        pixels[i] = color(r, g, b);
      }  
    } 
  }
  //BACKGROUND BLURS
  if(frameCount > 30 && frameCount < 50) {
    filter(BLUR, 0.7);
   }
   //BACKGROUND INVERTS ITSELF, ACTING AS A TIMER
  if(frameCount > 50 && frameCount < 71) {
    filter(INVERT); 
  }
  //UPDATE PIXELS BEFORE 3D MAPPING
  updatePixels();

  if(frameCount > 71){
    //PIXEL MAPPING
    for (int i=0; i<col; i++ ) {
      for (int j=0; j<row; j++ ) {
      int x = i*rectsize + rectsize/2;
      int y = j*rectsize + rectsize/2;
      //PIXEL LOCATION
      int loc = x + y*width;     
      //GRAB CURRENT PIXEL COLORS  
      color c = pixels[loc];     

      //CALCULATE Z POSITION FOR EACH PIXEL
      //USE BRIGHTNESS TO DETERMINE Z LOCATION
      //BRIGHTER COLOR = CLOSER TO OUR EYES, HIGHER BRIGHTNESS VALUE
      float z = (mouseX/(float)width) * brightness(img.pixels[loc]);
      
      pushMatrix();
      //TRANSLATE TO CORRECT LOCATION
      //HIGHER Z = CLOSER TO SCREEN
      translate(x,y,z); 
      //INSERT PIXEL COLOR
      fill(c);
      //NO STROKE, SO THAT PIXELS DO NOT HAVE BORDERS
      noStroke();
      //INSERT RECTANGLES
      rect(0,0,rectsize,rectsize);
      popMatrix();
      }
    }
  }
}
