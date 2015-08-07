class Text3D {  
  //PGraphics works like PImage - it will turn a string into a graphic
  PGraphics pg;

  Text3D() {
    //Construct a PGraphics object with beginning string
    pg = createGraphics(width, height, P3D);
    process(new String("HELLO"));
  }


  void process(String c) {
    //Draw string onto window
    pg.beginDraw();
    pg.translate(-width/2, -height/2);
    pg.background(0);
    pg.textSize(150);
    pg.fill(color(250, 250, 250));
    pg.textAlign(CENTER, CENTER);
    pg.text(c, width, height);
    pg.translate(width/2, height/2);
    pg.endDraw();

    //Create pixel array and copy it
    pxarray = new int[width * height];
    pg.loadPixels();
    arrayCopy(pg.pixels, pxarray);
    pg.updatePixels();

    createParticles();
  }
}

