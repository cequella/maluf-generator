Arcs arc;

public void settings(){
  size(500, 500);
}

public void setup() {
  arc = new Arcs(#171719, #EC252A, 0, 0, width, "SE");
}

public void draw(){
  arc.show2();
}