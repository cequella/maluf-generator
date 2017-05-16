final int COUNT = 9;

public void settings() {
  size(900, 900);
}

public void setup() {
  Arcs arc[] = new Arcs[4];
  final int size = min(width,height)/3;
  
  arc[0] = new Arcs(#ff0000, #ff00ff, 0, 0, size, "SE");
  arc[1] = new Arcs(#ff0000, #ff00ff, 2*size, 0, size, "SW");
  arc[2] = new Arcs(#ff0000, #ff00ff, 0, 2*size, size, "NE");
  arc[3] = new Arcs(#ff0000, #ff00ff, 2*size, 2*size, size, "NW");
  
  for(Arcs temp : arc){
    temp.show();
  }
}