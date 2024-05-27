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
 float max = 10;
 float min = 0;
 private boolean[] toggles;
 private float[] sliders;
 //private int currentMode;
 //private ArrayList<Kernel> kernels;
 //private Paintbrush color;
 //private color selectedColor;

void setup() {
  size(1200, 675, P2D);
  gui = new LazyGui(this);
  gui.setCellSize(19);
  gui.button("Import");
  gui.button("Export");
  //toggles = new boolean[10];
  //toggles[0] = gui.toggle("Paintbrush");
  //toggles[1] = gui.toggle("White Balance");
  //toggles[2] = gui.toggle("Sharpness");
  //toggles[3] = gui.toggle("Contrast");
  //toggles[4] = gui.toggle("Saturation");
  //toggles[5] = gui.toggle("Highlights");
  //toggles[6] = gui.toggle("Shadows");
  //toggles[7] = gui.toggle("Tempurature");
  //toggles[8] = gui.toggle("Tint");
  //toggles[9] = gui.toggle("Sharpness");
  sliders = new float[10];
  sliders[1] = gui.slider("White Balance", 0, -100, 100);
  sliders[2] = gui.slider("Sharpness", 0, -100, 100);
  sliders[3] = gui.slider("Contrast", 0, -100, 100);
  sliders[4] = gui.slider("Saturation", 0, -100, 100);
  sliders[5] = gui.slider("Highlights", 0, -100, 100);
  sliders[6] = gui.slider("Shadows", 0, -100, 100);
  sliders[7] = gui.slider("Tempurature", 0, -100, 100);
  sliders[8] = gui.slider("Tint", 0, -100, 100);
  sliders[9] = gui.slider("Sharpness", 0, -100, 100);  
}
void draw() {
  background(100);
  if (withTempChanges != null) {
    image(withTempChanges, imgX, imgY);  
  }
  if (gui.button("Import")) {
    open("test.jpeg");
    calcImageCoords();
    image(current, imgX, imgY);
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
}
