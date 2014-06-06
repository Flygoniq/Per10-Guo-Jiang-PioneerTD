ArrayList<PImage> Towers = new ArrayList<PImage>();
ArrayList<PImage> Guns = new ArrayList<PImage>();
ArrayList<Float> Xcor = new ArrayList<Float>();
ArrayList<Float> Ycor = new ArrayList<Float>();
int count = 0;

void DrawGuns() {
  for(int i = 0; i < count; i++ ) {
      image(Towers.get(i),ghostx,ghosty);
      image(Guns.get(i), ghostx + 17, ghosty);
  }
}
  
void addGun(PImage p, PImage g, float x, float y) {
  count ++;
  Towers.add(p);
  Guns.add(g);
  Xcor.add(x);
  Ycor.add(y);
}

void remove(PImage p) {
  int i = Towers.indexOf(p);
  Towers.remove(p);
  Guns.remove(g);
  Xcor.remove(i);
  Ycor.remove(i);
  count --;
}

