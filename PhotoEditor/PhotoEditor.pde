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
 //private String userInput;
 private PImage current;
 private PImage withTempChanges;
 private int imgX, imgY;
 LazyGui gui;
 ControlP5 cp5;
 ControlGroup control;
 Textfield in;
 private float[] sliders;
 private String[] sliderNames;
 private Kernel[] kernels;
 private String userInput;
 private boolean firstClick;
 //private Paintbrush color;
 //private color selectedColor;

void setup() {
  size(1920, 1080, P2D);
  background(100);
  gui = new LazyGui(this, new LazyGuiSettings().setCellSize(26));
  cp5 = new ControlP5(this);
  control = new ControlGroup(cp5, "all cp5 elements");
  in = new Textfield(cp5, control, "input", "", width/2 - 400, height/2, 800, 100);
  in.hide();
  firstClick = false;
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
    if (!firstClick) {
      textInput();
      firstClick = true;
    }
    else {
      Submit();
      open(userInput);
    }
    
    if (current != null) {
      calcImageCoords();
      image(current, imgX, imgY);
    }
  }
  
}

void keyPressed() {
  if (keyCode == ENTER && in.isVisible())
    Submit();
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

void textInput() {
  fill(200);
  rect(width/2 - 400, height/2 - 200, 800, 400);
  fill(0);
  textSize(32);
  text("Enter the path of the image to be imported", width/2 - 275, height/2 - 150);
  fill(255);
  textSize(32);
  in.show();
  in.setFont(createFont("Times New Roman", 32));
}

void Submit() {
  userInput = in.getText();
  in.hide();
  background(100);
}
