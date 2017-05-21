final int COUNT = 9;

Arcs arc[];

public void settings() {
  size(600, 600);
}

public void keyPressed(){
  if(keyCode == ESC) exit();
}

public void setup() {
  final int size = min(width,height)/4;
  arc = new Arcs[8];
  
  arc[0] = new Arcs(Palette.BLACK, Palette.RED,  size,   0, size,      "SW");
  arc[1] = new Arcs(Palette.BLACK, Palette.BLUE, 2*size, 0, size,      "SE");
  arc[2] = new Arcs(Palette.RED, Palette.WHITE,  0,      size, size,   "NE");
  arc[3] = new Arcs(Palette.RED, Palette.BLACK,  0,      2*size, size, "SE");
  arc[4] = new Arcs(Palette.BLUE, Palette.BLACK, 3*size, size, size,   "NW");
  arc[5] = new Arcs(Palette.BLUE, Palette.WHITE, 3*size, 2*size, size, "SW");
  arc[6] = new Arcs(Palette.WHITE, Palette.BLUE, size,   3*size, size, "NW");
  arc[7] = new Arcs(Palette.WHITE, Palette.RED,  2*size, 3*size, size, "NE");
}

public void draw(){
  for(Arcs temp : arc){
    temp.show();
  }
}