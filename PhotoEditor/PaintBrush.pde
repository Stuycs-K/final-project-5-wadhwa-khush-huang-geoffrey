public class PaintBrush {
  color c;
  float size;
  
  public PaintBrush(color col) {
    c = col;
    size = 10.0;
  }
  
  public PaintBrush(int red, int green, int blue, float s) {
    this(color(red, green, blue));
    size = s;
  }
  
  public PImage applyPaint(PImage in) {
    float startX, startY, endX, endY;
    int sx, sy, ex, ey;
    if (mouseX - size <= 0)
      startX = 0;
    else
      startX = mouseX - size;
    if (mouseY - size <= 0)
      startY = 0;
    else
      startY = mouseY - size;
    if (mouseX + size >= in.width)
      endX = in.width;
    else
      endX = mouseX + size;
    if (mouseY + size >= in.height)
      endY = in.height;
    else
      endY = mouseY + size;
    sx = floor(startX);
    sy = floor(startY);
    ex = floor(endX);
    ey = floor(endY);
    //
    
    PImage toEdit = in.get(sx, sy, ex - sx, ey - sy);
    for (int i = 0; i < toEdit.pixels.length; i++) {
      toEdit.pixels[i] = 0;//PImage.blendColor(pixels[i], c, BLEND);
    }
    toEdit.updatePixels();
    PImage out = in.copy();
    out.set(sx, sy, toEdit);
    return out;
  }
  
  public void setColor(color col) {
    c = col;
  }
  
  public void setSize(float s) {
    size = s;
  }
}
