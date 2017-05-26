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
    
    for(int i=0; i<COUNT; i++){
      final float dy = (i+1)*1.0/(COUNT+1);
      
      for(int j=i+1; j<COUNT; j++){
        final float dx = (j+1)*1.0/(COUNT+1);
        final float y = (direction.equals("NW")||direction.equals("SE"))? getY()+j*this.piece : getY()+getSize()-j*this.piece-this.piece;
        
        drawSquare(getX()+i*this.piece, y, dy, dx, aux);
      }
    }
  }
  private void drawLines() {
    color[] aux = {palette[0], palette[1], palette[2], palette[3]};
    
    for(int i=0; i<COUNT; i++){
      final float dy = (i+1)*1.0/(COUNT+1);
      
      for(int j=i+1; j<COUNT; j++){
        final float dx = (j+1)*1.0/(COUNT+1);
        final float y = (direction.equals("NW")||direction.equals("SE"))? getY()+i*this.piece : getY()+getSize()-(i+1)*this.piece;
        
        drawSquare(getX()+j*this.piece, y, dx, dy, aux);
      }
    }
  }
  private void drawSquare(float x, float y, float dX, float dY, color[] c) {
    fill(c[0]);
    rect(x, y, dX*this.piece, dY*this.piece);
    fill(c[1]);
    rect(x+dX*this.piece, y, (1.0-dX)*this.piece, dY*this.piece);
    fill(c[2]);
    rect(x, y+dY*this.piece, dX*this.piece, (1.0-dY)*this.piece);
    fill(c[3]);
    rect(x+dX*this.piece, y+dY*this.piece, (1.0-dX)*this.piece, (1.0-dY)*this.piece);
  }
  public void show() {
    noStroke();
    fill(this.background);
    rect(getX(), getY(), getSize(), getSize());

    drawLines();
    drawCollumns();
  }
}