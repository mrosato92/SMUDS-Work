class Particle {
  //Min and max speeds that the particles can move about
  float min_speed = .1;
  float max_speed = .3;
  //Initial Z boundary
  float h = 30;
  PVector position;
  PVector origin;
  PVector speed;
  int rank;
  float n;
  //Stuck = against a boundary
  Boolean stuck = false;


  Particle() {
    initialize();
  }

  void initialize() {
    stuck = false;
    float theta1 = random(TWO_PI);
    float theta2 = random(TWO_PI);
    float theta3 = random(TWO_PI);
    //PVector initializes the three directions each particle will be moving
    speed = new PVector(theta1, theta2, theta3);
    //? works as a simplified if else
    //(expression) ? statement1 : statement2;
    speed.mult(random(min_speed, max_speed) * (random(-1, 1)));
    Boolean done = false;
    //DONE is used to initialize positions of each particle without repeating itself, since this is executed within void draw()
    while (!done) {
      position = new PVector(random(width), random(height));
      if (blue(pxarray[(int)position.y * width + (int)position.x]) > 200) {
        position.z = random(-h/2, h/2);
        origin = position.get();
        done = true;
      }
    }
  }

  void updatePoints() {

    //This is the bread and better of the program.
    //We begin with noise on and stuck mode on.
    //The noise toggle adjusts the Z-bounds of the particles.  It will spread the particles out and then back towards eachother.  This only works if stuck mode is off
    //When stuck mode is on, the particles will gravitate towards their boundary (as made by PGraphics).  When stuck mode is off, the particles will scatter randomly about their XYZ boundary (Z determined by noise)

    if (noiseOn && !stuck) {
      n = noise(base.x + position.x/zoom, base.y + position.y/zoom, base.z + position.z/zoom)*TWO_PI*2;
      speed.set(cos(n), sin(n), -cos(n));
      speed.mult(random(min_speed, max_speed));
    }

    if (!(stuck && stuckMode))
      position.add(speed);

    if (blue(pxarray[(int)position.y * width + (int)position.x]) < 200) {
      stuck = stuckMode;
      position.sub(speed);
      if (!stuckMode) {
        if (noiseOn) { 
          position = origin.get();
        } else {      
          speed.x *= -1;
          speed.y *= -1;
        }
      }
    }    

    //Generate random colors and plot points
    stroke(random(0, 255), random(0, 255), 255, 150);
    //Dividing by two for width and height translates the word to the center of the window
    point(position.x-width/2, position.y-height/2, position.z);
  }
}

