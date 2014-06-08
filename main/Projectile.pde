class Projectile {
  PImage projectile;
  Ship destination;
  float Xprogression;
  float Yprogression;
  
  PImage getProjectile() {
    return projectile;
  }
  void setProjectile(PImage p) {
    projectile = p;
  }
  void setXprogression(float n) {
    Xprogression = n;
  }
  void setYprogression (float n) {
    Yprogression = n;
  }
  
 
}
