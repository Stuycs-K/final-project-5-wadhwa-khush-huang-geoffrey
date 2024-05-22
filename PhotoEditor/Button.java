import java.io.File;
import java.io.Files;
import java.io.FilenameFilter;
public class Button {
  private PImage icon;
  private int width, height;
  private boolean active;
  private String name;
  private char keybind;

  public Button(String iconPath, int w, int h, String n, char bind) {
    //Copying image to data and creating a PImage with the relevant qualities
    File i = new File(iconPath);
    Path target = Files.copy(i.getPath(), "data/" + i.getName(), CopyOption.COPY_ATTRIBUTES);
    icon = loadImage(target);

    width = w;
    height = h;
    name = n;
    keybind = bind;

  }

  public void clicked() {

  }
  public boolean isToggled() {

  }
  public PImage display() {

  }
  public String getName() {

  }
  public char getKeybind() {

  }
}
