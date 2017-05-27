final int COUNT = 9;

class Work {
  private final float size;

  private PApplet context;
  private int     x, y;
  private Tile    tile[] = new Tile[16];
  private color[] palette;

  public Work(PApplet context, int x, int y, int size, color[] palette) {
    this.context = context;
    this.x = x;
    this.y = y;
    this.size = size/4;
    this.palette = palette;

    genTiles(this.size);
  }
  private color[] getGridSubPalette(int position) {
    return getPaletteColors(SRC.gridPaletteIndex[position]);
  }
  private color[] getArcSubPalette(int position) {
    return getPaletteColors(SRC.arcPaletteIndex[position]);
  }
  private color[] getPaletteColors(int[] index) {
    color[] out = new color[index.length];
    for (int i=0; i<index.length; i++) {
      final int id = index[i];

      if (id < 0 || id > palette.length) {
        out[i] = #FF00FF;
      } else {
        out[i] = palette[id];
      }
    }
    return out;
  }

  private void genTiles(float size) {
    //First Line
    tile[0]  = new Grid(this.x, this.y, size, Tile.NW, palette[0], getGridSubPalette(0));
    tile[1]  = new Arcs(this.x+size, this.y, size, Tile.SW, getArcSubPalette(0));
    tile[2]  = new Arcs(this.x+2*size, this.y, size, Tile.SE, getArcSubPalette(1));
    tile[3]  = new Grid(this.x+3*size, this.y, size, Tile.NE, palette[0], getGridSubPalette(1));

    //Second Line
    tile[4]  = new Arcs(this.x, this.y+size, size, Tile.NE, getArcSubPalette(2));
    tile[5]  = new Grid(this.x+size, this.y+size, size, Tile.SE, palette[0], getGridSubPalette(2));
    tile[6]  = new Grid(this.x+2*size, this.y+size, size, Tile.SW, palette[0], getGridSubPalette(3));
    tile[7]  = new Arcs(this.x+3*size, this.y+size, size, Tile.NW, getArcSubPalette(3));

    //Third Line
    tile[8]  = new Arcs(this.x, this.y+2*size, size, Tile.SE, getArcSubPalette(4));
    tile[9]  = new Grid(this.x+size, this.y+2*size, size, Tile.NE, palette[0], getGridSubPalette(4));
    tile[10] = new Grid(this.x+2*size, this.y+2*size, size, Tile.NW, palette[0], getGridSubPalette(5));
    tile[11] = new Arcs(this.x+3*size, this.y+2*size, size, Tile.SW, getArcSubPalette(5));

    //Last Line
    tile[12] = new Grid(this.x, this.y+3*size, size, Tile.SW, palette[0], getGridSubPalette(6));
    tile[13] = new Arcs(this.x+size, this.y+3*size, size, Tile.NW, getArcSubPalette(6));
    tile[14] = new Arcs(this.x+2*size, this.y+3*size, size, Tile.NE, getArcSubPalette(7));
    tile[15] = new Grid(this.x+3*size, this.y+3*size, size, Tile.SE, palette[0], getGridSubPalette(7));
  }

  public void draw() {
    for (int i=0; i<tile.length; i++) {
      tile[i].show();
    }

    //Draw lines
    strokeWeight(2);
    stroke(palette[0]);
    line(this.x, this.y+this.size, this.x+4*this.size, this.y+this.size);
    line(this.x, this.y+3*this.size, this.x+4*this.size, this.y+3*this.size);
    line(this.x+this.size, this.y, this.x+this.size, this.y+4*this.size);
    line(this.x+3*this.size, this.y, this.x+3*this.size, this.y+4*this.size);
  }

  // Events
  public boolean mouseOverEdge(short id) {
    final int x = context.mouseX;
    final int y = context.mouseY;
    final float dSize = 2*size;

    switch(id) {
    case 0:
      return (x > this.size && x < dSize && y < this.size);
    case 1:
      return (x > dSize && y > this.size && y < dSize);
    case 2:
      return (x > this.size && x < dSize && y > dSize);
    case 3:
      return (x < this.size && y > this.size && y < dSize);
    default:
      return false;
    }
  }

  // Effects
  public void changePalette(color[] palette){
    this.palette = palette;
    
    tile[0].setPalette(getGridSubPalette(0));
    tile[1].setPalette(getArcSubPalette(0));
    tile[2].setPalette(getArcSubPalette(1));
    tile[3].setPalette(getGridSubPalette(1));

    tile[4].setPalette(getArcSubPalette(2));
    tile[5].setPalette(getGridSubPalette(2));
    tile[6].setPalette(getGridSubPalette(3));
    tile[7].setPalette(getArcSubPalette(3));

    tile[8].setPalette(getArcSubPalette(4));
    tile[9].setPalette(getGridSubPalette(4));
    tile[10].setPalette(getGridSubPalette(5));
    tile[11].setPalette(getArcSubPalette(5));

    tile[12].setPalette(getGridSubPalette(6));
    tile[13].setPalette(getArcSubPalette(6));
    tile[14].setPalette(getArcSubPalette(7));
    tile[15].setPalette(getGridSubPalette(7));
  }
  public void rotateEdgePalette(MouseEvent event, short edgeId) {
    if(event.getCount() == 0) return;
    
    final int factor = event.getCount()/abs(event.getCount());
    
  }
}