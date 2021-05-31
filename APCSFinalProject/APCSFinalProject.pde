Particle p1, p2, p3, p4, p5, p6;
Spring s1;
SoftBody sb1;
void setup(){
  size(1000, 600);
  p1 = new Particle(500,400);
  p2 = new Particle(530,480);
  p3 = new Particle(600, 100, 40, 40, true);
  p4 = new Particle(600, 200, 40, 0, true);
  p5 = new Particle(600, 50, 50, 0.1);
  p6 = new Particle(600, 75, 50, 0.1);
  s1 = new Spring(p1, p2, 1, 110);
  s1.display();
  p1.display();
  p2.display();
  p3.display();
  p4.display();
  p5.collideParticle(p6);
  println(p6.getYcor());
  sb1 = new SoftBody(25,25,200,300,0.5,10);
  sb1.display();
  Stage.updateTime();
  Stage.updateGravity(50);
  println(new Point(2, 3).reflect(new Point(1, 0)));
}

void draw(){
  background(200);
  Stage.updateTime();
  s1.updateForce();
  p1.updatePosition();
  p2.updatePosition();
  p3.updatePosition();
  p4.updatePosition();
  s1.display();
  p1.display();
  p2.display();
  p3.display();
  p4.display();
  p3.collideParticle(p4);
  sb1.updateSprings();
  sb1.updateParticles();
  sb1.display();
}
