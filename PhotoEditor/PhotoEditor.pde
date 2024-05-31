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
 private boolean submitted;
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
  userInput = "";
  submitted = false;
  gui.button("Import");
  gui.button("Export");
  
  sliderNames = new String[] {"Exposure", "Sharpness", "Contrast", "Saturation", "Highlights", "Shadows", "Tempurature", "Tint", "Sharpness"};
  sliders = new float[9];
  sliders[0] = gui.sliderInt("Exposure", 0, -100, 100);
  sliders[1] = gui.sliderInt("Sharpness", 0, -100, 100);
  sliders[2] = gui.sliderInt("Contrast", 1, 1, 5);
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
  float exposure = sliders[0];
  float saturation = sliders[3];
  float contrast = sliders[2];
  for (int i = 0; i < sliders.length; i++) {
    if (gui.slider(sliderNames[i]) != sliders[i] && withTempChanges != null) {
      sliders[i] = gui.slider(sliderNames[i]);
      //updateImage(true);
    }
  }
  if (withTempChanges != null) {   
    // restructure code, no conditional for modifications. switch to if(
    // copy == null) then do the import stuff
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
    textInput();
  }
  if (submitted) {
    open(userInput);
    calcImageCoords();
    image(withTempChanges, imgX, imgY);
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
    withTempChanges = current.copy();
    userInput = "";
    submitted = false;
}

void calcImageCoords() {
  int w = current.width;
  int h = current.height;
  int startW = 180;
  if (current.width > width - startW) {
    current.resize(width - startW, 0);
    imgX = 250;
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
  gui.showGui();
  submitted = true;
}
