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
  
}
