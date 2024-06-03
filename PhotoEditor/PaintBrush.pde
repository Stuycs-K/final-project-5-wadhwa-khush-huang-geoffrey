public class PaintBrush {
  color c;
  int r, g, b;
  float thickness, opacity;
  
  public PaintBrush(int red, int green, int blue) {
    r = red;
    g = green;
    b = blue;
    c = color(r, g, b);
    thickness = 50.0;
    opacity = 100.0;
  }
  
  public PaintBrush(int red, int green, int blue, float t, float o) {
    this(red, green, blue);
    thickness = t;
    opacity = o;
  }
  
  public PImage applyPaint(PImage in, PImage destination) {
    
  }
  
  public void setColor(int red, int green, int blue) {
    
  }
  
  public void setThickness(int t) {
    
  }
}
