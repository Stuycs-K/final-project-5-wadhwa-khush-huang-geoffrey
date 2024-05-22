public class Kernel{
  float[][] kernel;
  
  public Kernel(float[][]init) {
    kernel = init;
  }
  
  color calcNewColor(PImage img, int x, int y) {
   float r = 0;
   float g = 0;
   float b = 0;
   if (x == 0 || y == 0 || x == img.width-1 || y == img.height-1){
         color a = color(0);
         return a;
   }
   for (int row = 0; row < kernel.length; row++){
     for (int col = 0; col < kernel[0].length; col++){
         r += red(img.get(x - 1 + col, y - 1 + row)) * kernel[row][col];
         g += green(img.get(x - 1 + col, y - 1 + row)) * kernel[row][col];
         b += blue(img.get(x - 1 + col, y - 1 + row)) * kernel[row][col];
     }
   }
   
   if (r < 0){
     r = 0;
   }
   if (r > 255){
     r = 255;
   }
   if (g < 0){
     g = 0;
   }
   if (g > 255){
     g = 255;
   }
   if (b < 0){
     b = 0;
   }
   if (b > 255){
     b = 255;
   }
   
   color c = color(r, g, b);
   return c;
 }
 
 void apply(PImage source, PImage destination){
    for (int col = 0; col < source.width; col++){
      for (int row = 0; row < source.height; row++){
        destination.set(col, row, calcNewColor(source, col, row));
      }
    }
  }
 
}
