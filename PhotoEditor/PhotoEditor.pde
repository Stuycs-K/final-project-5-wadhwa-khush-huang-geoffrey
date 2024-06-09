import com.krab.lazy.*;
import java.io.IOException;
import java.nio.file.Files;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import com.krab.lazy.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

//TO BE IMPLEMENTED IN APPROPRIATE STAGES
private PImage original;
private PImage current;
private PImage withTempChanges;
private int imgX, imgY;
private LazyGui gui;
private float[] sliders;
private String[] sliderNames;
private PaintBrush brush;
private PickerColor myColor;
float expL, conL, satL;

void setup() {
  size(1920, 1080, P2D);
  background(100);
  gui = new LazyGui(this, new LazyGuiSettings().setCellSize(22));
  gui.button("Import");
  gui.button("Export");
  gui.button("Clear");
  gui.button("Update Save");
  gui.button("Restore Save");
  gui.toggle("Paintbrush");

  sliderNames = new String[] {"Exposure", "Contrast", "Saturation", "Monochrome"};
  sliders = new float[4];
  sliders[0] = gui.sliderInt("Exposure", 0, -100, 100);
  sliders[1] = gui.sliderInt("Contrast", 1, 1, 5);
  sliders[2] = gui.sliderInt("Saturation", 0, -100, 100);
  sliders[3] = gui.sliderInt("Monochrome", 0, 0, 1);

  myColor = gui.colorPicker("Brush Color", 0.5, 0.5, 1);
  gui.slider("Brush Size", 10, 0, 100);
  brush = new PaintBrush(color(myColor.hex));
}

void draw() {
  //background(100); //if this line isn't present, the gui wont erase after being moved/closed. makes it super slow tho.
  float exposure = sliders[0];
  float saturation = sliders[2];
  float contrast = sliders[1];
  float monochrome = sliders[3];
  if (gui.button("Clear")) {
    background(100);
    current = null;
    withTempChanges = null;
  }
  if (gui.button("Update Save")) {
    current = withTempChanges.copy();
    original = current.copy();
    resetSliders();
  }
  if (gui.button("Restore Save")) {
    current = original.copy();
    resetSliders();
  }
  if (gui.button("Export") && withTempChanges != null) {
    saveImage();  
  }
  for (int i = 0; i < sliders.length; i++) {
    if (gui.slider(sliderNames[i]) != sliders[i] && withTempChanges != null) {
      sliders[i] = gui.slider(sliderNames[i]);
    }
  }
  if (withTempChanges != null) {
    background(100);
    image(withTempChanges, imgX, imgY);
    modify(exposure, contrast, saturation, monochrome);
  }
  if (gui.button("Import")) {
    selectInput("Select a file to process", "fileSelected");
  }
  if (gui.button("Clear")) {
    background(100);
    current = null;
    withTempChanges = null;
  }
  myColor = gui.colorPicker("Brush Color");
}

void modify(float exposure, float contrast, float saturation, float monochrome) {
  for (int i = 0; i < current.width; i++) {
    for (int j = 0; j < current.height; j++) {
      float red = red(current.get(i, j)) + exposure;
      float green = green(current.get(i, j)) + exposure;
      float blue = blue(current.get(i, j)) + exposure;

      // saturation modification
      float max = Math.max(Math.max(red, green), blue);
      if (red == max) {
        red += saturation;
        if (green == Math.max(green, blue)) {
          green += saturation;
        } else {
          blue += saturation;
        }
      }
      if (green == max) {
        green += saturation;
        if (red == Math.max(red, blue)) {
          red += saturation;
        } else {
          blue += saturation;
        }
      }
      if (blue == max) {
        blue += saturation;
        if (green == Math.max(green, red)) {
          green += saturation;
        } else {
          red += saturation;
        }
      }

      // contrast modification
      red = Math.min(255, contrast * red);
      green = Math.min(255, contrast * green);
      blue = Math.min(255, contrast * blue);

      color c;

      if (monochrome == 1) {
        c = color((red + green + blue)/3);
      } else {
        c = color(red, green, blue);
      }
      withTempChanges.set(i, j, (int) c);
    }
  }
}

void resetSliders() {
  for (String name : sliderNames) {
    if (name.equals("Contrast")) {
      gui.sliderSet(name, 1);
    } else {
      gui.sliderSet(name, 0);
    }
  }
}

void mouseClicked() {
  mouseDragged();
}

void mouseDragged() {
  //try changing to mousePressed boolean method in draw()
  if (withTempChanges != null) {
    boolean inBoundsX = mouseX >= imgX && mouseX <= (imgX + withTempChanges.width);
    boolean inBoundsY = mouseY >= imgY && mouseY <= (imgY + withTempChanges.height);
    System.out.println(inBoundsX + " " +inBoundsY);
    if (gui.toggle("Paintbrush") && inBoundsX && inBoundsY) {
      updatePaintbrush();
      current = brush.applyPaint(current, imgX, imgY);
      //try {
      //  Thread.sleep(100);
      //}
      //catch(InterruptedException e) {}
    }
  }
}

void calcImageCoords() {
  int startW = 180;
  if (current.width > width - startW) {
    current.resize(width - startW, 0);
    imgX = 180;
  } else {
    imgX = width - ((width - startW) + current.width) / 2;
  }
  if (current.height > height) {
    current.resize(0, height);
    imgY = 0;
  } else {
    imgY = (height - current.height) / 2;
  }
  withTempChanges = current.copy();
}


void fileSelected(File selection) {
  String name = selection.getName();
  String ext = name.substring(name.lastIndexOf('.'));
  if (ext.equalsIgnoreCase(".png") || ext.equalsIgnoreCase(".jpg") || ext.equalsIgnoreCase(".jpeg") || ext.equalsIgnoreCase(".gif") || ext.equalsIgnoreCase(".tga")) {
    current = loadImage(selection.getPath().toString());
    calcImageCoords();
    original = current.copy();
    background(100);
  } else {
    //try {
    //  Thread.sleep(500);
    //}
    //catch(InterruptedException e) {}
    selectInput("File Invalid! Please select a new file.", "fileSelected");
  }
}

void updatePaintbrush() {
  myColor = gui.colorPicker("Brush Color");
  brush.setColor(color(myColor.hex));
  brush.setSize(gui.slider("Brush Size"));
}

void saveImage() {
  current = withTempChanges.copy();
  resetSliders();
  image(current, imgX, imgY);
  save("temp.jpeg");
  int w = current.width;
  int h = current.height;
  File f = new File(sketchPath() + "/temp.jpeg");
  System.out.println(f.getAbsolutePath());
  try {
    BufferedImage scr = ImageIO.read(f);
    BufferedImage pic = scr.getSubimage(imgX, imgY, w, h);
    File output = new File(sketchPath() + "/image.jpeg");
    ImageIO.write(pic, "jpeg", output);
  }
  catch (IOException e) {
    e.printStackTrace();
  }
}
