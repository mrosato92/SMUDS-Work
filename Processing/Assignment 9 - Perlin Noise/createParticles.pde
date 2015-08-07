//Create array of particles
void createParticles() {
  particles = new ArrayList<Particle>();
  //random particle disposition 
  while (particles.size () < totalParticles) {
    Particle p = new Particle();
    particles.add(p);
  }
}
