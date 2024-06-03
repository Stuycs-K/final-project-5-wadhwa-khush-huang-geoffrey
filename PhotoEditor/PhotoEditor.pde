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
 //private Paintbrush color;
 //private color selectedColor;
 float expL, conL, satL;

void setup() {
  size(1920, 1080, P2D);
  background(100);
  gui = new LazyGui(this, new LazyGuiSettings().setCellSize(22));
  gui.button("Import");
  gui.button("Export");
  gui.button("Clear");
  
  sliderNames = new String[] {"Exposure", "Contrast", "Saturation"};
  sliders = new float[3];
  sliders[0] = gui.sliderInt("Exposure", 0, -100, 100);
  sliders[1] = gui.slider("Contrast", 1, 1, 5);
  sliders[2] = gui.sliderInt("Saturation", 0, -100, 100);
   
}

void draw() {
  float exposure = sliders[0];
  float saturation = sliders[2];
  float contrast = sliders[1];
  for (int i = 0; i < sliders.length; i++) {
    if (gui.slider(sliderNames[i]) != sliders[i] && withTempChanges != null) {
      sliders[i] = gui.slider(sliderNames[i]);
    }
  }
  if (withTempChanges != null) {
    //background(100);
    image(withTempChanges, imgX, imgY);
    for (int i = 0; i < current.width; i++){
       for (int j = 0; j < current.height; j++){
        // exposure modification
        float red = red(current.get(i, j)) + exposure;
        float green = green(current.get(i, j)) + exposure;
        float blue = blue(current.get(i, j)) + exposure;  
        
        // saturation modification
        float max = Math.max(Math.max(red, green), blue);
        if (red == max){
          red += saturation;
          if (green == Math.max(green, blue)){
            green += saturation;
          }
          else{
            blue += saturation;
          }
        }
        if (green == max){
          green += saturation;
          if (red == Math.max(red, blue)){
            red += saturation;
          }
          else{
            blue += saturation;
          }
        }
        if (blue == max){
          blue += saturation;
          if (green == Math.max(green, red)){
            green += saturation;
          }
          else{
            red += saturation;
          }
        }
        
        // contrast modification
        red = Math.min(255, contrast * red);
        green = Math.min(255, contrast * green);
        blue = Math.min(255, contrast * blue);
        
        color c = color(red, green, blue);
        withTempChanges.set(i,j,(int) c);
      }
  }
  
  }
  if (gui.button("Import")) {
    selectInput("Select a file to process", "fileSelected");
  }
  if (gui.button("Clear")) {
    background(100);
    current = null;
    withTempChanges = null;
  }
  
  expL = exposure;
  conL = contrast;
  satL = saturation;
  
}

void calcImageCoords() {
  int startW = 180;
  if (current.width > width - startW) {
    current.resize(width - startW, 0);
    imgX = 180;
  }
  else {
    imgX = width - ((width - startW) + current.width) / 2; 
  }
  if (current.height > height) {
    current.resize(0, height);  
    imgY = 0;
  }
  else {
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
    background(100);
  }
  else {
    //try {
    //  Thread.sleep(500);
    //}  
    //catch(InterruptedException e) {}
    selectInput("File Invalid! Please select a new file.", "fileSelected");
  }
}
