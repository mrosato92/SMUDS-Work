//Perlin Noise Demo: http://natureofcode.com/book/introduction/

Text3D tx;
//Set base PVector
PVector base = new PVector(random(100), random(100), random(100));
//Set initial noise speed - closest to 0 = most restrictive boundaries, which is a good thing
PVector noiseSpeed = new PVector(random(-.01, .01), random(-.01, .01), random(-.01, .01));
//Number of particles to include
int totalParticles = 2500;
//Make array of particles
ArrayList<Particle> particles = new ArrayList<Particle>();
//Array for updating pixels
int[] pxarray;
//Adjusts smoothness of noise sequence.  Larger value = smoother
float zoom = 100;
//Mode booleans, toggled using keys
Boolean noiseOn = true;
Boolean stuckMode = true;



void setup() {
  size(600, 600, P3D);
  //Input initial string
  tx = new Text3D();
  //Makes particles more visible
  strokeWeight(2);
}

void draw() { 
  background(35);
  lights();
  translate(width/2, height/2);

  //Rotate the text using mouse
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, -PI, PI));

  //Update locations of each particle based on actions
  for (int i=0; i<totalParticles; i++) {
    Particle p = particles.get(i);
    p.updatePoints();
  }
  base.add(noiseSpeed);
}


