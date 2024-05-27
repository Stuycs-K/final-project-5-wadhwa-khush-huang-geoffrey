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
 float max = 10;
 float min = 0;
 private boolean[] toggles;
 //private ArrayList<float> sliders;
 //private int currentMode;
 //private ArrayList<Kernel> kernels;
 //private Paintbrush color;
 //private color selectedColor;

void setup() {
  size(1200, 675, P2D);
  gui = new LazyGui(this);
  
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
  
}
void draw() {
  if (gui.button("Import")) {
    open("test.jpeg");
    loadImage(current);
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
