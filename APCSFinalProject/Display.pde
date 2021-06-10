final static int TEST = -1;
final static int HOME = 0;
final static int DEMO1 = 1;
final static int DEMO2 = 2;
final static int DEMO3 = 3;

public class Display {
  
  int type;
  float sbSpringConstant, x;
  
  public Display() {
    super();
    type = HOME;
  }
  
  void displaySetup(){
    if(type == TEST){
      testSetup();
    }
    if(type == HOME){
      homeSetup();
    }
    if(type == DEMO1){
      setup1();
    }
    if(type == DEMO2){
      setup2();
    }
    if(type == DEMO3){
      setup3();
    }
  }
  
  void displayUpdate(){
    if(type == TEST){
      testUpdate();
    }
    if(type == HOME){
      homeUpdate();
    }
    if(type == DEMO1){
      update1();
    }
    if(type == DEMO2){
      update2();
    }
    if(type == DEMO3){
      update3();
    }
  }
  
  void testSetup() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    addSoftBody(25, 25, 200, 300, 1, 70);
    addBalloon(10, 7500, 10, 500, 300, 50);
    sbSpringConstant = 70;
    x = 810+sbSpringConstant*180/250;
    addRigidBody(new float[][] {{0, 400}, {300, 420}, {300, 500}, {0, 500}});
  }
  
  void testUpdate() {
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
  
    void homeSetup(){
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
  }
  
  void homeUpdate(){
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
  }
  
  void setup1() {
  }
  
  void update1() {
  }

  void setup2() {
  }
  
  void update2() {
  }
  
  void setup3() {
  }
  
  void update3() {
  }
  
  void changeType(int VALUE){
    type = VALUE;
  }
}
