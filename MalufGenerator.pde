final int COUNT = 9;

public void settings() {
  size(900, 900);
}

public void setup() {
  Arcs arc[] = new Arcs[4];
  arc[0] = new Arcs(#ff0000, #ff00ff, 0, 0, 300, "SE");
  arc[1] = new Arcs(#ff0000, #ff00ff, 600, 0, 300, "SW");
  arc[2] = new Arcs(#ff0000, #ff00ff, 0, 600, 300, "NE");
  arc[3] = new Arcs(#ff0000, #ff00ff, 600, 600, 300, "NW");
  
  for(Arcs temp : arc){
    temp.show();
  }
}