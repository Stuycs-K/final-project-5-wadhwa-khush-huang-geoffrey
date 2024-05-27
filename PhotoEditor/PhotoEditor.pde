import com.krab.lazy.*;
import java.io.IOException;
import java.nio.file.Files;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import com.krab.lazy.*;
 //TO BE IMPLEMENTED IN APPROPRIATE STAGES
 //private String userInput;
 private PImage current;
 private PImage withTempChanges;
 private int imgX, imgY;
 LazyGui gui;
 private float[] sliders;
 private String[] sliderNames;
 private Kernel[] kernels;
 //private Paintbrush color;
 //private color selectedColor;

void setup() {
  size(1920, 1080, P2D);
  gui = new LazyGui(this, new LazyGuiSettings().setCellSize(26));
  gui.button("Import");
  gui.button("Export");
  sliderNames = new String[] {"Exposure", "Sharpness", "Contrast", "Saturation", "Highlights", "Shadows", "Tempurature", "Tint", "Sharpness"};
  sliders = new float[9];
  sliders[0] = gui.slider("Exposure", 0, -100, 100);
  sliders[1] = gui.slider("Sharpness", 0, -100, 100);
  sliders[2] = gui.slider("Contrast", 0, -100, 100);
  sliders[3] = gui.slider("Saturation", 0, -100, 100);
  sliders[4] = gui.slider("Highlights", 0, -100, 100);
  sliders[5] = gui.slider("Shadows", 0, -100, 100);
  sliders[6] = gui.slider("Tempurature", 0, -100, 100);
  sliders[7] = gui.slider("Tint", 0, -100, 100);
  sliders[8] = gui.slider("Sharpness", 0, -100, 100); 
  
  kernels = new Kernel[9];
  kernels[0] = new Kernel(new float[][] {{1.01, 1.01, 1.01}, {1.01, 1.01, 1.01}, {1.01, 1.01, 1.01}});
}
void draw() {
  background(100);
  for (int i = 0; i < sliders.length; i++) {
    if (gui.slider(sliderNames[i]) != sliders[i] && withTempChanges != null) {
      sliders[i] = gui.slider(sliderNames[i]);
      updateImage();
    }    
  }
  if (withTempChanges != null) { 
    image(withTempChanges, imgX, imgY);  
  }
  if (gui.button("Import")) {
    open("largeTest.jpeg");
    if (current != null) {
      calcImageCoords();
      image(current, imgX, imgY);
    }
  }
  
}

void keyPressed() {
  
}

void open(String imgPath) {
    //Copying image to data and creating a PImage with the relevant qualities
    File i = new File(imgPath);
    Path in = i.toPath();
    Path out = new File("data/" + i.getName()).toPath();
    String target = "";
    try {
      target = Files.copy(in, out, StandardCopyOption.REPLACE_EXISTING).toString();
    }
    catch(IOException e) {}
    current = loadImage(i.getName());
    withTempChanges = current;
    
}

void calcImageCoords() {
  int w = current.width;
  int h = current.height;
  int startW = 250;
  if (current.width > width - startW) {
    current.resize(1670, 0);
    imgX = 250;
  }
  else {
    imgX = (1670 + current.width) / 2; 
  }
  if (current.height > height) {
    current.resize(0, 1080);  
    imgY = 0;
  }
  else {
    imgY = (1080 - current.height) / 2;  
  }
  withTempChanges = current;
}

void updateImage() {
  for (int i = 0; i < sliders.length; i++) {
    float val = sliders[i];
    if (val != 0.0) {
      kernels[i].apply(current, withTempChanges);  
    }
  }
}
