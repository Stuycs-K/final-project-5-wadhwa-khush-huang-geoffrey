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
  
  public PImage applyPaint(PImage in, int imgX, int imgY) {
    float startX, startY, endX, endY;
    int sx, sy, ex, ey;
    if (mouseX - size <= imgX)
      startX = 0;
    else
      startX = mouseX - (size + imgX);
    if (mouseY - size <= imgY)
      startY = 0;
    else
      startY = mouseY - (size + imgY);
    if (mouseX + size >= imgX + in.width)
      endX = in.width;
    else
      endX = (mouseX - imgX) + size;
    if (mouseY + size >= imgY + in.height)
      endY = in.height;
    else
      endY = (mouseY - imgY) + size;
    sx = floor(startX);
    sy = floor(startY);
    ex = floor(endX);
    ey = floor(endY);
    //
    
    PImage toEdit = in.get(sx, sy, ex - sx, ey - sy);
    for (int x = 0; x < ex - sx; x++) {
      for (int y = 0; y < ey -sy; y++) {
        toEdit.set(x, y, PImage.blendColor(toEdit.get(x, y), c, BLEND));
      }
    }
      
    //for (int i = 0; i < toEdit.pixels.length; i++) {
    //  toEdit.pixels[i] = 0;//PImage.blendColor(pixels[i], c, BLEND);
    //}
    //toEdit.updatePixels();
    destination = in.copy();
    destination.set(sx, sy, toEdit);
    return destination;
  }
  
  public void setColor(color col) {
    c = col;
  }
  
  public void setSize(float s) {
    size = s;
  }
}
