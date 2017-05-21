Work work;

public void settings() {
  size(700, 700);
}

public void keyPressed(){
  if(keyCode == ESC) exit();
}

public void setup() {
  work = new Work(this);
}

public void draw(){
  work.draw();
}