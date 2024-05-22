import processing.core.PImage;
public class Button {
  PImage icon;
  private int width, height;
  private boolean active;
  private String name;
  private char keybind;

  public Button(String iconPath, int w, int h, String n, char bind) {
    icon = loadImage(iconPath);
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
