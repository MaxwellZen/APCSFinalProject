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
    if (c>0) return 1;
    if (c<0) return -1;
    return 0;
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
  
}
