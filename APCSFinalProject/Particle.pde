public class Particle{
  Point cor;
  Point vel;
  float radius;
  float mass;
  
  public Particle(float x, float y){
    cor = new Point(x, y);
    vel = new Point(0, 0);
    radius = 10;
    mass = 0.1;
  }
  
  public Particle(float x, float y, float r, float m){
    cor = new Point(x, y);
    vel = new Point(0, 0);
    radius = r;
    mass = m;
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
  
  public void display(){
    stroke(0);
    fill(#5582FF); //Light blue
    circle(cor.getX(), cor.getY(), radius);
  }
}
