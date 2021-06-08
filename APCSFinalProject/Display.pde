public class Display {
  
  public Display() {
    super();
  }
  
  void setup0() {
    Stage.softBodies.clear();
    Stage.rigidBodies.clear();
    addSoftBody(25, 25, 200, 300, 1, 70);
    addRigidBody(new float[][] {{0, 400}, {300, 420}, {300, 500}, {0, 500}});
  }
  
  void update0() {
    updateSoftBodies();
    displayRigidBodies();
  }
  
}
