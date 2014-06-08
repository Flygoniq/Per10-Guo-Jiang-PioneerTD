ArrayList<Tower> Towers = new ArrayList<Tower>();
int count = 0;

void DrawGuns() {
  for(int i = 0; i < count; i++ ) {
      Tower t = Towers.get(i);
      image(t.getBuoy(),t.getXcor(),t.getYcor());
      image(t.getGun(), t.getXcor(), t.getYcor());
  }
}
  
void addTower(PImage b, PImage g,PImage p, float f, float x, float y) {
  count ++;
  Tower t = new Tower();
  t.setYcor(y);
  t.setXcor(x);
  t.setGun(g);
  t.setBuoy(b);
  t.setProjectile(p);
  t.setFiringspeed(f);
  Towers.add(t);
}

void removeTower(Tower t) {
  Towers.remove(t);
  count --;
}

void fire() {
  for (int i = 0; i < count; i++) {
    Tower t = Towers.get(i);
    if (tick % t.getFiringspeed() == 0){
    addProjectile(t.getProjectile(),0,-10,t.getXcor(), t.getYcor() - 10);
    }
  }
  Projectilefire();
}
