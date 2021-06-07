public class PolarOrder implements Comparator<Point> {
  
  Point p0;
  
  public PolarOrder(Point p0) {
    super();
    this.p0 = p0;
  }
  
  public int compare(Point p1, Point p2) {
    float o = p0.orientation(p1, p2);
    if (o != 0) return (int)o;
    if (p0.distsq(p1)>p0.distsq(p2)) return 1;
    return -1;
  }
  
}
