import java.io.IOException;
import java.nio.file.Files;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
 //TO BE IMPLEMENTED IN APPROPRIATE STAGES
 //private String userInput;
 private PImage current;
 private PImage withTempChanges;
 //private ArrayList<String> allModes;
 //private int currentMode;
 //private ArrayList<Kernel> kernels;
 //private ArrayList<Button> buttons;
 //private Paintbrush color;
 //private color selectedColor;

void setup() {
  size(1200, 675);
}
void draw() {
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
