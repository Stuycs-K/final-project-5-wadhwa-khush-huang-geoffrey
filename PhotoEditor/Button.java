import processing.core.PImage;
import java.io.IOException;
import java.nio.file.Files;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
public class Button {
  PImage icon;
  private int width, height;
  private boolean active;
  private String name;
  private char keybind;

  public Button(String iconPath, int w, int h, String n, char bind) {
    //Copying image to data and creating a PImage with the relevant qualities
    File i = new File(iconPath);
    Path in = i.toPath();
    Path out = new File("data/" + i.getName()).toPath();
    String target = "";
    try {
      target = Files.copy(in, out, StandardCopyOption.REPLACE_EXISTING).toString();
    }
    catch(IOException e) {}
    icon = PImage.loadImage(i.getName());

    width = w;
    height = h;
    name = n;
    keybind = bind;
  }

  public void clicked() {
    active = !active;
  }
  public boolean isToggled() {
    return active;
  }
  public PImage display() {
    return icon;
  }
  public String getName() {
    return name;
  }
  public char getKeybind() {
    return keybind;
  }
}
