public class RigidBody {
  
  ArrayList<Point> vertices;
  float minX, maxX, minY, maxY;
  
  public RigidBody() {
    vertices = new ArrayList<Point>();
  }
  
  public RigidBody(int[][] coords) {
    vertices = new ArrayList<Point>();
    for (int i = 0; i < coords.length; i++) {
      vertices.add(new Point(coords[i][0], coords[i][1]));
      minX = min(minX, coords[i][0]);
      maxX = max(maxX, coords[i][0]);
      minY = min(minY, coords[i][1]);
      maxY = max(maxY, coords[i][1]);
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
  
  public boolean inside(Point p) {
    if (p.getX()<minX || p.getX()>maxX || p.getY()<minY || p.getY()>maxY) return false;
    for (int i = 0; i < vertices.size(); i++) {
      Point p1 = vertices.get(i), p2 = vertices.get((i+1)%vertices.size()), p3 = vertices.get((i+2)%vertices.size());
      if (p1.orientation(p2, p)==0 || p1.orientation(p2, p)==p1.orientation(p2, p3));
      else return false;
    }
    return true;
  }
  
  public void collide(Particle p0) {
    Point p = p0.cor;
    if (inside(p)) {
      Point next = new Point(), side = new Point(2, 2);
      float mindist = (1f / 0f);
      for (int i = 0; i < vertices.size(); i++) {
        Point candidate = p.closest(vertices.get(i), vertices.get((i+1)%vertices.size()));
        if (p.distsq(candidate)<mindist) {
          next = candidate;
          mindist = p.distsq(candidate);
          side = vertices.get(i).minus(vertices.get((i+1)%vertices.size()));
        }
      }
      p0.setCor(next);
      p0.setVel(p0.getVel().bounce(side));
    }
  }
  
}
