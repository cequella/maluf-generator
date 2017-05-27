
public final static class Palette {

  private final static color WHITE  = #F4F4F4;
  private final static color YELLOW = #FFD300;
  private final static color RED    = #EF343E;
  private final static color BLUE   = #011C9D;
  private final static color BLACK  = #171719;

  public static color[] gen(PApplet context) {
    color temp[] = new color[5];
    temp[0] = WHITE;
    temp[1] = YELLOW;
    temp[2] = RED;
    temp[3] = BLUE;
    temp[4] = BLACK;

    // Shuffle temp
    for (int i=0; i<temp.length*2; i++) {
      final int r1 = int(context.random(1, temp.length));
      final int r2 = int(context.random(1, temp.length));
      
      final color aux = temp[r1];
      temp[r1] = temp[r2];
      temp[r2] = aux;
    }

    color[] out = new color[14];
    out[0] = temp[0];
    out[1] = temp[1];
    
    out[2]  = temp[2]; out[3] = temp[0]; out[4] = temp[4];
    out[5]  = temp[3]; out[6] = temp[2]; out[7] = temp[0];
    out[8]  = temp[4]; out[9] = temp[3]; out[10] = temp[3];
    out[11] = temp[0]; out[12] = temp[2]; out[13] = temp[4];

    return out;
  }
}