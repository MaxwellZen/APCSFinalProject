void setup(){
  size(1000, 800);
  Particle p1 = new Particle(500,400);
  Particle p2 = new Particle(530,480);
  Spring s1 = new Spring(p1, p2, 0.5);
  s1.display();
  p1.display();
  p2.display();
}

void draw(){

}
