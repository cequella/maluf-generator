final int COUNT = 9;
int spacement;

public void settings(){
  size(500, 500);
}

public void setup() {
  spacement = width/COUNT;
}

public void drawLine(int startX, int startY,
                     int size, float prop,
                     color color1, color color2) {
  noStroke();
  for(int it=0; it<COUNT; it++){
    float aux = spacement*0.9;
    
    fill(color1);
    rect(it*spacement, 0, aux, aux);
    fill(color2);
    rect(it*spacement+aux, 0, spacement-aux, aux);
    
    if(it==COUNT-1){
      float temp = (it*spacement+aux)+(spacement-aux);
      
      fill(color1);
      rect(temp, 0, width-temp, aux);
    }
  }
}

public void draw(){
  background(#F4F4F4);
  
  final color RED = #EC252A;
  final color BLUE = #292F83;
  
  drawLine(0,0, width, 0.9, RED, BLUE);
}