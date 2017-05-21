public class Grid extends Tile {
  private boolean direction;

  public Grid(float startX, float startY, float size, boolean leftRight) {
    super(startX, startY, size);
    this.direction = leftRight;
  }

  public void show() {
    final float aux = getSize()/COUNT;

    if (direction) {
      for (int i=0; i<COUNT; i++) {
        noStroke();
        fill(Palette.WHITE);
        rect(getX()+i*aux, getY()+i*aux, aux, aux);
      }
    } else {
      for (int i=0; i<COUNT; i++) {
        noStroke();
        fill(Palette.WHITE);
        rect(getX()+(COUNT-i-1)*aux, getY()+i*aux, aux, aux);
      }
    }
  }
}