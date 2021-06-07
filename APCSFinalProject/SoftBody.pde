public class SoftBody{
  ArrayList<Particle> particleArr;
  ArrayList<Spring> springArr;
  
  public SoftBody(){
    particleArr = new ArrayList<Particle>(0);
    springArr = new ArrayList<Spring>(0);
  }
  
  public SoftBody(float x, float y, float l, float w, float d, float k){
    particleArr = new ArrayList<Particle>();
    springArr = new ArrayList<Spring>();
    float gap = 20 / d;
    for(float i = x; i <= x + l; i += gap){
      for(float j = y; j <= y + w; j += gap){
        particleArr.add(new Particle(i,j));
      }
    }
    int numRow = 1 + int(w / gap);
    for(int i = 1; i < particleArr.size(); i++){
      if(i % numRow != 0){
        springArr.add(new Spring(particleArr.get(i-1), particleArr.get(i), k));
      }
    }
    for(int i = numRow; i < particleArr.size(); i++){
        springArr.add(new Spring(particleArr.get(i - numRow), particleArr.get(i), k));
    }
    for (int i = numRow; i < particleArr.size(); i++) {
      if (i%numRow != 0) 
        springArr.add(new Spring(particleArr.get(i), particleArr.get(i-numRow-1), k));
    }
    for (int i = numRow; i < particleArr.size(); i++) {
      if (i%numRow != numRow-1)
        springArr.add(new Spring(particleArr.get(i), particleArr.get(i-numRow+1), k));
    }
  }
  
  public void updateSprings(){
    for (Spring s : springArr) s.updateForce();
  }
  
  public void updateParticles(){
    for(int i = 0; i < particleArr.size(); i++){
      Particle p = particleArr.get(i);
      for(int j = 0; j < i; j++){
        Particle p2 = particleArr.get(j);
        if (p.getYcor()>p2.getYcor()) p.collideParticle(p2);
        else p2.collideParticle(p);
      }
      p.applyForce(0, p.getMass()*Stage.g);
      for (RigidBody r : Stage.rigidBodies) r.collide(p);
      p.updatePosition();
      p.bounceFloor();
      p.applyAirFriction();
    }
  }
  
  public void display(){
    for(Spring s : springArr){
      s.display();
    }
    ArrayList<Point> coords = new ArrayList<Point>();
    for(Particle p : particleArr){
      p.display();
      coords.add(p.cor);
    }
    RigidBody outline = new RigidBody(new Point().convexHull(coords));
    outline.display();
  }
  
  public void addParticle(float x, float y){
    particleArr.add(new Particle(x,y));
  }
  
  public void addSpring(Particle p1, Particle p2, float k){
    springArr.add(new Spring(p1,p2,k));
  }
}
