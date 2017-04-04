final int ARC_COUNT = 9;

int[] spacement  = new int[ARC_COUNT*2];
int[] lineWeight = new int[ARC_COUNT*2];

public void settings(){
  size(500, 500);
}

public void setup() {
 final float temp = 2*width/ARC_COUNT;
 for(int it=0; it<ARC_COUNT; it++) {
    spacement[it] = int( it*temp );
    lineWeight[it] = int( temp*0.05*(it+1) );
  } 
}

public void drawArcs(color background, color primary){
  // Paint Background
  fill(background);
  rect(0,0, width,width);
  
  // Paint Arcs
  
  // NW Arc
  stroke(primary);
  for(int it=0; it<=ARC_COUNT; it++){
    if(it!=ARC_COUNT) {
      strokeWeight(lineWeight[it]);
      arc(0,0, width*2-spacement[it],width*2-spacement[it], 0,HALF_PI);
    } else {
      float aux = 2*width/ARC_COUNT;
      
      noStroke();
      fill(#F4F4F4);
      arc(0,0, aux,aux, 0,HALF_PI);
    }
  }
  
  // SW Arc
  //arc(0,250, 500,500, PI+HALF_PI, TWO_PI);
  
  // NE Arc
  //arc(250,0, 500,500, HALF_PI, PI);
  
  // SE Arc
  //arc(250,250, 500,500, PI, PI+HALF_PI);
}

public void draw(){
  drawArcs(#171719, #EC252A);
}