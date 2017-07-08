
class GUI {
  private PApplet context;
  private PImage  gui;
  private PImage  selectedStyle;
  private PImage  countSelector;
  private int     x;
  private Work    work;
  private boolean released = true;
  private float angle = (PI+HALF_PI)/float(MAX_COUNT-MIN_COUNT);

  private int currentStyle = 0;
  private int currentCount = 0;
  
  private final float startAngle = -1.5*HALF_PI;

  GUI(PApplet context, Work work, int x) {
    this.context = context;
    this.gui = context.loadImage("GUI.png");
    this.selectedStyle = context.loadImage("palette_selected.png");
    this.countSelector = context.loadImage("count_selector.png");
    this.x = x;
    this.work = work;
  }
  public void draw() {
    this.context.pushStyle();

    //draw panel
    this.context.fill(#afafaf);
    this.context.noStroke();
    this.context.rect(this.x, 0, GUI_SIZE, height);

    //draw styler
    this.context.image(this.gui, this.x, 0);
    this.context.image(this.selectedStyle, this.x +85 +this.currentStyle*45.5, 119);

    //draw counter 56 219
    this.context.pushMatrix();
    this.context.translate(this.x +56 +this.countSelector.width/2.0, 219+ this.countSelector.height/2.0);
    this.context.rotate(this.startAngle +this.currentCount*this.angle);
    this.context.image(this.countSelector, -this.countSelector.width/2.0, -this.countSelector.height/2.0); //this.x +56, 219
    this.context.popMatrix();

    this.context.popStyle();

    this.checkEvents();
  }
  private void checkEvents() {
    if (this.context.mousePressed) {
      if (!this.released) return;
      this.released = false;

      //Style chose
      if (this.context.mouseY>119 && this.context.mouseY<153) {
        if (this.context.mouseX>this.x+85 && this.context.mouseX<this.x+129) {
          currentStyle = 0;
          this.work.changePalette(Palette.gen(this.context, Palette.DESTIJL));
          if (VERBOSE) println("Style: DeStijl");
        }
        if (this.context.mouseX>this.x+131 && this.context.mouseX<this.x+175) {
          currentStyle = 1;
          this.work.changePalette(Palette.gen(this.context, Palette.BICHROMATIC));
          if (VERBOSE) println("Style: Bichromatic");
        }
        if (this.context.mouseX>this.x+178 && this.context.mouseX<this.x+222) {
          currentStyle = 2;
          this.work.changePalette(Palette.gen(this.context, Palette.COLD));
          if (VERBOSE) println("Style: Cold");
        }
      }

      //Count chose
      if (this.context.mouseY>219 && this.context.mouseY<287) {
      }
    } else {
      this.released = true;
    }
  }
}