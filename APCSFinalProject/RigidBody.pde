public class RigidBody {
  
  ArrayList<Point> vertices;
  float minX, maxX, minY, maxY;
  
  public RigidBody() {
    vertices = new ArrayList<Point>();
  }
  
  public RigidBody(float[][] coords) {
    vertices = new ArrayList<Point>();
    for (int i = 0; i < coords.length; i++) {
      vertices.add(new Point(coords[i][0], coords[i][1]));
      minX = min(minX, coords[i][0]);
      maxX = max(maxX, coords[i][0]);
      minY = min(minY, coords[i][1]);
      maxY = max(maxY, coords[i][1]);
    }
  }
  
  public RigidBody(ArrayList<Point> coords) {
     vertices = coords;
     for (int i = 0; i < coords.size(); i++) {
       minX = min(minX, coords.get(i).x);
       maxX = max(maxX, coords.get(i).x);
       minY = min(minY, coords.get(i).y);
       maxY = max(maxY, coords.get(i).y);
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
    
    // bounding box test
    Point p = p0.cor;
    if (p.getX()<minX-p0.radius || p.getX()>maxX+p0.radius || p.getY()<minY-p0.radius || p.getY()>maxY+p0.radius) return;
    
    float minDist = 1e10;
    Point close = new Point(), edge = new Point();
    boolean inHull = true, nearEdge = false;
    
    // loop through sides
    for (int i = 0; i < vertices.size(); i++) {
      Point p1 = vertices.get(i), p2 = vertices.get((i+1)%vertices.size()), p3 = vertices.get((i+2)%vertices.size());
      Point c = p.closest(p1, p2);
      
      // test if it's close to an edge
      if (p.distsq(c)<sq(p0.radius)) nearEdge=true;
      
      // update the closest point/edge
      if (p.distsq(c)<minDist) {
        minDist=p.distsq(c);
        edge = p2.minus(p1);
        close=c;
      }
      
      // test if it's in the convex hull
      if (p1.orientation(p2, p)!=0 && p1.orientation(p2, p)!=p1.orientation(p2, p3)) inHull=false;
    }
    
    // test for, then perform collision
    if (inHull || nearEdge) {
      p0.setCor(new Point(edge.y, - 1 * edge.x).normalize().scale(p0.radius).plus(close));
      p0.setVel(p0.vel.bounce(edge));
    }
  }
  
}
