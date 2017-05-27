Work work;
color[] palette;
PImage frame;

public void settings() {
  size(902, 600);
}

public void keyPressed() {
  if (keyCode == ESC) exit();
}

public void setup() {
  frame = loadImage("frame.jpg");
  
  palette = new color[]{Palette.WHITE, Palette.BLACK, 
    Palette.BLUE, Palette.RED, Palette.YELLOW, 
    Palette.YELLOW, Palette.BLUE, Palette.WHITE, 
    Palette.WHITE, Palette.YELLOW, Palette.RED, 
    Palette.RED, Palette.WHITE, Palette.BLUE};

  work = new Work(this, 355, 120, 185, palette);
}

public void draw() {
  image(frame, 0, 0, width, height);
  work.draw();
}