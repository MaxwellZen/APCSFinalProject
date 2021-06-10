public class Balloon extends SoftBody{
  float mols;
  float area;
  int numParticles;
  float internalPressure;
  
  public Balloon(float m, float a, int n, float x, float y, float k){
    super();
    float gasConstant = 5000000;
    mols = m;
    area = a;
    numParticles = n;
    internalPressure = mols * gasConstant / area;
    
    float radius = sqrt(2 * a / n / sin(TWO_PI / n));
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
  
  public void updateArea(){
    float result = 0;
    for(int i = 0; i < particleArr.size(); i++){
      Point p1 = particleArr.get(i).cor, p2 = particleArr.get((i+1)%particleArr.size()).cor;
      result += p1.x*p2.y - p1.y*p2.x;
    }
    area = abs(result) / 2;
  }
  
  public void updatePressure(){
    float gasConstant = 5000000;
    internalPressure = mols * gasConstant / area;
  }
  
  public void applyAirPressure(){
    for(int i = 0; i < particleArr.size(); i++){
      Particle p0 = particleArr.get(i);
      Particle p1 = particleArr.get(((i+1) % particleArr.size()));
      float dist = p0.getCor().dist(p1.getCor());
      float pressure = internalPressure / dist;
      p0.applyForce(p1.getCor().minus(p0.getCor()).scale(pressure / dist).getY(), p1.getCor().minus(p0.getCor()).scale(- 1 * pressure / dist).getX());
      p1.applyForce(p1.getCor().minus(p0.getCor()).scale(pressure / dist).getY(), p1.getCor().minus(p0.getCor()).scale(- 1 * pressure / dist).getX());
    }
  }
  
  public void addMols(float num){
    if(mols + num >= 0){
      mols += num;  
    }
  }
  
}
