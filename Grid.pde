public class Grid extends Tile {
  private final String direction;

  private final float piece;
  private final float pPiece;
  private final color palette[];
  private final color background;

  public Grid(float startX, float startY, float size, String direction, color background, color[] palette) {
    super(startX, startY, size);

    this.direction = direction;
    this.piece = getSize()/COUNT;
    this.pPiece = piece/COUNT;
    this.palette = palette;
    this.background = background;
  }

  private void drawCollumns() {
    color[] aux = {palette[4], palette[5], palette[6], palette[7]};

    if (direction.equals("NW")) {
      aux = new color[]{palette[6], palette[7], palette[4], palette[5]};
    } else if (direction.equals("NE")) {
      aux = new color[]{palette[4], palette[5], palette[6], palette[7]};
    } else {
      aux = new color[]{palette[4], palette[5], palette[6], palette[7]};
    }

    for (int i=0; i<COUNT; i++) {
      final float dy = float(i+1)/(COUNT+1);

      for (int j=i+1; j<COUNT; j++) {
        final float dx = float(j+1)/(COUNT+1);
        final float y = (direction.equals("NE") || direction.equals("SW"))? getY()+getSize()-(j+1)*this.piece : getY()+j*this.piece;

        drawSquare(getX()+i*this.piece, y, dy, dx, aux);
      }
    }
  }
  private void drawLines() {
    color[] aux;

    if (direction.equals("NW")) {
      aux = new color[]{palette[3], palette[0], palette[1], palette[2]};
    } else {
      aux = new color[]{palette[0], palette[1], palette[2], palette[3]};
    }

    for (int i=0; i<COUNT; i++) {
      final float dy = float(i+1)/(COUNT+1);

      for (int j=i+1; j<COUNT; j++) {
        final float dx = float(j+1)/(COUNT+1);
        final float y = (direction.equals("NE") || direction.equals("SW"))? getY()+getSize()-(i+1)*this.piece : getY()+i*this.piece;

        drawSquare(getX()+j*this.piece, y, dx, dy, aux);
      }
    }
  }
  private void drawSquare(float x, float y, float dX, float dY, color[] c) {
    float w1 = 1.0-dX;
    float w2 = dX;
    float h1 = (direction.equals("NE"))? dY : 1.0-dY;
    float h2 = 1.0-h1;

    fill(c[0]);
    rect(x, y, w1*this.piece, h1*this.piece);
    fill(c[1]);
    rect(x+w1*this.piece, y, w2*this.piece, h1*this.piece);
    fill(c[2]);
    rect(x, y+h1*this.piece, w1*this.piece, h2*this.piece);
    fill(c[3]);
    rect(x+w1*this.piece, y+h1*this.piece, w2*this.piece, h2*this.piece);
  }
  public void show() {
    noStroke();
    fill(this.background);
    rect(getX(), getY(), getSize(), getSize());

    drawLines();
    drawCollumns();
  }
}