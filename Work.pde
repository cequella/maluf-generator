final int COUNT = 9;

class Work {
  private Arcs arc[] = new Arcs[8];
  private Grid grid[] = new Grid[8];

  public Work(PApplet context) {
    final float size = min(context.width, context.height)/4;
    
    genGrids(size);
    genArcs(size);
  }
  private void genGrids(float size){
    color[] palette = {Palette.WHITE, Palette.BLUE, Palette.YELLOW, Palette.RED};
    
    grid[0] = new Grid(0, 0, size, true, palette);
    grid[1] = new Grid(3*size, 0, size, false, palette);
    grid[2] = new Grid(size, size, size, true, palette);
    grid[3] = new Grid(2*size, size, size, false, palette);
    grid[4] = new Grid(size, 2*size, size, false, palette);
    grid[5] = new Grid(2*size, 2*size, size, true, palette);
    grid[6] = new Grid(0, 3*size, size, false, palette);
    grid[7] = new Grid(3*size, 3*size, size, true, palette);
  }
  private void genArcs(float size){
    arc[0] = new Arcs(Palette.BLACK, Palette.RED, size, 0, size, "SW");
    arc[1] = new Arcs(Palette.BLACK, Palette.BLUE, 2*size, 0, size, "SE");
    arc[2] = new Arcs(Palette.RED, Palette.WHITE, 0, size, size, "NE");
    arc[3] = new Arcs(Palette.RED, Palette.BLACK, 0, 2*size, size, "SE");
    arc[4] = new Arcs(Palette.BLUE, Palette.BLACK, 3*size, size, size, "NW");
    arc[5] = new Arcs(Palette.BLUE, Palette.WHITE, 3*size, 2*size, size, "SW");
    arc[6] = new Arcs(Palette.WHITE, Palette.BLUE, size, 3*size, size, "NW");
    arc[7] = new Arcs(Palette.WHITE, Palette.RED, 2*size, 3*size, size, "NE");
    
    /*
    palette = Palette.gen(this);
     arc[0] = new Arcs(palette[0], palette[1], size,   0, size,      "SW");
     arc[1] = new Arcs(palette[0], palette[2], 2*size, 0, size,      "SE");
     
     arc[2] = new Arcs(palette[3], palette[4], 0,      size, size,   "NE");
     arc[3] = new Arcs(palette[3], palette[5], 0,      2*size, size, "SE");
     
     arc[4] = new Arcs(palette[6], palette[7], 3*size, size, size,   "NW");
     arc[5] = new Arcs(palette[6], palette[8], 3*size, 2*size, size, "SW");
     
     arc[6] = new Arcs(palette[9], palette[10], size,   3*size, size, "NW");
     arc[7] = new Arcs(palette[9], palette[11], 2*size, 3*size, size, "NE");*/
  }

  public void draw() {
    for (Arcs temp : arc) {
      temp.show();
    }
    for (Grid temp : grid) {
      temp.show();
    }
  }
}