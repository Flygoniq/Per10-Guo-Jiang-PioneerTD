ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
int count = 0;
int multiplier = 0;

void addProjectile(PImage b, PImage g,PImage p, float x, float y) {
  count ++;
  Projectile t = new Projectile();
  t.setYprogression(y);
  t.setXprogression(x);
  t.setProjectile(p);
  projectiles.add(t);
}

void removeProjectile(Projectile t) {
  projectiles.remove(t);
  count --;
}
