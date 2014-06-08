class Projectile {
  PImage projectile;
  Ship destination;
  float Xprogression = 0;
  float Yprogression = -10;
  
  
  public Projectile(){}
  public Projectile(PImage p, float x, float y,){
    projectile = p;
    Xprogression = x;
    Yprogression = y;
  }
  
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
  float getXprogression() {
    return Xprogression;
  }
  float getYprogression() {
    return Yprogression;
  }
    
}
