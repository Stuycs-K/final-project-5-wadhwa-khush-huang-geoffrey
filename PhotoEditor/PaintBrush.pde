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
  
  public PImage applyPaint(PImage in) {
    int startX, startY, endX, endY;
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
    //
    PImage toEdit = in.get(startX, startY, endX - startX, endY - startY);
    for (int i = 0; i < toEdit.pixels.length; i++) {
      toEdit.pixels[i] = toEdit.blendColor(pixels[i], c);  
    }
    toEdit.updatePixels();
    PImage out = in.copy();
    out.set(startX, startY, toEdit);
  }
  
  public void setColor(color col) {
    c = col;
  }
  
  public void setSize(int s) {
    size = s;
  }
}
