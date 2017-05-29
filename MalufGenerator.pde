final static boolean ZUEIRA_MODE = false;
final static boolean VERBOSE = false;

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
  if (key == 'q' || key == 'Q') work.changePalette(Palette.gen(this, Palette.DESTIJL));
  if (key == 'w' || key == 'W') work.changePalette(Palette.gen(this, Palette.BICROMATIC));
  if (key == 'e' || key == 'E') work.changePalette(Palette.gen(this, Palette.COLD));
}

public void setup() {
  if (ZUEIRA_MODE) frame = loadImage("frame.jpg");

  palette = Palette.gen(this, Palette.DESTIJL);

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