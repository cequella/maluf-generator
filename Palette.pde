
public final static class Palette {

  private final static color WHITE  = #F4F4F4;
  private final static color YELLOW = #FFD300;
  private final static color RED    = #EF343E;
  private final static color BLUE   = #011C9D;
  private final static color BLACK  = #171719;

  public static color[] gen(PApplet context) {
    color[] out = new color[14];
    color base[] = {YELLOW, RED, BLUE, BLACK};

    // Select an accent color
    final int accent = int(context.random(0, base.length));
    out[0] = WHITE; //Background
    out[1] = base[accent];

    // Remove accent from base
    {
      final int aux = int(context.random(0, base.length));
      base[accent] = base[aux];
      base[aux] = WHITE;
    }

    // Shuffle base
    for (int i=0; i<base.length*2; i++) {
      final int r1 = int(context.random(1, base.length));
      final int r2 = int(context.random(1, base.length));

      final color aux = base[r1];
      base[r1] = base[r2];
      base[r2] = aux;
    }

    // Create Palette
    for (int i=2; i<14; i++) {
      out[i] = base[i%4];
    }

    if (VERBOSE) {
      print("Palette: ");
      for (color c : out) print(hex(c), "");
      println();
    }

    return out;
  }
}