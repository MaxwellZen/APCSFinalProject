import java.io.*;
import java.lang.*;
import java.util.*;
Balloon b1;
Display d;
int location = 0;
boolean needsetup = true;

void setup() {
  frameRate(200);
  size(1000, 600);
  d = new Display();
  b1 = new Balloon(10, 7500, 10, 500, 300, 50);
  b1.display();
  println(b1.getPerimeter());
  b1.updateArea();
  println(b1.getArea());
  Stage.updateTime();
  Stage.updateGravity(100);
  Stage.updateAirFriction(1);
  Stage.updateAtmPressure(1);
  println(new Point(3,4).pointToLine(new Point(1.5,2.5), new Point(4.5,5.5)));
}

void draw() {
  background(230);
  Stage.updateTime();
  if (location==0) {
    if (needsetup) {
      d.setup0();
      needsetup=false;
    }
    d.update0();
  }
  b1.updateArea(); //<>//
  b1.updatePressure();
  b1.applyAirPressure();
  b1.addMols(10);
  b1.updateSprings();
  b1.updateParticles();
  b1.display();
}

void mouseDragged(){
  for(SoftBody sb : Stage.softBodies){
    ArrayList<Point> coords = new ArrayList<Point>();
    for (Particle p : sb.particleArr) coords.add(p.cor);
    coords = new Point().convexHull(coords);
    RigidBody outline = new RigidBody(coords);
    if (outline.inside(new Point(mouseX, mouseY)))
      for(Particle q : sb.particleArr){
        Point dP = new Point(mouseX - pmouseX, mouseY - pmouseY);
        if (q.cor.plus(dP).getY() < height)
          q.setCor(q.cor.plus(dP));
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
      r.maxY += mouseY - pmouseY; //<>//
    } //<>//
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
