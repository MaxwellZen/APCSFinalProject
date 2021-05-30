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
  
  public float dot(Point other) {
    return this.x*other.x + this.y*other.y;
  }
  
  public float cross(Point other) {
    return this.y*other.x - this.x*other.y;
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
    float invsqrt = 1 / dist(0, 0, x, y);
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
