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
    color[] out;

    switch(position) {
    case 0:
      //out = new color[]{palette[2], palette[0], palette[3], palette[0], palette[11], palette[12], palette[0], palette[0]};
      out = getPaletteColors(new int[]{2, 0, 3, 0, 11, 12, 0, 0});
      break;
    case 1:
      //out = new color[]{palette[0], palette[0], palette[6], palette[5], palette[2], palette[0], palette[4], palette[0]};
      out = getPaletteColors(new int[]{0, 0, 6, 5, 2, 0, 4, 0});
      break;
    case 2:
      //out = new color[]{palette[3], palette[2], palette[0], palette[1], palette[12], palette[0], palette[11], palette[1]};
      out = getPaletteColors(new int[]{3, 2, 0, 1, 12, 0, 11, 1});
      break;
    case 3:
      //out = new color[]{palette[0], palette[6], palette[1], palette[5], palette[2], palette[4], palette[1], palette[0]};
      out = getPaletteColors(new int[]{0, 6, 1, 5, 2, 4, 1, 0});
      break;
    case 4:
      //out = new color[]{palette[0], palette[1], palette[9], palette[8], palette[11], palette[1], palette[13], palette[0]};
      out = getPaletteColors(new int[]{0, 1, 9, 8, 11, 1, 13, 0});
      break;
    case 5:
      //out = new color[]{palette[1], palette[5], palette[0], palette[7], palette[1], palette[0], palette[8], palette[10]};
      out = getPaletteColors(new int[]{1, 5, 0, 7, 1, 0, 8, 10});
      break;
    case 6:
      //out = new color[]{palette[0], palette[9], palette[0], palette[8], palette[11], palette[13], palette[0], palette[0]};
      out = getPaletteColors(new int[]{0, 9, 0, 8, 11, 13, 0, 0});
      break;
    case 7:
      //out = new color[]{palette[7], palette[5], palette[0], palette[0], palette[10], palette[0], palette[8], palette[0]};
      out = getPaletteColors(new int[]{7, 5, 0, 0, 10, 0, 8, 0});
      break;
    default:
      out = new color[]{#FF00FF, #FF00FF, #FF00FF, #FF00FF, #FF00FF, #FF00FF}; //ERROR
    }

    return out;
  }
  private color[] getArcSubPalette(int position) {
    color[] out;

    switch(position) {
    case 0:
      //out = new color[]{palette[2], palette[3]};
      out = getPaletteColors(new int[]{2, 3});
      break;
    case 1:
      //out = new color[]{palette[2], palette[4]};
      out = getPaletteColors(new int[]{2, 4});
      break;
    case 2:
      //out = new color[]{palette[11], palette[12]};
      out = getPaletteColors(new int[]{11, 12});
      break;
    case 3:
      //out = new color[]{palette[11], palette[13]};
      out = getPaletteColors(new int[]{11, 13});
      break;
    case 4:
      //out = new color[]{palette[5], palette[6]};
      out = getPaletteColors(new int[]{5, 6});
      break;
    case 5:
      //out = new color[]{palette[5], palette[7]};
      out = getPaletteColors(new int[]{5,7});
      break;
    case 6:
      //out = new color[]{palette[8], palette[9]};
      out = getPaletteColors(new int[]{8,9});
      break;
    case 7:
      //out = new color[]{palette[8], palette[10]};
      out = getPaletteColors(new int[]{8, 10});
      break;
    default:
      out = new color[]{#FF00FF, #FF00FF}; //ERROR
    }

    return out;
  }
  private color[] getPaletteColors(int[] index){
    color[] out = new color[index.length];
    for(int i=0; i<index.length; i++){
      final int id = index[i];
      
      if(id < 0 || id > palette.length){
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
    tile[1]  = new Arcs(getArcSubPalette(0), size, 0, size, "SW");
    tile[2]  = new Arcs(getArcSubPalette(1), 2*size, 0, size, "SE");
    tile[3]  = new Grid(3*size, 0, size, "NE", palette[0], getGridSubPalette(1));
    
    //Second Line
    tile[4]  = new Arcs(getArcSubPalette(2), 0, size, size, "NE");
    tile[5]  = new Grid(size, size, size, "SE", palette[0], getGridSubPalette(2));
    tile[6]  = new Grid(2*size, size, size, "SW", palette[0], getGridSubPalette(3));
    tile[7]  = new Arcs(getArcSubPalette(3), 0, 2*size, size, "SE");
    
    //Third Line
    tile[8]  = new Arcs(getArcSubPalette(4), 3*size, size, size, "NW");
    tile[9]  = new Grid(size, 2*size, size, "NE", palette[0], getGridSubPalette(4));
    tile[10] = new Grid(2*size, 2*size, size, "SE", palette[0], getGridSubPalette(5));
    tile[11] = new Arcs(getArcSubPalette(5), 3*size, 2*size, size, "SW");
    
    //Last Line
    tile[12] = new Arcs(getArcSubPalette(6), size, 3*size, size, "NW");
    tile[13] = new Grid(0, 3*size, size, "SW", palette[0], getGridSubPalette(6));
    tile[14] = new Grid(3*size, 3*size, size, "SE", palette[0], getGridSubPalette(7));
    tile[15] = new Arcs(getArcSubPalette(7), 2*size, 3*size, size, "NE");
  }

  public void draw() {
    /*for (Arcs temp : arc) {
      temp.show();
    }
    for (Grid temp : grid) {
      temp.show();
    }*/
    for(Tile temp : tile){
      temp.show();
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