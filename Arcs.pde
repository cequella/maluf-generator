public class Arcs extends Tile {
  private float   spacement;
  //private color[] palette;
  private float[] arcPreset = new float[4];
  
  public Arcs(float startX, float startY, 
              float size, int orientation, color[] palette){
    super(startX, startY, size, orientation, palette);
    this.spacement  = 2*getSize()/(COUNT+1);
    
    // Arc Preset
    if( isOrientedTo(Tile.NW) ){
      arcPreset[0]=0; 
      arcPreset[1]=0; 
      arcPreset[2]=0; 
      arcPreset[3]=HALF_PI;
    } else if( isOrientedTo(Tile.NE) ){
      arcPreset[0]=getSize(); 
      arcPreset[1]=0; 
      arcPreset[2]=HALF_PI; 
      arcPreset[3]=PI;
    } else if( isOrientedTo(Tile.SW) ){
      arcPreset[0]=0; 
      arcPreset[1]=getSize(); 
      arcPreset[2]=PI+HALF_PI; 
      arcPreset[3]=TWO_PI;
    } else { // DEFAULT or 'SE'
      arcPreset[0]=getSize(); 
      arcPreset[1]=getSize(); 
      arcPreset[2]=PI; 
      arcPreset[3]=PI+HALF_PI;
    }

  }
  
  public void show() {
    // Paint Background
    final color[] palette = getPalette();
    
    fill(palette[0]);
    noStroke();
    rect(getX(), getY(), getSize(), getSize());
    
    // Draw Arcs
    for(int it=0; it<=COUNT+1; it++){
      if(it <= COUNT){
        fill(palette[1]);
        arc(getX()+arcPreset[0],
            getY()+arcPreset[1], 
            getSize()*2 - it*spacement,
            getSize()*2 - it*spacement,
            arcPreset[2],
            arcPreset[3]);
            
        float aux = it+((it+1)*0.1);
        fill(palette[0]);
        arc(getX()+arcPreset[0],
            getY()+arcPreset[1], 
            getSize()*2 - aux*spacement,
            getSize()*2 - aux*spacement, 
            arcPreset[2],
            arcPreset[3]);
      } else {
        final float size = 2*getSize()/COUNT;
        fill(Palette.WHITE);
        arc(getX()+arcPreset[0],
            getY()+arcPreset[1], 
            size,
            size,
            arcPreset[2],
            arcPreset[3]);
      }
    }
    
  }
}