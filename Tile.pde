public class Tile {
  // Orientation
  public final static int NW = 0;
  public final static int NE = 1;
  public final static int SW = 2;
  public final static int SE = 3;
  
  private float   startX;
  private float   startY;
  private float   size;
  private int     orientation;
  private color[] palette;
  private int     count;

  public Tile(float startX, float startY, 
            float size, int count, int orientation, color[]palette) {
    this.startX=startX;
    this.startY=startY;
    this.size=size;
    this.orientation = orientation;
    this.palette = palette;
    this.count = count;
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
  public int getCount(){
    return this.count;
  }
  
  // Setters
  public void setPalette(color[] palette){
    this.palette = palette;
  }
  public void setCount(int count){
    this.count = count;
  }
  
  // Others
  public void show(){}
  public boolean isOrientedTo(int check){
    return (this.orientation == check);
  }
  public boolean mouseOver(PApplet context){
    if(context.mouseX < getX()) return false;
    if(context.mouseX > getX()+getSize()) return false;
    if(context.mouseY < getY()) return false;
    if(context.mouseX > getY()+getSize()) return false;
    return true;
  }
}