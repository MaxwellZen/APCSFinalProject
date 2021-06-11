public class Particle{
  Point cor;
  Point vel;
  float radius;
  float mass;
  
  public Particle(float x, float y){
    cor = new Point(x, y);
    vel = new Point(0, 0);
    radius = 7;
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
  
  public void setCor(Point c) {
    cor = c;
  }
  
  public void setVel(Point v) {
    vel = v;
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
    noStroke();
    fill(#0044ff);
    circle(cor.getX(), cor.getY(), 2*radius);
  }
  
  public void collideParticle(Particle other){
    if (cor.distsq(other.cor)==0) return;
    if(sq(radius + other.radius) >= cor.distsq(other.cor)){
      other.cor = other.cor.minus(this.cor).scale((radius + other.radius) / cor.dist(other.cor)).plus(this.cor);
      Point diff = other.cor.minus(this.cor);
      Point[] comp1 = vel.components(diff);
      Point[] comp2 = other.vel.components(diff);
      float m1 = mass;
      float m2 = other.mass;
      float invsum = 1 / (m1+m2);

      vel = comp1[0].scale((m1 - m2) * invsum).plus(comp2[0].scale(2 * m2 * invsum)).plus(comp1[1]);
      other.vel = comp2[0].scale((m2 - m1) * invsum).plus(comp1[0].scale(2 * m1 * invsum)).plus(comp2[1]);
    }
  }
  
  public void applyAirFriction(){
    applyForce(-vel.getX() * Stage.airFriction * 0.005, -vel.getY() * Stage.airFriction * 0.005);
  }
}
