ArrayList<Tower> Towers = new ArrayList<Tower>();
int count = 0;

void DrawGuns() {
  for(int i = 0; i < count; i++ ) {
      Tower t = Towers.get(i);
      image(t.getBuoy(),t.getXcor(),t.getYcor());
      image(t.getGun(), t.getXcor() + 17, t.getYcor());
  }
}
  
void addTower(PImage p, PImage g, float x, float y) {
  count ++;
  Tower t = new Tower();
  t.setYcor(y);
  t.setXcor(x);
  t.setGun(g);
  t.setBuoy(p);
  Towers.add(t);
}

void remove(Tower t) {
  Towers.remove(t);
  count --;
}

