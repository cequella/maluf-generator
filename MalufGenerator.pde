final static boolean ZUEIRA_MODE = false;
final static boolean VERBOSE = true;

Work work;
color[] palette;
PImage frame;

public void settings() {
  if (ZUEIRA_MODE) {
    size(902, 600);
  } else {
    size(600, 600);
  }
}

public void keyPressed() {
  if (keyCode == ESC) exit();
  if (key == ' ') work.changePalette(Palette.gen(this));
}

public void setup() {
  if (ZUEIRA_MODE) frame = loadImage("frame.jpg");

  palette = Palette.gen(this);

  if (ZUEIRA_MODE) {
    work = new Work(this, 355, 120, 185, palette);
  } else {
    work = new Work(this, 0, 0, width, palette);
  }
}

public void draw() {
  if (ZUEIRA_MODE) image(frame, 0, 0, width, height);
  work.draw();
}