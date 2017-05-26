public class Grid extends Tile {
  private final boolean direction;

  private final float piece;
  private final float pPiece;
  private final color palette[];
  private final color background;

  public Grid(float startX, float startY, float size, boolean leftRight, color background, color[] palette) {
    super(startX, startY, size);

    this.direction = leftRight;
    this.piece = getSize()/COUNT;
    this.pPiece = piece/COUNT;
    this.palette = palette;
    this.background = background;
  }

  private void drawCollumn(float x, float y, int count, color[] palette) {
    final float factor = count*this.pPiece;

    for (int k=0, j=count; k<COUNT-count; k++, j++) {
      final float top    = y+(k+1)*this.piece;
      final float bottom = top - j*this.pPiece;

      fill(palette[7]);
      rect(x, top-this.piece, this.piece-factor, this.piece-j*this.pPiece);
      fill(palette[6]);
      rect(x+this.piece-factor, top-this.piece, factor, this.piece-j*this.pPiece);
      fill(palette[4]);
      rect(x, bottom, this.piece-factor, j*this.pPiece);
      fill(palette[5]);
      rect(x+this.piece-factor, bottom, factor, j*this.pPiece);
    }
  }
  private void drawLine(float x, float y, int count, color[] palette) {
    final float factor = count*this.pPiece;

    for (int k=0, j=count; k<COUNT-count; k++, j++) {
      final float left  = x+(k+1)*this.piece;
      final float right = left+this.piece-j*this.pPiece;

      fill(palette[0]);
      rect(left, y-this.piece, this.piece-j*this.pPiece, this.piece-factor);
      fill(palette[2]);
      rect(left, y-factor, this.piece-j*this.pPiece, factor);
      fill(palette[1]);
      rect(right, y-this.piece, j*this.pPiece, this.piece-factor);
      fill(palette[3]);
      rect(right, y-factor, j*this.pPiece, factor);
    }
  }
  public void show() {
    noStroke();
    fill(this.background);
    rect(getX(), getY(), getSize(), getSize());

    for (int i=0; i<COUNT-1; i++) {
      final float cLEFT = getX()+i*this.piece;
      final float cTOP  = getY()+i*this.piece+this.piece;

      drawLine(cLEFT, cTOP, i+1, palette);
      //drawCollumn(cLEFT, cTOP, i+1, palette);
    }
  }
}