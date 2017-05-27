final int COUNT = 9;

class Work {
  final float size;

  private Tile    tile[] = new Tile[16];
  private color[] palette;

  public Work(PApplet context, color[] palette) {
    this.size = min(context.width, context.height)/4;
    this.palette = palette;

    genTiles(size);
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
    tile[0]  = new Grid(0, 0, size, "NW", palette[0], getGridSubPalette(0));
    tile[1]  = new Arcs(size, 0, size, "SW", getArcSubPalette(0));
    tile[2]  = new Arcs(2*size, 0, size, "SE", getArcSubPalette(1));
    tile[3]  = new Grid(3*size, 0, size, "NE", palette[0], getGridSubPalette(1));

    //Second Line
    tile[4]  = new Arcs(0, size, size, "NE", getArcSubPalette(2));
    tile[5]  = new Grid(size, size, size, "SE", palette[0], getGridSubPalette(2));
    tile[6]  = new Grid(2*size, size, size, "SW", palette[0], getGridSubPalette(3));
    tile[7]  = new Arcs(3*size, size, size, "NW", getArcSubPalette(3));

    //Third Line
    tile[8]  = new Arcs(0, 2*size, size, "SE", getArcSubPalette(4));
    tile[9]  = new Grid(size, 2*size, size, "NE", palette[0], getGridSubPalette(4));
    tile[10] = new Grid(2*size, 2*size, size, "NW", palette[0], getGridSubPalette(5)); // ESSE ERA 'SE'
    tile[11] = new Arcs(3*size, 2*size, size, "SW", getArcSubPalette(5));

    //Last Line
    tile[12] = new Grid(0, 3*size, size, "SW", palette[0], getGridSubPalette(6));
    tile[13] = new Arcs(size, 3*size, size, "NW", getArcSubPalette(6));
    tile[14] = new Arcs(2*size, 3*size, size, "NE", getArcSubPalette(7));
    tile[15] = new Grid(3*size, 3*size, size, "SE", palette[0], getGridSubPalette(7));
  }

  public void draw() {
    for (Tile temp : tile) {
      if(temp!=null) temp.show();
    }

    //Draw lines
    strokeWeight(2);
    stroke(palette[0]);
    line(0, this.size, 4*this.size, this.size);
    line(0, 3*this.size, 4*this.size, 3*this.size);
    line(this.size, 0, this.size, 4*this.size);
    line(3*this.size, 0, 3*this.size, 4*this.size);
  }
}