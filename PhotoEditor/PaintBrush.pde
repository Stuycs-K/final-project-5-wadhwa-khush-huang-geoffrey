public class PaintBrush {
  color c;
  float size;
  
  public PaintBrush(color col) {
    c = col
    size = 10.0
  }
  
  public PaintBrush(int red, int green, int blue, float s) {
    this(red, green, blue);
    size = s;
  }
  
  public PImage applyPaint(PImage in, PImage destination) {
    return new PImage();
  }
  
  public void setColor(color col) {
    c = col;
  }
  
  public void setSize(int s) {
    size = s;
  }
}
