public class Particle{
  float xcor;
  float ycor;
  float xvel;
  float yvel;
  float radius;
  float mass;
  
  public Particle(float x, float y){
    xcor = x;
    ycor = y;
    xvel = 0;
    yvel = 0;
    radius = 5;
    mass = 5;
  }
  
  public Particle(float x, float y, float r, float m){
    xcor = x;
    ycor = y;
    xvel = 0;
    yvel = 0;
    radius = r;
    mass = m;
  }
  
  public float getXcor(){
    return xcor;
  }
  
  public float getYcor(){
    return ycor;
  }
  
  public float getXvel(){
    return xvel;
  }
  
  public float getYvel(){
    return yvel;
  }

  public float getRadius(){
    return radius;
  }
  
  public float getMass(){
    return mass;
  }
  
  public void applyForce(float fx, float fy){
    float time = Stage.time;
    xvel += time * fx / mass;
    yvel += time * fy / mass;
  }
  
  public void updatePosition(){
    float time = Stage.time;
    xcor += time * xvel;
    ycor += time * yvel;
  }
}
