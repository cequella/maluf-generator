public void settings(){
  size(250, 250);
}

public void drawArcs(int size, color background, color primary){
  int[] arcPreset = new int[4];
  
  // Paint Background
  fill(background);
  rect(0,0, size,size);
  
  // Paint Arcs
  smooth();
  noFill();
  
  // NW Arc
  strokeWeight(2);
  stroke(primary);
  arc(0,0, size*2,size*2, 0,HALF_PI);
  
  // SW Arc
  //arc(0,250, 500,500, PI+HALF_PI, TWO_PI);
  
  // NE Arc
  //arc(250,0, 500,500, HALF_PI, PI);
  
  // SE Arc
  //arc(250,250, 500,500, PI, PI+HALF_PI);
}

public void draw(){
  drawArcs(250, #171719, #FF0000);
}