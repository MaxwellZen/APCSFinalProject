Particle p1, p2;
Spring s1;
SoftBody sb1;
void setup(){
  size(1000, 800);
  p1 = new Particle(500,400);
  p2 = new Particle(530,480);
  s1 = new Spring(p1, p2, 1, 110);
  s1.display();
  p1.display();
  p2.display();
  sb1 = new SoftBody(25,25,200,300,1,0.5);
  sb1.display();
  Stage.updateTime();
}

void draw(){
  background(200);
  Stage.updateTime();
  s1.updateForce();
  p1.updatePosition();
  p2.updatePosition();
  s1.display();
  p1.display();
  p2.display();
  sb1.updateSprings();
  sb1.updateParticles();
  sb1.display();
}
