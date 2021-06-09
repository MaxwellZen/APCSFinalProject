public class Display {
  
  float sbSpringConstant, x;
  
  public Display() {
    super();
  }
  
  void setup0() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    addSoftBody(25, 25, 200, 300, 1, 70);
    sbSpringConstant = 70;
    x = 810+sbSpringConstant*180/250;
    addRigidBody(new float[][] {{0, 400}, {300, 420}, {300, 500}, {0, 500}});
  }
  
  void update0() {
    updateSoftBodies();
    displayRigidBodies();
    if (mousePressed) {
      if (dist(mouseX, mouseY, x, 73)<=10) {
        x = min(990, max(810, mouseX));
        sbSpringConstant = (x - 810)*250/180;
        for (SoftBody sb : Stage.softBodies) {
          for (Spring s : sb.springArr) {
            s.springConstant = sbSpringConstant;
          }
        }
      }
    }
    noStroke();
    fill(255);
    rect(800, 0, 200, 600);
    fill(0);
    textSize(18);
    text("Spring Constant", 830, 45);
    rect(810, 70, 180, 6);
    fill(180);
    circle(x, 73, 20);
  }
  
  void setup1() {
  }
  
  void update1() {
  }
  
}
