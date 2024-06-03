import com.krab.lazy.*;
import controlP5.*;
import java.io.IOException;
import java.nio.file.Files;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import com.krab.lazy.*;
 //TO BE IMPLEMENTED IN APPROPRIATE STAGES
 private PImage current;
 private PImage withTempChanges;
 private int imgX, imgY;
 private LazyGui gui;
 private float[] sliders;
 private String[] sliderNames;
 private Kernel[] kernels;
 //private Paintbrush color;
 //private color selectedColor;

void setup() {
  size(1920, 1080, P2D);
  background(100);
  gui = new LazyGui(this, new LazyGuiSettings().setCellSize(22));
  gui.button("Import");
  gui.button("Export");
  sliderNames = new String[] {"Exposure", "Sharpness", "Contrast", "Saturation", "Highlights", "Shadows", "Tempurature", "Tint", "Sharpness"};
  sliders = new float[9];
  sliders[0] = gui.sliderInt("Exposure", 0, -100, 100);
  sliders[1] = gui.sliderInt("Sharpness", 0, -100, 100);
  sliders[2] = gui.sliderInt("Contrast", 0, -100, 100);
  sliders[3] = gui.sliderInt("Saturation", 0, -100, 100);
  sliders[4] = gui.sliderInt("Highlights", 0, -100, 100);
  sliders[5] = gui.sliderInt("Shadows", 0, -100, 100);
  sliders[6] = gui.sliderInt("Tempurature", 0, -100, 100);
  sliders[7] = gui.sliderInt("Tint", 0, -100, 100);
  sliders[8] = gui.sliderInt("Sharpness", 0, -100, 100); 
  
  kernels = new Kernel[9];
  kernels[0] = new Kernel(new float[][] {{0, 0, 0}, {0, 1.05, 0}, {0, 0, 0}});
  
}
void draw() {
  for (int i = 0; i < sliders.length; i++) {
    if (gui.slider(sliderNames[i]) > sliders[i] && withTempChanges != null) {
      sliders[i] = gui.slider(sliderNames[i]);
      //updateImage(true);
    }
  }
  if (withTempChanges != null) { 
    image(withTempChanges, imgX, imgY);  
  }
  if (gui.button("Import")) {
    selectInput("Select a file to process", "fileSelected");
  }
}

void keyPressed() {
}

void calcImageCoords() {
  int w = current.width;
  int h = current.height;
  int startW = 200;
  if (current.width > width - startW) {
    current.resize(width - (startW + 20), 0);
    imgX = 180;
  }
  else {
    imgX = (1670 + current.width) / 2; 
  }
  if (current.height > height) {
    current.resize(0, height);  
    imgY = 0;
  }
  else {
    imgY = (1080 - current.height) / 2;  
  }
  withTempChanges = current;
}

void fileSelected(File selection) {
  String name = selection.getName();
  String ext = name.substring(name.lastIndexOf('.'));
  if (ext.equals(".png") || ext.equals(".jpg") || ext.equals(".jpeg") || ext.equals(".gif") || ext.equals(".tga")) {
    current = loadImage(selection.getPath().toString());
    withTempChanges = current;
    calcImageCoords();
    background(100);
  }
  else {
    fill(0);
    rect(width/2 - 200, height/2 - 100, 200, 100);
    fill(255);
    text("File Invalid! Please select a new file.", width/2 - 200, height/2 - 100, 200, 100);
    try {
      Thread.sleep(2000);
    }  
    catch(InterruptedException e) {}
    selectInput("File Invalid! Please select a new file.", "fileSelected");
  }
}
