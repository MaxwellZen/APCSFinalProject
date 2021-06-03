public static class Stage {
  static float time = 0;
  static long prev = 0;
  static float g = 0;
  static float airFriction = 0;
  static float atmPressure = 0;
  static ArrayList<SoftBody> softBodies = new ArrayList<SoftBody>();
  
  public static void updateTime() {
    long current = System.currentTimeMillis();
    time = (current - prev) / 1000.0;
    prev=current;
  }
  
  public static void updateGravity(float gravity){
    g = gravity;
  }
  
  public static void updateAirFriction(float f){
    airFriction = f;
  }
  
  public static void updateAtmPressure(float p){
    atmPressure = p;
  }
  
}
