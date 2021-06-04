public class Balloon extends SoftBody{
  float mols;
  float area;
  int numParticles;
  float internalPressure;
  
  public Balloon(float m, float a, int n, float x, float y, float k){
    super();
    float gasConstant = 20;
    mols = m;
    area = a;
    numParticles = n;
    internalPressure = mols * gasConstant / area;
    
    float radius = sqrt(a / PI);
    if (y + radius > height){
      y = height - radius - 5;
    }
    
    for(float angle = 0; angle < TWO_PI; angle += TWO_PI / numParticles){
      addParticle(x + radius * cos(angle), y + radius * sin(angle));
    }
    
    for(int i = 0; i < particleArr.size(); i++){
      addSpring(particleArr.get(i), particleArr.get((i + 1) % particleArr.size()), k);
    }
  }
  
  public float getArea(){
    return area;
  }
  
  public float getInternalPressure(){
    return internalPressure;
  }
  
  public float getPerimeter(){
    float result = 0;
    for (int i = 0; i < particleArr.size(); i++){
      result += particleArr.get(i).getCor().dist(particleArr.get((i + 1) % particleArr.size()).getCor());
    }
    return result;
  }
  
}
