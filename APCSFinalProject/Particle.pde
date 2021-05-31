public class Particle{
  Point cor;
  Point vel;
  float radius;
  float mass;
  
  public Particle(float x, float y){
    cor = new Point(x, y);
    vel = new Point(0, 0);
    radius = 5;
    mass = 0.1;
  }
  
  public Particle(float x, float y, float r, float m){
    cor = new Point(x, y);
    vel = new Point(0, 0);
    radius = r;
    mass = m;
  }
  
  //For testing only
  public Particle(float x, float y, float vx, float vy, boolean type){
    if(type == true){
      cor = new Point(x, y);
      vel = new Point(vx, vy);
      radius = 5;
      mass = 0.1;
    }
  }
  
  public float getXcor(){
    return cor.getX();
  }
  
  public float getYcor(){
    return cor.getY();
  }
  
  public float getXvel(){
    return vel.getX();
  }
  
  public float getYvel(){
    return vel.getY();
  }
  
  public Point getCor() {
    return cor;
  }
  
  public Point getVel() {
    return vel;
  }

  public float getRadius(){
    return radius;
  }
  
  public float getMass(){
    return mass;
  }
  
  public void applyForce(float fx, float fy){
    float time = Stage.time;
    vel = vel.plus(new Point(time*fx/mass, time*fy/mass));
  }
  
  public void updatePosition(){
    float time = Stage.time;
    cor = cor.plus(new Point(time*vel.getX(), time*vel.getY()));
  }
  
  public void bounceFloor(){
    if(cor.getY()+radius > height){
      cor.setY(height - radius);
      vel.setY(-vel.getY());
    }
  }
  
  public void display(){
    stroke(0);
    fill(#5582FF); //Light blue
    circle(cor.getX(), cor.getY(), 2*radius);
  }
  
  public void collideParticle(Particle other){
    if(sq(radius + other.radius) >= cor.distsq(other.cor)){
      other.cor = other.cor.minus(this.cor).scale((radius + other.radius) / cor.dist(other.cor)).plus(this.cor);
      Point parallelVel1 = vel.components(other.cor.minus(this.cor))[0];
      Point parallelVel2 = other.vel.components(this.cor.minus(other.cor))[0];
      Point normalVel1 = vel.components(other.cor.minus(this.cor))[1];
      Point normalVel2 = other.vel.components(this.cor.minus(other.cor))[1];
      float m1 = mass;
      float m2 = other.mass;

      vel = parallelVel1.scale((m1 - m2) / (m1 + m2)).plus(parallelVel2.scale(2 * m2 / (m1 + m2))).plus(normalVel1);
      other.vel = parallelVel2.scale((m2 - m1) / (m1 + m2)).plus(parallelVel1.scale(2 * m1 / (m1 + m2))).plus(normalVel2);
    }
  }
}
