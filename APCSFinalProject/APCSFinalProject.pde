import java.io.*;
import java.lang.*;
import java.util.*;
Display d;
PFont sen;

void setup() {
  frameRate(200);
  size(1000, 600);
  sen = createFont("Sen-Regular.ttf", 6);
  textFont(sen);
  d = new Display();
  d.displaySetup();
  Stage.updateTime();
  Stage.updateGravity(100);
  Stage.updateAirFriction(1);
  Stage.updateAtmPressure(1);
}

void draw() {
  background(230);
  Stage.updateTime();
  d.displayUpdate();
} //<>//

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
        q.setVel(q.vel.plus(dP));
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
    } //<>//
  } //<>//
}

void mouseClicked(){
  if(d.type == HOME){
    if(mouseY >= 100){
      if(mouseX <= 500){
        if(mouseY <= 350){
          d.changeType(DEMO1);
          d.displaySetup();
        }
        else{
          d.changeType(DEMO3);
          d.displaySetup();
        }
      }
      else{
        if(mouseY <= 350){
          d.changeType(DEMO2);
          d.displaySetup();
        }
        else{
          d.changeType(LAB);
          d.displaySetup();
        }
      }  
    }
  }
  else{
    if((mouseX >= 25 && mouseX<= 125) && (mouseY >= 25 && mouseY<= 65)){
      d.changeType(HOME);
      d.displaySetup();
    }
    if((mouseX >= 25 && mouseX<= 125) && (mouseY >= 75 && mouseY<= 115)){
      d.resetparams=false;
      d.displaySetup();
    }
    if((mouseX >= 830 && mouseX<= 870) && (mouseY >= 25 && mouseY<= 65)){
      d.object = SB;
      if (d.type==LAB) d.x1=d.x2=810;
    }
    if((mouseX >= 880 && mouseX<= 920) && (mouseY >= 25 && mouseY<= 65)){
      d.object = B;
      if (d.type==LAB) d.x1=d.x2=810;
    }
    if((mouseX >= 930 && mouseX<= 970) && (mouseY >= 25 && mouseY<= 65)){
      d.object = RB;
      if (d.type==LAB) d.x1=d.x2=810;
    }
  }
}

void keyPressed(){
  if (key == ','){
    for (SoftBody s : Stage.softBodies) {
      if(s instanceof Balloon){
        Balloon b = (Balloon) s;
        b.addMols(3);
      }
    }  
  }
  else if (key == '.'){
    for (SoftBody s : Stage.softBodies) {
      if(s instanceof Balloon){
        Balloon b = (Balloon) s;
        b.addMols(-3);
      }
    }  
  }
  else if (key == 'x'){
    if(d.type == LAB && mouseX <= 800){
      if(d.object == SB){
        float y = mouseY;
        if(mouseY + d.cwidth + 5 > height){
          y = height - d.cwidth - 5;
        }
        addSoftBody(mouseX, y, d.clength, d.cwidth, 1, 70);
      }
      if(d.object == B){
        float y = mouseY;
        if(mouseY + d.cradius + 5 > height){
          y = height - d.cradius - 5;
        }
        addBalloon(10, sq(d.cradius) * PI, 15, mouseX, y, 50);
      }
      if(d.object == RB){
        float y = mouseY;
        if(mouseY + d.cwidth + 5 > height){
          y = height - d.cradius - 5;
        }
        boolean overlap = false;
        ArrayList<Point> vertices = new ArrayList<Point>(0);
        vertices.add(new Point(mouseX, y));
        vertices.add(new Point(mouseX + d.clength, y));
        vertices.add(new Point(mouseX + d.clength, y + d.cwidth));
        vertices.add(new Point(mouseX, y + d.cwidth));
        for(SoftBody sb : Stage.softBodies){
          for(Particle p0 : sb.particleArr){
            Point p = p0.cor;
            boolean inHull = true;
            for (int i = 0; i < vertices.size(); i++) {
              Point p1 = vertices.get(i); 
              Point p2 = vertices.get((i+1)%vertices.size());
              Point p3 = vertices.get((i+2)%vertices.size());
              if (p1.orientation(p2, p)!=0 && p1.orientation(p2, p)!=p1.orientation(p2, p3)) inHull=false;
            }
            if(inHull == true){
              overlap = true;
            }
          }
        }
        
        if(!overlap){
          addRigidBody(new float[][]{{mouseX, y}, {mouseX + d.clength, y}, {mouseX + d.clength, y + d.cwidth}, {mouseX, y + d.cwidth}});
        }
    
      }
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
    if(s instanceof Balloon){
      Balloon b = (Balloon) s;
      b.updateArea();
      b.updatePressure();
      b.applyAirPressure();
    }
  }
  updateParticleCollide();
  for (SoftBody s : Stage.softBodies) s.display();
}

void addBalloon(float m, float a, int n, float x, float y, float k) {
  Stage.softBodies.add(new Balloon(m,a,n,x,y,k));
}

void addRigidBody(float[][] coords) {
  Stage.rigidBodies.add(new RigidBody(coords));
}

void addRigidBody(float[] coords) {
  Stage.rigidBodies.add(new RigidBody(coords));
}

void displayRigidBodies() {
  for (RigidBody r : Stage.rigidBodies) r.display();
}

void updateParticleCollide(){
  for(int i = 0; i < Stage.softBodies.size(); i++)
    for(int j = 0; j <= i; j++)
      for(Particle p1 : Stage.softBodies.get(i).particleArr)
        for(Particle p2 : Stage.softBodies.get(j).particleArr)
          if (p1.getYcor()>p2.getYcor()) p1.collideParticle(p2);
          else p2.collideParticle(p1);
}
