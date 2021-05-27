public class Spring{
  
  private Particle p1, p2;
  private float restLen, springConstant;
  
  public Spring(Particle p1, Particle p2, float k) {
    this.p1=p1;
    this.p2=p2;
    springConstant=k;
    restLen = dist(p1.getXcor(), p1.getYcor(), p2.getXcor(), p2.getYcor());
  }
  
  public Spring(Particle p1, Particle p2, float k, float len) {
    this.p1=p1;
    this.p2=p2;
    springConstant=k;
    restLen=len;
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
    float curDist = dist(p1.getXcor(), p1.getYcor(), p2.getXcor(), p2.getYcor());
    float kx = springConstant * (curDist - restLen);
    p1.applyForce(kx * (p2.getXcor()-p1.getXcor())/curDist, kx * (p2.getYcor()-p1.getYcor()) / curDist);
    p2.applyForce(kx * (p1.getXcor()-p2.getXcor())/curDist, kx * (p1.getYcor()-p2.getYcor()) / curDist);
  }
  
  public void display(){
    stroke(0);
    line(p1.getXcor(), p1.getYcor(), p2.getXcor(), p2.getYcor());
  }
}
