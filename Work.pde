final int COUNT = 9;

class Work {
  private Arcs arc[] = new Arcs[8];
  private Grid grid[] = new Grid[8];
  private color[] palette;

  public Work(PApplet context) {
    final float size = min(context.width, context.height)/4;

    this.palette = new color[]{Palette.WHITE, Palette.BLACK, 
      Palette.BLUE, Palette.RED, Palette.YELLOW, 
      Palette.YELLOW, Palette.BLUE, Palette.WHITE, 
      Palette.WHITE, Palette.YELLOW, Palette.RED, 
      Palette.RED, Palette.WHITE, Palette.BLUE};

    genGrids(size);
    genArcs(size);
  }
  private color[] getGridSubPalette(int position) {
    color[] out;

    switch(position) {
    case 0:
      out = new color[]{palette[2], palette[0], palette[3], palette[0], palette[11], palette[12], palette[0], palette[0]};
      break;
    case 1:
      out = new color[]{palette[0], palette[0], palette[6], palette[5], palette[2], palette[0], palette[4], palette[0]};
      break;
    case 2:
      out = new color[]{palette[3], palette[2], palette[0], palette[1], palette[12], palette[0], palette[11], palette[1]};
      break;
    case 3:
      out = new color[]{palette[0], palette[6], palette[1], palette[5], palette[2], palette[4], palette[1], palette[0]};
      break;
    case 4:
      out = new color[]{palette[12], palette[1], palette[9], palette[8], palette[11], palette[1], palette[13], palette[0]};
      break;
    case 5:
      out = new color[]{palette[1], palette[5], palette[7], palette[0], palette[1], palette[0], palette[8], palette[10]};
      break;
    case 6:
      out = new color[]{palette[0], palette[9], palette[0], palette[8], palette[11], palette[13], palette[0], palette[0]};
      break;
    case 7:
      out = new color[]{palette[7], palette[5], palette[0], palette[0], palette[10], palette[0], palette[0], palette[8]};
      break;
    default:
      out = new color[]{palette[4], palette[1], palette[2], palette[3], palette[4], palette[1], palette[2], palette[3]};
    }

    return out;
  }
  private color[] getArcSubPalette(int position) {
    color[] out;

    switch(position) {
    case 0:
      out = new color[]{palette[2], palette[3]};
      break;
    case 1:
      out = new color[]{palette[2], palette[4]};
      break;
    case 2:
      out = new color[]{palette[11], palette[12]};
      break;
    case 3:
      out = new color[]{palette[11], palette[13]};
      break;
    case 4:
      out = new color[]{palette[5], palette[6]};
      break;
    case 5:
      out = new color[]{palette[5], palette[7]};
      break;
    case 6:
      out = new color[]{palette[8], palette[9]};
      break;
    case 7:
      out = new color[]{palette[8], palette[10]};
      break;
    default:
      out = new color[]{palette[0], palette[0]};
    }

    return out;
  }
  private void genGrids(float size) {
    grid[0] = new Grid(0, 0, size, "NW", palette[0], getGridSubPalette(0));
    grid[1] = new Grid(3*size, 0, size, "NE", palette[0], getGridSubPalette(1));
    grid[2] = new Grid(size, size, size, "SE", palette[0], getGridSubPalette(2));
    grid[3] = new Grid(2*size, size, size, "SW", palette[0], getGridSubPalette(3));
    grid[4] = new Grid(size, 2*size, size, "NE", palette[0], getGridSubPalette(4));
    grid[5] = new Grid(2*size, 2*size, size, "SE", palette[0], getGridSubPalette(5));
    grid[6] = new Grid(0, 3*size, size, "SW", palette[0], getGridSubPalette(6));
    grid[7] = new Grid(3*size, 3*size, size, "SE", palette[0], getGridSubPalette(7));
  }
  private void genArcs(float size) {
    arc[0] = new Arcs(getArcSubPalette(0), size, 0, size, "SW");
    arc[1] = new Arcs(getArcSubPalette(1), 2*size, 0, size, "SE");
    arc[2] = new Arcs(getArcSubPalette(2), 0, size, size, "NE");
    arc[3] = new Arcs(getArcSubPalette(3), 0, 2*size, size, "SE");
    arc[4] = new Arcs(getArcSubPalette(4), 3*size, size, size, "NW");
    arc[5] = new Arcs(getArcSubPalette(5), 3*size, 2*size, size, "SW");
    arc[6] = new Arcs(getArcSubPalette(6), size, 3*size, size, "NW");
    arc[7] = new Arcs(getArcSubPalette(7), 2*size, 3*size, size, "NE");
  }

  public void draw() {
    for (Arcs temp : arc) {
     temp.show();
     }
    for (int i=0; i<grid.length; i++) {
      grid[i].show();
    }
  }
}