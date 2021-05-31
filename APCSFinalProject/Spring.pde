public class Spring{
  
  private Particle p1, p2;
  private float restLen, springConstant, dampening;
  
  public Spring(Particle p1, Particle p2, float k) {
    this.p1=p1;
    this.p2=p2;
    springConstant=k;
    restLen = dist(p1.getXcor(), p1.getYcor(), p2.getXcor(), p2.getYcor());
    dampening=0.5;
  }
  
  public Spring(Particle p1, Particle p2, float k, float len) {
    this.p1=p1;
    this.p2=p2;
    springConstant=k;
    restLen=len;
    dampening=0.5;
  }
  
  public Particle getP1() {
    return p1;
  }
  
  public Particle getP2() {
    return p2;
  }
  
  public float getRestLen() {
    return restLen;
  }
  
  public float getSpringConstant() {
    return springConstant;
  }
  
  public void updateForce() {
    float curDist = p1.getCor().dist(p2.getCor());
    float kx = springConstant * (curDist - restLen);
    Point norm = p2.getCor().minus(p1.getCor()).normalize();
    Point f1 = norm.scale(kx + dampening*norm.dot(p2.getVel().minus(p1.getVel())));
    p1.applyForce(f1.getX(), f1.getY());
    p2.applyForce(-f1.getX(), -f1.getY());
    //p1.applyForce(kx * (p2.getXcor()-p1.getXcor())/curDist, kx * (p2.getYcor()-p1.getYcor()) / curDist);
    //p2.applyForce(kx * (p1.getXcor()-p2.getXcor())/curDist, kx * (p1.getYcor()-p2.getYcor()) / curDist);
  }
  
  public void display(){
    stroke(0);
    line(p1.getXcor(), p1.getYcor(), p2.getXcor(), p2.getYcor());
  }
}
