public class Balloon extends SoftBody{
  float mols;
  float area;
  int numParticles;
  float internalPressure;
  Point center;
  
  public Balloon(float m, float a, int n, float x, float y, float k){
    super();
    float gasConstant = 1;
    mols = m;
    area = a;
    numParticles = n;
    internalPressure = mols * gasConstant / area;
    
    float radius = sqrt(2 * a / n / sin(TWO_PI / n));
    if (y + radius > height){
      y = height - radius - 5;
    }
    
    center = new Point(x, y);
    
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
  
  public Point getCenter(){
    return center;
  }
  
  public void updateArea(){
    float result = 0;
    for(int i = 0; i < particleArr.size(); i++){
      result += particleArr.get(i).getXcor() * particleArr.get((i + 1) % particleArr.size()).getYcor();
      if(i == 0){
        result -= particleArr.get(i).getXcor() * particleArr.get(particleArr.size() - 1).getYcor();
      } 
      else{
        result -= particleArr.get(i).getXcor() * particleArr.get(i - 1).getYcor();
      }
    }
    area = abs(result) / 2;
  }
  
  public void updatePressure(){
    float gasConstant = 1;
    internalPressure = mols * gasConstant / area;
  }
  
  public void updateCenter(){
    Point result = new Point(0,0);
    for(int i = 0; i < particleArr.size(); i++){
      int triArea = 0;
      triArea += particleArr.get(i).getXcor() * particleArr.get((i+1) % particleArr.size()).getYcor();
      triArea += particleArr.get((i + 1) % particleArr.size()).getXcor() * center.getY();
      triArea += center.getX() * particleArr.get(i).getYcor();
      triArea -= particleArr.get(i).getXcor() * center.getY();
      triArea -= particleArr.get((i + 1) % particleArr.size()).getXcor() * particleArr.get(i).getYcor();
      triArea -= center.getX() * particleArr.get((i+1) % particleArr.size()).getYcor();
      triArea = abs(triArea) / 2;
      result.plus((particleArr.get(i).getCor().plus(particleArr.get((i+1) % particleArr.size()).getCor()).plus(center)).scale(1/3 * triArea / area));
    }
    center = result;
  }
  
  public void applyAirPressure(){
    for(Particle p : particleArr){
      p.applyForce(((internalPressure - Stage.atmPressure) / numParticles * getPerimeter()) * (p.getXcor() - center.getX()) / center.dist(p.getCor()), (internalPressure - Stage.atmPressure) / numParticles * getPerimeter() * (p.getYcor() - center.getY()) / center.dist(p.getCor()));
    }
  }
  
}
