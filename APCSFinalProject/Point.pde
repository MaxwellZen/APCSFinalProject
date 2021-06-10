public class Point {
  
  float x, y;
  
  public Point() {
    this.x=0;
    this.y=0;
  }
  
  public Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  public String toString() {
    return "(" + x + ", " + y + ")";
  }
  
  public float getX() {
    return x;
  }
  
  public float getY() {
    return y;
  }
  
  public void setX(float newX) {
    x=newX;
  }
  
  public void setY(float newY) {
    y=newY;
  }
  
  public float magnitude(){
    return sqrt(sq(x) + sq(y));
  }
  
  public float distsq(Point other) {
    return sq(x-other.getX()) + sq(y-other.getY());
  }
  
  public float dist(Point other) {
    return sqrt(distsq(other));
  }
  
  public float dot(Point other) {
    return this.x*other.x + this.y*other.y;
  }
  
  public float cross(Point other) {
    return this.y*other.x - this.x*other.y;
  }
  
  // 1 if a is clockwise to b relative to this, 0 if a b and this are collinear, -1 otherwise
  public float orientation(Point a, Point b) {
    a=a.minus(this);
    b=b.minus(this);
    float c = a.cross(b);
    if (abs(c)<0.01) return 0;
    if (c>0) return 1;
    return -1;
  }
  
  public Point plus(Point other) {
    return new Point(this.x+other.x, this.y+other.y);
  }
  
  public Point minus(Point other) {
    return new Point(this.x-other.x, this.y-other.y);
  }
  
  public Point scale(float factor) {
    return new Point(this.x*factor, this.y*factor);
  }
  
  public Point normalize() {
    float invsqrt = 1 / sqrt(sq(x)+sq(y));
    return new Point(this.x*invsqrt, this.y*invsqrt);
  }
  
  public Point[] components(Point other) {
    Point[] ans = new Point[2];
    Point normalized = other.normalize();
    ans[0]=normalized.scale(dot(normalized));
    ans[1]=minus(ans[0]);
    return ans;
  }
  
  public Point reflect(Point other) {
    Point normalized = other.normalize();
    return minus(normalized.scale(2 * dot(normalized)));
  }
  
  public Point bounce (Point other) {
    return reflect(new Point(-other.y, other.x));
  }
  
  public Point closest(Point p1, Point p2) {
    Point p0 = this.minus(p1), p2norm = p2.minus(p1).normalize();
    Point close = p2norm.scale(p0.dot(p2norm));
    close = close.plus(p1);
    if (close.x < min(p1.x, p2.x) || close.x > max(p1.x, p2.x) || close.y < min(p1.y, p2.y) || close.y > max(p1.y, p2.y)) {
      if (distsq(p1)<distsq(p2)) return p1;
      return p2;
    }
    return close;
  }
  
  ArrayList<Point> convexHull(ArrayList<Point> p) {
    ArrayList<Point> ans = new ArrayList<Point>();
    Point p0 = p.get(0);
    int m = 0;
    for (int i = 1; i < p.size(); i++)
      if (p.get(i).y < p0.y || (p.get(i).y==p0.y && p.get(i).x<p0.x)) { 
        p0 = p.get(i);
        m = i;
      }
    p.set(m, p.get(0));
    p.remove(0);
    Collections.sort(p, new PolarOrder(p0));
    ans.add(p0);
    for (int i = 0; i < p.size(); i++) {
      while (ans.size()>1 && p.get(i).orientation(ans.get(ans.size()-1), ans.get(ans.size()-2))!=1) {
        ans.remove(ans.size()-1);
      }
      ans.add(p.get(i));
    }
    return ans;
  }
  
  float pointToLine(Point p1, Point p2){
    return distsq(closest(p1, p2));
  }
  
}
