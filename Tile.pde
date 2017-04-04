public class Tile {
  private int startX;
  private int startY;
  private int size;
  
  public Tile(int startX, int startY,
  int size){
    this.startX=startX;
    this.startY=startY;
    this.size=size;
  }
  
  // getters
  public int getX(){
    return this.startX;
  }
  public int getY(){
    return this.startY;
  }
  public int getSize(){
    return this.size;
  }
  
  // overridable
  void generate() {
    
  }
  
  // others
  void draw(Palette pallette){
    
  }
  
}