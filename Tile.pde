public class Tile {
  private float   startX;
  private float   startY;
  private float   size;
  private int     orientation;
  private color[] palette;
  
  public final static int NW = 0;
  public final static int NE = 1;
  public final static int SW = 2;
  public final static int SE = 3;

  public Tile(float startX, float startY, 
    float size, int orientation, color[]palette) {
    this.startX=startX;
    this.startY=startY;
    this.size=size;
    this.orientation = orientation;
    this.palette = palette;
  }

  // Getters
  public float getX() {
    return this.startX;
  }
  public float getY() {
    return this.startY;
  }
  public float getSize() {
    return this.size;
  }
  public color[] getPalette(){
    return this.palette;
  }
  
  // Setters
  public void setPalette(color[] palette){
    this.palette = palette;
  }
  
  // Others
  public void show(){}
  public boolean isOrientedTo(int check){
    return (this.orientation == check);
  }
}