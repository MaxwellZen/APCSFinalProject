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
  float cradius;
  float clength;
  float cwidth;
  boolean resetparams;
  float[] stime;
  
  public Display() {
    super();
    type = HOME;
    object = SB;
    resetparams=true;
    stime = new float[4];
    for (int i = 0; i < 4; i++) stime[i]=random(TWO_PI);
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
    if(type == LAB){
      setupLab();
    }
    displayUpdate();
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
    if (resetparams) setDefaultParameters();
    resetparams=true;
    addRigidBody(new float[][] {{0, 400}, {300, 420}, {300, 500}, {0, 500}});
  }
  
  void testUpdate() {
    updateSoftBodies();
    displayRigidBodies();
    updateSliders();
    drawSliders();
  }
  
  void homeSetup(){
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
  }
  
  void homeUpdate(){
    float time = (millis())/1000.0;
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
    text("Soft Body", 250, 245+10*sin(time-stime[0]));
    text("Balloon", 750, 245+10*sin(time-stime[1]));
    text("Soft Bodies", 250, 465+10*sin(time-stime[2]));
    text("and Balloons", 250, 535+10*sin(time-stime[2]));
    text("Lab", 750, 495+10*sin(time-stime[3]));
  }
  
  void setup1() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    addSoftBody(52, 21, 95, 104, 1, 70);
    addRigidBody(new float[][] {{25,151},{189,225},{171,252},{8,173}});
    addRigidBody(new float[][] {{437,182},{470,190},{433,244},{399,234}});
    addRigidBody(new float[][] {{271,296},{291,331},{268,341},{243,303}});
    addRigidBody(new float[][] {{521,315},{557,330},{516,377},{489,364}});
    addRigidBody(new float[][] {{374,386},{403,432},{370,444},{334,397}});
    addRigidBody(new float[][] {{605,410},{639,426},{568,540},{531,525}});
    addRigidBody(new float[][] {{166,600},{221,480},{281,600}});
    if (resetparams) setDefaultParameters();
    else updateParams();
    resetparams=true;
  }
  
  void update1() {
    updateSoftBodies();
    displayRigidBodies();
    updateSliders();
    drawSliders();
    drawButtons();
  }

  void setup2() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    addRigidBody(new float[] {80,152,118,147,144,264,116,271});
    addRigidBody(new float[] {116,271,144,264,209,350,190,369});
    addRigidBody(new float[] {190,369,209,350,300,410,295,430});
    addRigidBody(new float[] {295,430,300,410,416,432,418,457});
    addRigidBody(new float[] {418,457,416,432,513,445,520,464});
    addRigidBody(new float[] {750,352,784,356,707,496,671,494});
    addBalloon(10, 7500, 10, 200, 60, 100);
    if (resetparams) setDefaultParameters();
    else updateParams();
    resetparams=true;
  }
  
  void update2() {
    updateSoftBodies();
    displayRigidBodies();
    updateSliders();
    drawSliders();
    drawButtons();
  }
  
  void setup3() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    addSoftBody(0.8*750,25, 100, 200, 1, 80);
    addBalloon(10, 7500, 10, 0.8*200, 175, 50);
    addRigidBody(new float[] {0.8*51,157,0.8*81,148,0.8*252,443,0.8*212,460});
    addRigidBody(new float[] {0.8*212,460,0.8*252,443,0.8*500,519,0.8*500,550});
    addRigidBody(new float[] {0.8*500,550,0.8*500,519,0.8*781,436,0.8*815,456});
    addRigidBody(new float[] {0.8*815,456,0.8*781,436,0.8*898,176,0.8*930,186});
    if (resetparams) setDefaultParameters();
    else updateParams();
    resetparams=true;
  }
  
  void update3() {
    updateSoftBodies();
    displayRigidBodies();
    updateSliders();
    drawSliders();
    drawButtons();
  }
  
  void setupLab() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    x1=x2=810;
  }
  
  void updateLab() {
    updateSoftBodies();
    displayRigidBodies();
    noStroke();
    fill(255);
    rect(800, 0, 200, 600);
    stroke(0);
    drawButtons();
    fill(#469BFF);
    if (object==SB) fill(#80bbff);
    rect(825 + 5,25,40,40);
    fill(0);
    textSize(12);
    textAlign(CENTER);
    text("SB", 845 + 5, 50);
    fill(#469BFF);
    if (object==B) fill(#80bbff);
    rect(875 + 5,25,40,40);
    fill(0);
    textSize(12);
    textAlign(CENTER);
    text("B", 895 + 5, 50);
    fill(#469BFF);
    if (object==RB) fill(#80bbff);
    rect(925 + 5,25,40,40);
    fill(0);
    textSize(12);
    textAlign(CENTER);
    text("RB", 945 + 5, 50);
    
    if(object == SB){
      clength=0; 
      cwidth=0;
      if (mousePressed && mouseX>800) {
        if (abs(mouseY-138)<=10) {
          x1 = min(990, max(810, mouseX));
        }
        if (abs(mouseY-203)<=10) {
          x2 = min(990, max(810, mouseX));
        }
      }
      clength = 50 + 450*(x1-810)/180;
      cwidth = 50 + 350*(x2-810)/180;
      textAlign(CENTER,BOTTOM);
      noStroke();
      textSize(18);
      fill(0);
      text("Length: " + clength, 900, 115);
      rect(810, 135, 180, 6);
      fill(180);
      circle(x1, 138, 20);
      fill(0);
      text("Width: " + cwidth, 900, 180);
      rect(810, 200, 180, 6);
      fill(180);
      circle(x2, 203, 20);
    }
    
    if(object == B){
      cradius=0;
      if (mousePressed && mouseX>800) {
        if (abs(mouseY-138)<=10) {
          x1 = min(990, max(810, mouseX));
        }
      }
      cradius = 20 + 130*(x1-810)/180;
      textAlign(CENTER,BOTTOM);
      noStroke();
      textSize(18);
      fill(0);
      text("Radius: " + cradius, 900, 115);
      rect(810, 135, 180, 6);
      fill(180);
      circle(x1, 138, 20);
    }
    
    if(object == RB){
      clength=0; 
      cwidth=0;
      if (mousePressed && mouseX>800) {
        if (abs(mouseY-138)<=10) {
          x1 = min(990, max(810, mouseX));
        }
        if (abs(mouseY-203)<=10) {
          x2 = min(990, max(810, mouseX));
        }
      }
      clength = 50 + 450*(x1-810)/180;
      cwidth = 50 + 350*(x2-810)/180;
      textAlign(CENTER,BOTTOM);
      noStroke();
      textSize(18);
      fill(0);
      text("Length: " + clength, 900, 115);
      rect(810, 135, 180, 6);
      fill(180);
      circle(x1, 138, 20);
      fill(0);
      text("Width: " + cwidth, 900, 180);
      rect(810, 200, 180, 6);
      fill(180);
      circle(x2, 203, 20);
    }
  }
  
  void changeType(int VALUE){
    type = VALUE;
  }
  
  void setDefaultParameters() {
    x1 = 810+70.0*180/250;
    x2 = 810+0.5*180;
    x3 = 810+100.0*180/400;
    x4 = 810+0.45*(0.1-0.05)*180;
    x5 = 810+1.0*180/5;
    x6 = 810+1.0*180/5;
  }
  
  void updateParams() {
    float temp = (x1 - 810)*250/180;
    for (SoftBody sb : Stage.softBodies)
      for (Spring s : sb.springArr)
        s.springConstant = temp;
    temp = (x2-810)/180;
    for (SoftBody sb : Stage.softBodies)
      for (Spring s : sb.springArr)
        s.dampening = temp;
    Stage.updateGravity((x3-810)*400/180);
    temp = 0.05 + 0.45*(x4-810)/180;
    for (SoftBody sb : Stage.softBodies)
      for (Particle p : sb.particleArr)
        p.mass=temp;
    Stage.updateAirFriction((x5-810)*5/180);
    Stage.updateAtmPressure((x6-810)*5/180);
  }
  
  void updateSliders() {
    if (mousePressed && mouseX>800) {
      if (abs(mouseY-73)<=10) {
        x1 = min(990, max(810, mouseX));
        float temp = 0 + 250*(x1 - 810)/180;
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
        Stage.updateGravity(400*(x3-810)/180);
      }
      if (abs(mouseY-268)<=10) {
        x4 = min(990, max(810, mouseX));
        float temp = 0.05 + 0.45*(x4-810)/180;
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
    textAlign(CENTER,BOTTOM);
    noStroke();
    fill(255);
    rect(800, 0, 200, 600);
    fill(0);
    textSize(18);
    text("Spring Constant", 900, 50);
    rect(810, 70, 180, 6);
    fill(180);
    circle(x1, 73, 20);
    fill(0);
    text("Spring Dampening", 900, 115);
    rect(810, 135, 180, 6);
    fill(180);
    circle(x2, 138, 20);
    fill(0);
    text("Gravity", 900, 180);
    rect(810, 200, 180, 6);
    fill(180);
    circle(x3, 203, 20);
    fill(0);
    text("Particle Mass", 900, 245);
    rect(810, 265, 180, 6);
    fill(180);
    circle(x4, 268, 20);
    fill(0);
    text("Air Resistance", 900, 310);
    rect(810, 330, 180, 6);
    fill(180);
    circle(x5, 333, 20);
    fill(0);
    text("Atm Pressure", 900, 375);
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
  
}
