final static int TEST = -1;
final static int HOME = 0;
final static int DEMO1 = 1;
final static int DEMO2 = 2;
final static int DEMO3 = 3;
final static int LAB = 4;

public class Display {
  
  int type;
  float sbSpringConstant, sbSpringDampening, stageGravity, x1, x2, x3;
  
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
    if(type == TEST)
      testUpdate();
    if(type == HOME)
      homeUpdate();
    if(type == DEMO1)
      update1();
    if(type == DEMO2)
      update2();
    if(type == DEMO3)
      update3();
  }
  
  void testSetup() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    addSoftBody(25, 25, 200, 300, 1, 70);
    addBalloon(10, 7500, 10, 500, 300, 50);
    sbSpringConstant = 70;
    x1 = 810+sbSpringConstant*180/250;
    sbSpringDampening=0.5;
    x2 = 810+sbSpringDampening*180;
    stageGravity = 100;
    x3 = 810+stageGravity*180/400;
    addRigidBody(new float[][] {{0, 400}, {300, 420}, {300, 500}, {0, 500}});
  }
  
  void testUpdate() {
    updateSoftBodies();
    displayRigidBodies();
    if (mousePressed) {
      if (abs(mouseY-73)<=10) {
        x1 = min(990, max(810, mouseX));
        sbSpringConstant = (x1 - 810)*250/180;
        for (SoftBody sb : Stage.softBodies)
          for (Spring s : sb.springArr)
            s.springConstant = sbSpringConstant;
      }
      if (abs(mouseY-138)<=10) {
        x2 = min(990, max(810, mouseX));
        sbSpringDampening = (x2-810)/180;
        for (SoftBody sb : Stage.softBodies)
          for (Spring s : sb.springArr)
            s.dampening = sbSpringDampening;
      }
      if (abs(mouseY-203)<=10) {
        x3 = min(990, max(810, mouseX));
        stageGravity = (x3-810)*400/180;
        Stage.updateGravity(stageGravity);
      }
    }
    noStroke();
    fill(255);
    rect(800, 0, 200, 600);
    fill(0);
    textSize(18);
    text("Spring Constant", 830, 50);
    rect(810, 70, 180, 6);
    fill(180);
    circle(x1, 73, 20);
    fill(0);
    text("Spring Dampening", 820, 115);
    rect(810, 135, 180, 6);
    fill(180);
    circle(x2, 138, 20);
    fill(0);
    text("Gravity", 870, 180);
    rect(810, 200, 180, 6);
    fill(180);
    circle(x3, 203, 20);
  }
  
  void homeSetup(){
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    fill(#FFF07D);
    rect(0,0,1000,100);
    fill(#FFB491);
    rect(0,100,500,250);
    fill(#96E1FF);
    rect(500,100,500,250);
    fill(#46FF50);
    rect(0,350,500,250);
    fill(#FF78FA);
    rect(500,350,500,250);
    fill(0);
    textAlign(CENTER);
    textSize(32);
    text("Springing into Action", 500, 50);
    textSize(12);
    text("by Jerry Liang, Maxwell Zen", 500, 75);
    textSize(50);
    text("Soft Body", 250, 245);
    text("Balloon", 750, 245);
    text("Soft Bodies", 250, 465);
    text("and Balloons", 250, 535);
    text("Lab", 250, 495);
  }
  
  void homeUpdate(){
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    fill(#FFF07D);
    rect(0,0,1000,100);
    fill(#FFF07D);
    rect(0,0,1000,100);
    fill(#FFF07D);
    rect(0,0,1000,100);
    fill(#FFB491);
    rect(0,100,500,250);
    fill(#96E1FF);
    rect(500,100,500,250);
    fill(#46FF50);
    rect(0,350,500,250);
    fill(#FF78FA);
    rect(500,350,500,250);
    fill(0);
    textAlign(CENTER);
    textSize(32);
    text("Springing into Action", 500, 50);
    textSize(12);
    text("by Jerry Liang, Maxwell Zen", 500, 75);
    textSize(50);
    text("Soft Body", 250, 245);
    text("Balloon", 750, 245);
    text("Soft Bodies", 250, 465);
    text("and Balloons", 250, 535);
    text("Lab", 750, 495);
  }
  
  void setup1() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    addSoftBody(400, 25, 200, 300, 1, 70);
    addSoftBody(200, 480, 600, 100, 1, 70);
    fill(#FFF07D);
    rect(25,25,100,40);
  }
  
  void update1() {
    updateSoftBodies();
    fill(#FFA028);
    rect(25,25,100,40);
  }

  void setup2() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    addBalloon(10, 7500, 10, 500, 300, 50);
    addBalloon(20, 10000, 50, 500, 300, 100);
    fill(#FFA028);
    rect(25,25,100,40);
  }
  
  void update2() {
    updateSoftBodies();
    displayRigidBodies();
    fill(#FFA028);
    rect(25,25,100,40);
  }
  
  void setup3() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    addSoftBody(25, 25, 200, 300, 1, 70);
    addBalloon(10, 7500, 10, 500, 300, 50);
    addRigidBody(new float[][] {{0, 400}, {300, 420}, {300, 500}, {0, 500}});
    fill(#FFA028);
    rect(25,25,100,40);
  }
  
  void update3() {
    updateSoftBodies();
    displayRigidBodies();
    fill(#FFA028);
    rect(25,25,100,40);
  }
  
  void setupLab() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    fill(#FFA028);
    rect(25,25,100,40);
  }
  
  void updateLab() {
    fill(#FFA028);
    rect(25,25,100,40);
  }
  
  void changeType(int VALUE){
    type = VALUE;
  }
}
