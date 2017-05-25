public class Grid extends Tile {
  private final boolean direction;

  private final float piece;
  private final float pPiece;
  private final color palette[];

  public Grid(float startX, float startY, float size, boolean leftRight, color[] palette) {
    super(startX, startY, size);

    this.direction = leftRight;
    this.piece = getSize()/COUNT;
    this.pPiece = piece/COUNT;
    this.palette = palette;
  }

  private void drawCollumn(float x, float y, int count, color[] palette) {
    final float factor = count*this.pPiece;

    for (int k=0, j=count; k<COUNT-count; k++, j++) {
      final float top    = y+(k+1)*this.piece;
      final float bottom = top - j*this.pPiece;

      // Draw First-Line
      fill(palette[0]);
      rect(x, top-this.piece, this.piece-factor, this.piece-j*this.pPiece);
      fill(palette[1]);
      rect(x+this.piece-factor, top-this.piece, factor, this.piece-j*this.pPiece);

      // Draw Second-Line
      fill(palette[2]);
      rect(x, bottom, this.piece-factor, j*this.pPiece);
      fill(palette[3]);
      rect(x+this.piece-factor, bottom, factor, j*this.pPiece);
    }
  }
  private void drawLine(float x, float y, int count, color[] palette) {
    final float factor = count*this.pPiece;

    for (int k=0, j=count; k<COUNT-count; k++, j++) {
      final float left  = x+(k+1)*this.piece;
      final float right = left+this.piece-j*this.pPiece;

      // Draw First-Line
      fill(palette[0]);
      rect(left, y-this.piece, this.piece-j*this.pPiece, this.piece-factor);
      fill(palette[1]);
      rect(left, y-factor, this.piece-j*this.pPiece, factor);

      // Draw Second-Line
      fill(palette[2]);
      rect(right, y-this.piece, j*this.pPiece, this.piece-factor);
      fill(palette[3]);
      rect(right, y-this.piece+this.piece-factor, j*this.pPiece, factor);
    }
  }
  private void verticalLines(color[] palette) {
    for (int i=0, j=1; i<COUNT-1; i++, j++) {
      final float cLEFT = getX()+i*this.piece;
      final float cTOP  = getY()+j*this.piece;

      drawLine(cLEFT, cTOP, j, palette);
    }
  }
  private void horizontalLines(color[] palette) {
    for (int i=0, j=1; i<COUNT-1; i++, j++) {
      final float cLEFT = getX()+i*this.piece;
      final float cTOP  = getY()+j*this.piece;

      drawCollumn(cLEFT, cTOP, j, palette);
    }
  }
  public void show() {
    noStroke();
    fill(this.palette[0]);
    rect(getX(), getY(), getSize(), getSize());

    verticalLines(this.palette);
    horizontalLines(this.palette);
  }
}