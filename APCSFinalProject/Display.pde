final static int TEST = -1;
final static int HOME = 0;
final static int DEMO1 = 1;
final static int DEMO2 = 2;
final static int DEMO3 = 3;
final static int LAB = 4;
final static int SB = 1;
final static int RB = -1;
final static int B = 0;

public class Display {
  
  int type;
  int object;
  float x1, x2, x3, x4, x5, x6;
  
  public Display() {
    super();
    type = HOME;
    object = SB;
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
    if(type == LAB)
      updateLab();
  }
  
  void testSetup() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    addSoftBody(25, 25, 200, 300, 1, 70);
    addBalloon(10, 7500, 10, 500, 300, 50);
    x1 = 810+70.0*180/250;
    x2 = 810+0.5*180;
    x3 = 810+100.0*180/400;
    x4 = 810+(0.1-0.05)*180;
    x5 = 810+1.0*180/5;
    x6 = 810+1.0*180/5;
    addRigidBody(new float[][] {{0, 400}, {300, 420}, {300, 500}, {0, 500}});
  }
  
  void testUpdate() {
    updateSoftBodies();
    displayRigidBodies();
    updateSliders();
    drawSliders();
  }
  
  void updateSliders() {
    if (mousePressed && mouseX>800) {
      if (abs(mouseY-73)<=10) {
        x1 = min(990, max(810, mouseX));
        float temp = (x1 - 810)*250/180;
        for (SoftBody sb : Stage.softBodies)
          for (Spring s : sb.springArr)
            s.springConstant = temp;
      }
      if (abs(mouseY-138)<=10) {
        x2 = min(990, max(810, mouseX));
        float temp = (x2-810)/180;
        for (SoftBody sb : Stage.softBodies)
          for (Spring s : sb.springArr)
            s.dampening = temp;
      }
      if (abs(mouseY-203)<=10) {
        x3 = min(990, max(810, mouseX));
        Stage.updateGravity((x3-810)*400/180);
      }
      if (abs(mouseY-268)<=10) {
        x4 = min(990, max(810, mouseX));
        float temp = 0.05 + (x4-810)/180;
        for (SoftBody sb : Stage.softBodies)
          for (Particle p : sb.particleArr)
            p.mass=temp;
      }
      if (abs(mouseY-333)<=10) {
        x5 = min(990, max(810, mouseX));
        Stage.updateAirFriction((x5-810)*5/180);
      }
      if (abs(mouseY-398)<=10) {
        x6 = min(990, max(810, mouseX));
        Stage.updateAtmPressure((x6-810)*5/180);
      }
    }
  }
  
  void drawSliders() {
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
    fill(0);
    text("Particle Mass", 830, 245);
    rect(810, 265, 180, 6);
    fill(180);
    circle(x4, 268, 20);
    fill(0);
    text("Air Resistance", 830, 310);
    rect(810, 330, 180, 6);
    fill(180);
    circle(x5, 333, 20);
    fill(0);
    text("Atm Pressure", 840, 375);
    rect(810, 395, 180, 6);
    fill(180);
    circle(x6, 398, 20);
  }
  
  void drawButtons() {
    fill(#FFA028);
    rect(25,25,100,40);
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("HOME", 75, 50);
    fill(#F578FF);
    rect(25,75,100,40);
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("RESET", 75, 100);
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
    drawButtons();
  }
  
  void update1() {
    updateSoftBodies();
    drawButtons();
  }

  void setup2() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    addBalloon(10, 7500, 10, 500, 300, 50);
    addBalloon(20, 10000, 50, 500, 300, 100);
    drawButtons();
  }
  
  void update2() {
    updateSoftBodies();
    displayRigidBodies();
    drawButtons();
  }
  
  void setup3() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    addSoftBody(25, 25, 200, 300, 1, 70);
    addBalloon(10, 7500, 10, 500, 300, 50);
    addRigidBody(new float[][] {{0, 400}, {300, 420}, {300, 500}, {0, 500}});
    drawButtons();
  }
  
  void update3() {
    updateSoftBodies();
    displayRigidBodies();
    drawButtons();
  }
  
  void setupLab() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    drawButtons();
    noStroke();
    fill(255);
    rect(800, 0, 200, 600);
    stroke(0);
    fill(#469BFF);
    rect(825 + 5,25,40,40);
    fill(0);
    textSize(12);
    textAlign(CENTER);
    text("SB", 845 + 5, 50);
    fill(#469BFF);
    rect(825 + 5,25,40,40);
    fill(0);
    textSize(12);
    textAlign(CENTER);
    text("SB", 845 + 5, 50);
    fill(#469BFF);
    rect(875 + 5,25,40,40);
    fill(0);
    textSize(12);
    textAlign(CENTER);
    text("B", 895 + 5, 50);
    fill(#469BFF);
    rect(925 + 5,25,40,40);
    fill(0);
    textSize(12);
    textAlign(CENTER);
    text("RB", 945 + 5, 50);
  }
  
  void updateLab() {
    noStroke();
    fill(255);
    rect(800, 0, 200, 600);
    stroke(0);
    drawButtons();
    fill(#469BFF);
    rect(825 + 5,25,40,40);
    fill(0);
    textSize(12);
    textAlign(CENTER);
    text("SB", 845 + 5, 50);
    fill(#469BFF);
    rect(875 + 5,25,40,40);
    fill(0);
    textSize(12);
    textAlign(CENTER);
    text("B", 895 + 5, 50);
    fill(#469BFF);
    rect(925 + 5,25,40,40);
    fill(0);
    textSize(12);
    textAlign(CENTER);
    text("RB", 945 + 5, 50);
  }
  
  void changeType(int VALUE){
    type = VALUE;
  }
}
