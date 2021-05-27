public class SoftBody{
  ArrayList<Particle> particleArr;
  ArrayList<Spring> springArr;
  
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
    println(numRow);
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
    for (Particle p : particleArr) p.updatePosition();
  }
  
  public void display(){
    for(Spring s : springArr){
      s.display();
    }
    for(Particle p : particleArr){
      p.display();
    }
  }
}
