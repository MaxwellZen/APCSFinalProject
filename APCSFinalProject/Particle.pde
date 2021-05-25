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
}
