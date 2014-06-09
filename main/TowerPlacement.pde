ArrayList<Tower> Towers = new ArrayList<Tower>();
int count = 0;

void DrawGuns() {
  Tower base = Towers.get(0);
  image(base.getBuoy(),base.getXcor(),base.getYcor());
  if(mouseY < base.getYcor()){
  base.setAngle(atan(-1*(mouseX -base.getXcor() - 20) / (mouseY-base.getYcor())));
  }
  else {
    base.setAngle((-1*atan((base.getXcor()-mouseX)/(base.getYcor() - mouseY - 20))) + PI);
  }
  image(base.getBuoy(),base.getXcor(),base.getYcor());
  pushMatrix();
  translate(base.getXcor(),base.getYcor());
  translate(20,8);
  rotate(base.getAngle());
  translate(-20,-8);
  image(base.getGun(), 0,0);
  popMatrix();
  for(int i = 1; i < count; i++ ) {
      Tower t = Towers.get(i);
      image(t.getBuoy(),t.getXcor(),t.getYcor());
      pushMatrix();
      translate(t.getXcor(),t.getYcor());
      translate(20,20);
      rotate(t.getAngle());
      translate(-20,-20);
      image(t.getGun(),0,0);
      popMatrix();
  }
}
  
void addTower(PImage b, PImage g,PImage p, float f, float x, float y,float d) {
  count ++;
  Tower t = new Tower();
  t.setYcor(y);
  t.setXcor(x);
  t.setGun(g);
  t.setBuoy(b);
  t.setProjectile(p);
  t.setFiringspeed(f);
  t.setDamage(d);
  Towers.add(t);
}

void removeTower(Tower t) {
  Towers.remove(t);
  count --;
}

void fire() {
  for (int i = 1; i < count; i++) {
    Tower t = Towers.get(i);
    if (tick % t.getFiringspeed() == 0){
    addProjectile(t.getProjectile(),0,-10,t.getXcor(), t.getYcor() - 10,t.getAngle(),t.getDamage());
    }
  }
  Projectilefire();
}

void update() {
  //println("part5");
  for (int i = 1; i < count; i++) {
    Tower t = Towers.get(i);
    t.attack();
    //println("finished");
  }
  for (int n = 0; n < pcount; n++) {
    //print("part6");
    Projectile p = projectiles.get(n);
    p.attack();
  }
}
