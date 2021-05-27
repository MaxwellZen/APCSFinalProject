public class Point {
  
  float x, y;
  
  public Point(float x, float y) {
    this.x = x;
    this.y = y;
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
  
  public Point minus(Point other) {
    return new Point(this.x-other.x, this.y-other.y);
  }
  
  public Point plus(Point other) {
    return new Point(this.x+other.x, this.y+other.y);
  }
  
}
