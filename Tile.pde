public class Tile {
  private float startX;
  private float startY;
  private float size;

  public Tile(float startX, float startY, 
    float size) {
    this.startX=startX;
    this.startY=startY;
    this.size=size;
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
  
  // Others
  public void show(){}
}