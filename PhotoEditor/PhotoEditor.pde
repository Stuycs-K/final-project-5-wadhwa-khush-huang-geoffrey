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
 //private ArrayList<String> allModes;
 //private int currentMode;
 //private ArrayList<Kernel> kernels;
 //private ArrayList<Button> buttons;
 //private Paintbrush color;
 //private color selectedColor;

void setup() {
  size(1200, 675, P2D);
  gui = new LazyGui(this);
}
void draw() {
  float x = gui.slider("exposure", min);
  float y = gui.slider("darkness", min);
  float z = gui.slider("outline", min);
  background(gui.colorPicker("background").hex);
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
