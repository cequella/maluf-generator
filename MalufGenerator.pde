Work work;
color[] palette;

public void settings() {
  size(700, 700);
}

public void keyPressed() {
  if (keyCode == ESC) exit();
}

public void setup() {
  palette = new color[]{Palette.WHITE, Palette.BLACK, 
    Palette.BLUE, Palette.RED, Palette.YELLOW, 
    Palette.YELLOW, Palette.BLUE, Palette.WHITE, 
    Palette.WHITE, Palette.YELLOW, Palette.RED, 
    Palette.RED, Palette.WHITE, Palette.BLUE};
    
  work = new Work(this, palette);
}

public void draw() {
  work.draw();
}