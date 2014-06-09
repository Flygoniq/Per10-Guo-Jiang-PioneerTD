ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
int pcount = 0;
int multiplier = 0;

void addProjectile(PImage p, float xp, float yp,float xc, float yc,float a, float damage, Ship target) {
  pcount ++;
  Projectile t = new Projectile(p,xp,yp,xc,yc,a,damage,target);
  projectiles.add(t);
}
void addProjectile(PImage p, float xp, float yp,float xc, float yc,float a, float damage) {
  //println("part4");
  pcount ++;
  Projectile t = new Projectile(p,xp,yp,xc,yc,a,damage);
  projectiles.add(t);
}
void addProjectile(PImage p, float xc, float yc, Ship target) {
  pcount ++;
  Projectile t = new Projectile();
  t.setProjectile(p);
  t.setXcord(xc);
  t.setYcord(yc);
  t.setDestination(target);
  projectiles.add(t);
}

void removeProjectile(Projectile t) {
  projectiles.remove(t);
  pcount --;
}

void Projectilefire() {
  for (int i = 0; i < pcount; i++ ) {
    Projectile p = projectiles.get(i);
    if(p.getYcord() < 0){
      removeProjectile(p);
    }
    else{
    pushMatrix();
    translate(p.getXcord(),p.getYcord());
    translate (20,20);
    rotate(p.getAngle());
    translate(-20,-20);
    image(p.getProjectile(), 0,0);
    popMatrix();
    p.setXcord(p.getXcord() + p.getXprogression());
    p.setYcord(p.getYcord() + p.getYprogression());
    }
  }
}

void Cannonfire() {
  //println("reached this step");
  Tower t = Towers.get(0);
  if (m%30 > 10) {
    //println("part 2");
    //image(t.getProjectile(), t.getYcor(),t.getXcor());
  addProjectile(t.getProjectile(),5*sin(t.getAngle()),-5*cos(t.getAngle()),t.getXcor(), t.getYcor() - 10,atan(-(mouseX -t.getXcor() - 20) / (mouseY-t.getYcor())),15);
  }
}
