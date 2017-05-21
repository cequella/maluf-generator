/* Olhar isso!!!
  class Arc {
  private int count = 9;
  private int dCount = 2*count;
  private int dSize;

  public Arc(int count, int size) {
    this.count = count;
    this.dCount = 2*count;
    this.dSize = (size*2)/count;
  }

  public void draw() {
    strokeCap(SQUARE);
    for (int i=1; i<=count; i++) {
      strokeWeight(dSize/dCount*i);
      if (i!=1) {
        noFill();
      } else {
        fill(255);
      }
      arc(0, 0, dSize*i, dSize*i, 0, HALF_PI);
    }
  }
};
  */

public class Arcs extends Tile {
  final int ARC_COUNT = 9;
  
  private int     spacement;
  private int[]   lineWeight = new int[ARC_COUNT];
  private color   background;
  private color   primary;
  private int     startX;
  private int     startY;
  private float[] arcPreset = new float[4];
  
  public Arcs(color background, color primary, 
              int startX, int startY, 
              int size, String position){
    super(startX, startY, size);
    this.background = background;
    this.primary    = primary;
    this.startX     = startX;
    this.startY     = startY;
    this.spacement  = 2*getSize()/(ARC_COUNT+1);
    
    // Calc dimensions: line weight and spacement
    for(int it=0; it<ARC_COUNT; it++) {
      lineWeight[it] = int( spacement*0.05*(it+1) );
    }
    
    // Arc Preset
    if( position.equals("NW") ){
      arcPreset[0]=0; arcPreset[1]=0; arcPreset[2]=0; arcPreset[3]=HALF_PI;
    } else if( position.equals("NE") ){
      arcPreset[0]=getSize(); arcPreset[1]=0; arcPreset[2]=HALF_PI; arcPreset[3]=PI;
    } else if( position.equals("SW") ){
      arcPreset[0]=0; arcPreset[1]=getSize(); arcPreset[2]=PI+HALF_PI; arcPreset[3]=TWO_PI;
    } else if( position.equals("SE") ){
      arcPreset[0]=getSize(); arcPreset[1]=getSize(); arcPreset[2]=PI; arcPreset[3]=PI+HALF_PI;
    }

  }
  
  public void show() {
    // Paint Background
    fill(background);
    rect(startX, startY, getSize(), getSize());
    noStroke();
    
    for(int it=0; it<=ARC_COUNT+1; it++){
      if(it <= ARC_COUNT){
        fill(primary);
        arc(startX+arcPreset[0],
            startY+arcPreset[1], 
            getSize()*2 - it*spacement,
            getSize()*2 - it*spacement,
            arcPreset[2],
            arcPreset[3]);
            
        float aux = it+((it+1)*0.1);
        fill(background);
        arc(startX+arcPreset[0],
            startY+arcPreset[1], 
            getSize()*2 - aux*spacement,
            getSize()*2 - aux*spacement, 
            arcPreset[2],
            arcPreset[3]);
      } else {
        fill(#F4F4F4);
        arc(startX+arcPreset[0],
            startY+arcPreset[1], 
            1.1*spacement,
            1.1*spacement,
            arcPreset[2],
            arcPreset[3]);
      }
    }
  }
}