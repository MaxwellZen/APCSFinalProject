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
      Point p1 = particleArr.get(i).cor, p2 = particleArr.get((i+1)%particleArr.size()).cor;
      result += p1.x*p2.y - p1.y*p2.x;
      //result += particleArr.get(i).getXcor() * particleArr.get((i + 1) % particleArr.size()).getYcor();
      //if(i == 0){
      //  result -= particleArr.get(i).getXcor() * particleArr.get(particleArr.size() - 1).getYcor();
      //} 
      //else{
      //  result -= particleArr.get(i).getXcor() * particleArr.get(i - 1).getYcor();
      //}
    }
    area = abs(result) / 2;
  }
  
  public void updatePressure(){
    float gasConstant = 1;
    internalPressure = mols * gasConstant / area;
  }
  
  public void updateCenter(){
    Point center = new Point();
    for (Particle p : particleArr) center = center.plus(p.cor);
    center = center.scale(1.0 / numParticles);
    //Point result = new Point();
    //float m = 0;
    //for(int i = 1; i < particleArr.size()-1; i++){
    //  Point p1 = particleArr.get(0).cor, p2 = particleArr.get(i).cor, p3 = particleArr.get(i+1).cor;
    //  float triArea = 0;
    //  triArea += p1.x*p2.y - p1.y*p2.x;
    //  triArea += p2.x*p3.y - p2.y*p3.x;
    //  triArea += p3.x*p1.y - p3.y*p1.x;
    //  triArea = abs(triArea)/2.0;
    //  Point cent = p1.plus(p2).plus(p3).scale(1/3.0);
    //  float combined = triArea+m;
    //  if (combined != 0) result = result.scale(m/combined).plus(cent.scale(triArea/combined));
    //  m = combined;
    //}
    //center = result;
    //center = new Point(result.x, result.y);
    circle(center.x, center.y, 10);
    //area=m;
  }
  
  public void applyAirPressure(){
    textSize(20);
    text(internalPressure, 25, 25);
    text(area, 25, 50);
    for(Particle p : particleArr){
      if (p.cor.distsq(center)==0) continue;
      Point direction = p.cor.minus(center).normalize().scale(internalPressure - Stage.atmPressure);
      p.applyForce(direction.x, direction.y);
    }
  }
  
}
