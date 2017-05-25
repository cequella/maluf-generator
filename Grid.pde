public class Grid extends Tile {
  private final boolean direction;

  private final float piece;
  private final float pPiece;

  public Grid(float startX, float startY, float size, boolean leftRight) {
    super(startX, startY, size);

    this.direction = leftRight;
    this.piece = getSize()/COUNT;
    this.pPiece = piece/COUNT;
  }

  private void drawCollumn(float x, float y, int count, color primary, color secundary){
    for (int k=0; k<count; k++) {
        // Draw First-Line
        fill(primary);
        rect(x, y+k*this.piece, this.pPiece, this.piece);
      }
  }
  private void verticalLines(color primary, color secundary) {
    for (int i=0, j=1; i<COUNT-1; i++, j++) {
      final float cLEFT = getX()+i*this.piece;
      final float cTOP  = getY()+j*this.piece;

      drawCollumn(cLEFT, cTOP, COUNT-j, primary, secundary);
    }
  }
  private void drawSquares() {
    for (int i=0; i<COUNT; i++) {
      final float cLEFT = getX()+i*this.piece;
      final float cTOP  = getY()+i*this.piece;

      // Draw Square
      fill(Palette.WHITE);
      if (direction) {
        rect(cLEFT, cTOP, this.piece, this.piece);
      } else {
        rect(getX()+(COUNT-i-1)*this.piece, getY()+i*this.piece, this.piece, this.piece);
      }
    }
  }
  public void show() {
    /*noStroke();
    fill(Palette.WHITE);
    rect(getX(), getY(), getSize(), getSize());*/
    verticalLines(Palette.YELLOW, Palette.RED);
    drawSquares();
  }
}