class Work {
  private final float size;

  private PApplet context;
  private int     x, y;
  private Tile    tile[] = new Tile[16];
  private color[] palette;
  private int     count;

  public Work(PApplet context, int x, int y, int size, int count, color[] palette) {
    this.context = context;
    this.x = x;
    this.y = y;
    this.size = size/4;
    this.palette = palette;
    this.count = count;

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
    tile[0]  = new Grid(this.x, this.y, size, this.count, Tile.NW, palette[0], getGridSubPalette(0));
    tile[1]  = new Arcs(this.x+size, this.y, size, this.count, Tile.SW, getArcSubPalette(0));
    tile[2]  = new Arcs(this.x+2*size, this.y, size, this.count, Tile.SE, getArcSubPalette(1));
    tile[3]  = new Grid(this.x+3*size, this.y, size, this.count, Tile.NE, palette[0], getGridSubPalette(1));

    //Second Line
    tile[4]  = new Arcs(this.x, this.y+size, size, this.count, Tile.NE, getArcSubPalette(2));
    tile[5]  = new Grid(this.x+size, this.y+size, size, this.count, Tile.SE, palette[0], getGridSubPalette(2));
    tile[6]  = new Grid(this.x+2*size, this.y+size, size, this.count, Tile.SW, palette[0], getGridSubPalette(3));
    tile[7]  = new Arcs(this.x+3*size, this.y+size, size, this.count, Tile.NW, getArcSubPalette(3));

    //Third Line
    tile[8]  = new Arcs(this.x, this.y+2*size, size, this.count, Tile.SE, getArcSubPalette(4));
    tile[9]  = new Grid(this.x+size, this.y+2*size, size, this.count, Tile.NE, palette[0], getGridSubPalette(4));
    tile[10] = new Grid(this.x+2*size, this.y+2*size, size, this.count, Tile.NW, palette[0], getGridSubPalette(5));
    tile[11] = new Arcs(this.x+3*size, this.y+2*size, size, this.count, Tile.SW, getArcSubPalette(5));

    //Last Line
    tile[12] = new Grid(this.x, this.y+3*size, size, this.count, Tile.SW, palette[0], getGridSubPalette(6));
    tile[13] = new Arcs(this.x+size, this.y+3*size, size, this.count, Tile.NW, getArcSubPalette(6));
    tile[14] = new Arcs(this.x+2*size, this.y+3*size, size, this.count, Tile.NE, getArcSubPalette(7));
    tile[15] = new Grid(this.x+3*size, this.y+3*size, size, this.count, Tile.SE, palette[0], getGridSubPalette(7));
  }

  public void draw() {
    for (int i=0; i<tile.length; i++) {
      tile[i].show();
    }

    //Draw lines
    strokeWeight(2);
    stroke(palette[0]);
    strokeCap(SQUARE);
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
  public void rotatePalette(int direction){
    color[] temp = new color[14];
    
    temp[0] = this.palette[0];
    temp[1] = this.palette[1];
    
    if(direction>0){
      temp[2]  = this.palette[11];
      temp[3]  = this.palette[13];
      temp[4]  = this.palette[12];
      temp[5]  = this.palette[2];
      temp[6]  = this.palette[3];
      temp[7]  = this.palette[4];
      temp[8]  = this.palette[5];
      temp[9]  = this.palette[7];
      temp[10] = this.palette[6];
      temp[11] = this.palette[8];
      temp[12] = this.palette[9];
      temp[13] = this.palette[10];
    } else {
      temp[11] = this.palette[2];
      temp[13] = this.palette[3];
      temp[12] = this.palette[3];
      temp[2]  = this.palette[5];
      temp[3]  = this.palette[6];
      temp[4]  = this.palette[7];
      temp[5]  = this.palette[8];
      temp[7]  = this.palette[9];
      temp[6]  = this.palette[10];
      temp[8]  = this.palette[11];
      temp[9]  = this.palette[12];
      temp[10] = this.palette[13];
    }
    
    this.changePalette(temp);
  }
  void addCount(){
    this.count++;
    this.genTiles(this.size);
  }
  void subCount(){
    this.count--;
    this.genTiles(this.size);
  }
}