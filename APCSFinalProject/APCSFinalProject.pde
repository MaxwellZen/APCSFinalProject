Particle p1, p2, p3, p4, p5, p6, p7, p8;
Spring s1;
Balloon b1;

void setup() {
  frameRate(200);
  size(1000, 600);
  p1 = new Particle(500, 400);
  p2 = new Particle(530, 480);
  p3 = new Particle(600, 100, 40, 40, true);
  p4 = new Particle(600, 200, 40, 0, true);
  p5 = new Particle(600, 50, 50, 0.1);
  p6 = new Particle(600, 75, 50, 0.1);
  p7 = new Particle(600, 400, 40, 0, true);
  p8 = new Particle(700, 400, 0, 0, true);
  s1 = new Spring(p1, p2, 1, 110);
  s1.display();
  p1.display();
  p2.display();
  p3.display();
  p4.display();
  p5.collideParticle(p6);
  println(p6.getYcor());
  addSoftBody(25, 25, 200, 300, 1, 60);
  addRigidBody(new float[][] {{0, 400}, {300, 420}, {300, 500}, {0, 500}});
  b1 = new Balloon(500000, 7500, 10, 500, 300, 50);
  b1.display();
  println(b1.getPerimeter());
  b1.updateArea();
  println(b1.getArea());
  b1.updateCenter();
  println(b1.getCenter());
  Stage.updateTime();
  Stage.updateGravity(100);
  Stage.updateAirFriction(1);
  Stage.updateAtmPressure(1);
  println(new Point(2, 3).reflect(new Point(1, 0)));
}

void draw() {
  //println(frameRate);
  background(230);
  Stage.updateTime();
  s1.updateForce();
  p1.updatePosition();
  p2.updatePosition();
  p3.updatePosition();
  p4.updatePosition();
  p7.updatePosition();
  p8.updatePosition();
  s1.display();
  p1.display();
  p2.display();
  p3.display();
  p4.display();
  p7.display();
  p8.display();
  p3.collideParticle(p4);
  p7.collideParticle(p8);
  updateSoftBodies();
  displayRigidBodies();
  b1.updateArea();
  b1.updateCenter();
  b1.updatePressure();
  b1.applyAirPressure(); //<>// //<>//
  b1.updateSprings();
  b1.updateParticles();
  b1.display();
}

void mouseDragged(){
  for(SoftBody sb : Stage.softBodies){
    for(Particle p : sb.particleArr){
      if(sq(mouseX - p.getXcor()) + sq(mouseY - p.getYcor()) < sq(p.radius)){
        for(Particle q : sb.particleArr){
          Point dP = new Point(mouseX - pmouseX, mouseY - pmouseY);
          if (q.cor.plus(dP).getY() < height){
            q.setCor(q.cor.plus(new Point(mouseX - pmouseX, mouseY - pmouseY)));
            q.setVel(q.vel.plus(new Point(mouseX - pmouseX, mouseY - pmouseY)));
          }
        }
      }
    }
  }
  for(RigidBody r : Stage.rigidBodies){
    if(r.inside(new Point(mouseX, mouseY))){
      for(int i  = 0; i < r.vertices.size(); i++){
        Point p = r.vertices.get(i);
        r.vertices.set(i, p.plus(new Point(mouseX - pmouseX, mouseY - pmouseY)));
      }
      r.minX += mouseX - pmouseX;
      r.maxX += mouseX - pmouseX;
      r.minY += mouseY - pmouseY;
      r.maxY += mouseY - pmouseY;
    }
  }
}

void addSoftBody(float x, float y, 
  float len, float wid, 
  float density, float springConstant) {
  Stage.softBodies.add(new SoftBody(x, y, len, wid, density, springConstant));
}

void updateSoftBodies() {
  for (SoftBody s : Stage.softBodies) {
    s.updateSprings();
    s.updateParticles();
    s.display();
  }
}

void addRigidBody(float[][] coords) {
  Stage.rigidBodies.add(new RigidBody(coords));
}

void displayRigidBodies() {
  for (RigidBody r : Stage.rigidBodies) r.display();
}
