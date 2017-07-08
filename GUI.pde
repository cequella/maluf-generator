
class GUI {
  private PApplet context;
  private PImage  gui;
  private PImage  selectedStyle;
  private PImage  countSelector;
  private PImage  zoeiraOn;
  private int     x;
  private Work    work;
  private boolean released = true;
  private float   angle = (1.4*PI)/float(MAX_COUNT-MIN_COUNT);

  private int currentStyle = 0;
  private int currentCount = 9;
  private boolean currentZoeira = false;
  
  private final float startAngle = -1.25*PI;

  GUI(PApplet context, Work work, int x) {
    this.context = context;
    this.gui = context.loadImage("GUI.png");
    this.selectedStyle = context.loadImage("palette_selected.png");
    this.countSelector = context.loadImage("count_selector.png");
    this.zoeiraOn      = context.loadImage("zoeira_on.png");
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

    //draw counter
    this.context.pushMatrix();
    this.context.translate(this.x +56 +this.countSelector.width/2.0, 219+ this.countSelector.height/2.0);
    this.context.rotate(this.startAngle +this.currentCount*this.angle);
    this.context.image(this.countSelector, -this.countSelector.width/2.0, -this.countSelector.height/2.0); //this.x +56, 219
    this.context.popMatrix();
    
    this.context.popStyle();

    //draw zoeira
    if(this.currentZoeira){
      this.context.image(this.zoeiraOn, this.x+110, 397);
    }

    this.checkEvents();
  }
  private void checkEvents() {
    final int MOUSE_X = this.context.mouseX;
    final int MOUSE_Y = this.context.mouseY;
    
    if (this.context.mousePressed) {
      if (!this.released) return;
      this.released = false;

      //Style chose
      if (MOUSE_Y>119 && MOUSE_Y<153) {
        if (MOUSE_X>this.x+85 && MOUSE_X<this.x+129) {
          currentStyle = 0;
          this.work.changePalette(Palette.gen(this.context, Palette.DESTIJL));
          if (VERBOSE) println("Style: DeStijl");
        }
        if (MOUSE_X>this.x+131 && MOUSE_X<this.x+175) {
          currentStyle = 1;
          this.work.changePalette(Palette.gen(this.context, Palette.BICHROMATIC));
          if (VERBOSE) println("Style: Bichromatic");
        }
        if (MOUSE_X>this.x+178 && MOUSE_X<this.x+222) {
          currentStyle = 2;
          this.work.changePalette(Palette.gen(this.context, Palette.COLD));
          if (VERBOSE) println("Style: Cold");
        }
      }

      //Count chose
      if (MOUSE_Y>219 && MOUSE_Y<287) {
        this.released = true;
        
        if(MOUSE_X>this.x+57 && MOUSE_X<this.x+124){
          final float dx = (this.x +56 +this.countSelector.width/2.0) - MOUSE_X;
          final float dy = (219+ this.countSelector.height/2.0) - MOUSE_Y;
          
          float pa = Pseudoangle.get(dx, dy);
          pa = (pa+1.0)%8.0;
          pa = min(max(pa, 0), 6); // restrict to [0, 6]
          
          int temp = round( map(pa, 0, 6, MIN_COUNT, MAX_COUNT) );
          if (temp != this.currentCount){
            this.currentCount = temp;
            this.work.setCount(this.currentCount);
            if (VERBOSE) println("Current count: ", this.currentCount);
          }
        }
      }
      
      //Zoeira chose
      if (MOUSE_Y>400 && MOUSE_Y<430) {
        if(MOUSE_X>this.x+126 && MOUSE_X<this.x+195){
          this.currentZoeira = !this.currentZoeira;
          if (VERBOSE) println("Zoeira mode");
        }
      }
    } else {
      this.released = true;
    }
  }
}