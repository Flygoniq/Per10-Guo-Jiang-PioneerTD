ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
int pcount = 0;
int multiplier = 0;

void addProjectile(PImage p, float xp, float yp,float xc, float yc) {
  pcount ++;
  Projectile t = new Projectile(p,xp,yp,xc,yc);
  projectiles.add(t);
}

void removeProjectile(Projectile t) {
  projectiles.remove(t);
  pcount --;
}

void Projectilefire() {
  for (int i = 0; i < pcount; i++ ) {
    Projectile p = projectiles.get(i);
    image(p.getProjectile(), p.getXcord(),p.getYcord());
    p.setXcord(p.getXcord() + p.getXprogression());
    p.setYcord(p.getYcord() + p.getYprogression());
  }
}
