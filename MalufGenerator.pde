Arcs[] arc;

public void settings(){
  size(500, 500);
}

public void setup() {
  arc = new Arcs[4];
  arc[0] = new Arcs(#171719, #EC252A, 0, 0, 250, "SE");
  arc[1] = new Arcs(#171719, #EC252A, 0, 250, 250, "SE");
  arc[2] = new Arcs(#171719, #EC252A, 250, 0, 250, "SE");
  arc[3] = new Arcs(#171719, #EC252A, 250, 250, 250, "SE");
}

public void draw(){
  for(int it=0; it<4; it++){
    arc[it].show();
  }
}