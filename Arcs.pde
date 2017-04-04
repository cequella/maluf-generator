public class Arcs extends Tile {
  private final int ARC_COUNT = 9;
  
  private int   spacement;
  private int[] lineWeight = new int[ARC_COUNT];
  private color background;
  private color primary;
  private int   startX;
  private int   startY;
  private float[] arcPreset = new float[4];
  
  public Arcs(color background, color primary, int startX, int startY, int size, String position){
    super(startX, startY, size);
    this.background = background;
    this.primary = primary;
    this.startX = startX;
    this.startY = startY;
    
    // Calc dimensions: line weight and spacement
    spacement = 2*getSize()/ARC_COUNT;
    for(int it=0; it<ARC_COUNT; it++) {
      lineWeight[it] = int( spacement*0.05*(it+1) );
    }
    
    // Arc Preset
    switch(position) {
    case "NW":
      arcPreset[0]=0;
      arcPreset[1]=0;
      arcPreset[2]=0;
      arcPreset[3]=HALF_PI;
      break;
    case "NE":
      arcPreset[0]=getSize();
      arcPreset[1]=0;
      arcPreset[2]=HALF_PI;
      arcPreset[3]=PI;
      break;
    case "SW":
      arcPreset[0]=0;
      arcPreset[1]=getSize();
      arcPreset[2]=PI+HALF_PI;
      arcPreset[3]=TWO_PI;
      break;
    case "SE":
      arcPreset[0]=getSize();
      arcPreset[1]=getSize();
      arcPreset[2]=PI;
      arcPreset[3]=PI+HALF_PI;
      break;
    }

  }
  
  public void show() {
    // Paint Background
    fill(background);
    rect(0,0, getSize(),getSize());
  
    // Paint Arcs
    stroke(primary);
    for(int it=0; it<=ARC_COUNT; it++){
      if(it!=ARC_COUNT) {
        strokeWeight(lineWeight[it]);
        arc(startX+arcPreset[0],
            startY+arcPreset[1], 
            getSize()*2-spacement*it,
            getSize()*2-spacement*it, 
            arcPreset[2],
            arcPreset[3]);
      } else {
        float aux = 2*getSize()/ARC_COUNT;
      
        noStroke();
        fill(#F4F4F4);
        arc(0,0, aux,aux, 0,HALF_PI);
      }
    }
  
    // SW Arc
    //arc(0,getSize(), 2*getSize(),2*getSize(), PI+HALF_PI, TWO_PI);
  
    // NE Arc
    //arc(getSize(),0, 2*getSize(),2*getSize(), HALF_PI, PI);
  
    // SE Arc
    //arc(getSize(),getSize(), 2*getSize(),2*getSize(), PI, PI+HALF_PI);
  }
}