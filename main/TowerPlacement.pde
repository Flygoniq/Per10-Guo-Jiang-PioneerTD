ArrayList<Tower> Towers = new ArrayList<Tower>();
int count = 0;

void DrawGuns() {
  Tower base = Towers.get(0);
  image(base.getBuoy(),base.getXcor(),base.getYcor());
  base.setAngle(atan(-(mouseX -base.getXcor() - 20) / (mouseY-base.getYcor())));
  image(base.getBuoy(),base.getXcor(),base.getYcor());
  pushMatrix();
  translate(base.getXcor(),base.getYcor());
  translate(20,8);
  rotate(base.getAngle());
  translate(-20,-8);
  image(base.getGun(), 0,0);
  translate(20,8);
  rotate(-1*base.getAngle());
  translate(-20,-8);
  translate(-1*base.getXcor(),-1*base.getYcor());
  for(int i = 1; i < count; i++ ) {
      Tower t = Towers.get(i);
      image(t.getBuoy(),t.getXcor(),t.getYcor());
      image(t.getGun(),t.getXcor(),t.getYcor());
  }
  popMatrix();
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

void update() {
  Tower t = Towers.get(0);
  t.setAngle(atan(abs(mouseX -t.getXcor() - 20) / abs(mouseY-t.getYcor())));
}
