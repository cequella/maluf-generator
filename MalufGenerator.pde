final static boolean ZUEIRA_MODE = true;
final static boolean VERBOSE = false;
final static int     GUI_SIZE = 300;

Work work;  
color[] palette;
PImage frame;
boolean released = true;

int panelX;
GUI gui;

public void keyPressed() {
  if (keyCode == ESC) exit();

  if (released) {
    released = false;
    if (key == 'q' || key == 'Q') work.changePalette(Palette.gen(this, Palette.DESTIJL));
    if (key == 'w' || key == 'W') work.changePalette(Palette.gen(this, Palette.BICHROMATIC));
    if (key == 'e' || key == 'E') work.changePalette(Palette.gen(this, Palette.COLD));
    if (key == 'x' || key == 'X') work.rotatePalette(1);
    if (key == 'z' || key == 'Z') work.rotatePalette(-1);
    if (key == '+') work.addCount();
    if (key == '-') work.subCount();
  }
}
public void keyReleased() {
  released = true;
}
public void settings() {
  if (ZUEIRA_MODE) {
    panelX = 902;
  } else {
    panelX = 600;
  }
  
  size(panelX+GUI_SIZE, 600);
}
public void setup() {
  if (ZUEIRA_MODE) frame = loadImage("frame.jpg");

  palette = Palette.gen(this, Palette.DESTIJL);

  if (ZUEIRA_MODE) {
    work = new Work(this, 355, 120, 185, 9, palette);
  } else {
    work = new Work(this, 0, 0, panelX, 9, palette);
  }
  
  gui = new GUI(this, work, panelX);
}

public void draw() {
  if (ZUEIRA_MODE) image(frame, 0, 0, panelX, height);
  work.draw();
  gui.draw();
}