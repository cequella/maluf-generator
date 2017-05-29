
public final static class Palette {
  // Palettes
  private final static color WHITE    = #F4F4F4;
  private final static color YELLOW   = #FFD300;
  private final static color RED      = #EF343E;
  private final static color BLUE     = #011C9D;
  private final static color D_GRAY   = #171719;
  private final static color ORANGE   = #DF440E;
  private final static color COFFEE   = #462F1D;
  private final static color D_RED    = #C0210E;
  private final static color WINE     = #C0210E;
  private final static color LAVANDER = #7C77AD;
  private final static color NAVY     = #303B68;
  private final static color PURPLE   = #9D568E;
  private final static color GOLD     = #DE7F15;
  private final static color GREEN    = #D4F09B;
  private final static color BLACK    = #000000;
  private final static color L_YELLOW = #FFF9DE;
  
  public final static color[] DESTIJL    = {YELLOW, RED, BLUE, D_GRAY};
  public final static color[] COLD       = {ORANGE, COFFEE, D_RED, WINE, LAVANDER, NAVY, PURPLE, GOLD, GREEN};
  public final static color[] BICROMATIC = {WHITE, BLACK, D_GRAY, L_YELLOW, RED};

  private static color[] gen(PApplet context, color[] style) {
    color[] out = new color[14];
    color[] base = new color[style.length];
    
    // Create an copy to modify
    arrayCopy(style, base);

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
    
    // Verbosity
    if (VERBOSE) {
      print("Palette: ");
      for (color c : out) print(hex(c), "");
      println();
    }

    return out;
  }
}