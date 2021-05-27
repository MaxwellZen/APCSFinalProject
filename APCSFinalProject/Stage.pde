static class Stage {
  static float time = 0;
  static long prev = 0;
  static ArrayList<SoftBody> softBodies = new ArrayList<SoftBody>();
  
  static void updateTime() {
    long current = System.currentTimeMillis();
    time = (current - prev) / 1000.0;
    prev=current;
  }
  
  static void updateSoftBodies() {
    for (SoftBody s : softBodies) {
      s.updateSprings();
      s.updateParticles();
      s.display();
    }
  }
  
  static void addSoftBody(float x, float y, 
                          float length, float width, 
                          float density, float springConstant) {
    softBodies.add(new SoftBody(x, y, length, width, density, springConstant));
  }
  
}
