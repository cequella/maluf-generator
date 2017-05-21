
public final static class Palette {

  private final static color WHITE  = #F4F4F4;
  private final static color YELLOW = #FFDB07;
  private final static color RED    = #EC252A;
  private final static color BLUE   = #292F83;
  private final static color BLACK  = #171719;
  
  public static color[] gen(PApplet context){
    color temp[] = new color[5];
    temp[0] = WHITE;
    temp[1] = YELLOW;
    temp[2] = RED;
    temp[3] = BLUE;
    temp[4] = BLACK;
    
    color out[] = new color[12];
    for(int i=0; i<4; i++){
      int c = int(context.random(0, 5));
      
      out[i*3] = temp[c];
      out[i*3+1] = temp[(c+1)%5];
      out[i*3+2] = temp[(c+2)%5];
    }
    
    return out;
  }
}