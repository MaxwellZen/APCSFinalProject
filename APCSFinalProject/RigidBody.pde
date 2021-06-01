public class RigidBody {
  
  ArrayList<Point> vertices;
  
  public RigidBody() {
    vertices = new ArrayList<Point>();
  }
  
  public RigidBody(int[][] coords) {
    vertices = new ArrayList<Point>();
    for (int i = 0; i < coords.length; i++) {
      vertices.add(new Point(coords[i][0], coords[i][1]));
    }
  }
  
  public void display() {
    stroke(0);
    for (int i = 0; i < vertices.size(); i++) {
      Point v1 = vertices.get(i);
      Point v2 = vertices.get((i+1)%vertices.size());
      line(v1.getX(), v1.getY(), v2.getX(), v2.getY());
    }
  }
  
}
