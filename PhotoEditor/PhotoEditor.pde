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
 LazyGui gui;
 float max = 100;
 float min = -100;
 float start = 0;
 PImage img, copy; // img is just for testing right now
 //private ArrayList<String> allModes;
 //private int currentMode;
 //private ArrayList<Kernel> kernels;
 //private ArrayList<Button> buttons;
 //private Paintbrush color;
 //private color selectedColor;

void setup() {
  size(1200, 675, P2D);
  gui = new LazyGui(this);
  img = loadImage("test.jpeg");
  copy = img.copy();
  
  //kernels
  
  
}
void draw() {
  float exposure = gui.slider("exposure", start, min, max);
  float darkness = gui.slider("darkness", start, min, max);
  float outline = gui.slider("outline", start, min, max);
  background(gui.colorPicker("background").hex);
  //float exposure = gui.sliderInt("exposure", 7);
  boolean exposureMode = gui.toggle("Exposure");
  //we need to set these to be global variables, maybe in an ArrayList?
  image(img, 200, 200);
  image(copy, 200, 400);
  
  for (int i = 0; i < img.width; i++){
    for (int j = 0; j < img.height; j++){
      float red = red(img.get(i, j)) + exposure;
      float green = green(img.get(i, j)) + exposure;
      float blue = blue(img.get(i, j)) + exposure;
      color c = color(red, green, blue);
      copy.set(i,j,(int) c);
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
