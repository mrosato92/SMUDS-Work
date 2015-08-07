Text3D tx;
//Set initial PVector dimensions for noise
PVector base = new PVector(random(100), random(100), random(100)), 
noiseSpeed = new PVector(random(-.02, .02), random(-.02, .02), random(-.02, .02));
ArrayList<Particle> particles = new ArrayList<Particle>();
//Number of particles to include.  Would be cool to adjust so that each letter gets a certain number of particles
int[] pxarray;
float zoom = 100;
Boolean noiseOn = true;
Boolean stuckMode = true;

int totalParticles = 2500;

void setup() {
  size(600, 600, P3D);
  tx = new Text3D();
  strokeWeight(2);
}

void draw() { 
  background(35);
  lights();
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, PI, -PI));
  //rotateY(frameCount*PI/680);
  //rotateX(frameCount*PI/280);
  //rotateZ(frameCount*PI/580);

  for (int i=0; i<totalParticles; i++) {
    Particle p = particles.get(i);
    p.updatePoints();
  }
  base.add(noiseSpeed);
  
}

void createParticles()
{
  particles = new ArrayList<Particle>();
  //random particle disposition 
  while (particles.size () < totalParticles)
  {
    Particle p = new Particle(particles.size ());
    particles.add(p);
  }
}

void keyPressed(){
  //CODED means that the key is a recognizable one
  if (key != CODED){
    //Switch works like an if else, but is better when selecting between many alternatives
    switch(key) {
    //Toggle for noise mode - adjusts the Z axis
    case 'n':
      noiseOn = !noiseOn;
      break;
   //Toggle for stuck mode 
   case TAB:
      stuckMode = !stuckMode;
      if (!stuckMode)
        for (Particle p : particles) {
          p.speed.mult(-1);
        }
      break;
    //Do not ocnsider any of the characters below
    case ' ':
    case ESC:
    case ENTER:
    case DELETE:
    case BACKSPACE:
      break;
    //Default action upon key switch -> display key pressed
    default:
      tx.process("" + key);
      break;
    }
  }
}

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

  Particle(int p_rank) {
    rank = p_rank;
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
    speed.mult(random(min_speed, max_speed) * (random(-1,1)));
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
      speed.mult(random(min_speed,max_speed));
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
    stroke(random(0,255), random(0,255), 255, 150);
    //Dividing by two for width and height translates the word to the center of the window
    point(position.x-width/2, position.y-height/2, position.z);
  }
}

class Text3D {  
  //PGraphics works like PImage - it will turn a string into a graphic
  PGraphics pg;

  Text3D() {
    //Construct a PGraphics object with beginning string
    pg = createGraphics(width, height, P3D);
    process(new String("RYAN"));
  }


  void process(String c) {
    //Draw string onto window
    pg.beginDraw();
    pg.translate(-width/2, -height/2);
    pg.background(0);
    pg.textSize(200);
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


