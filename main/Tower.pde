class Tower{
  PImage gun;
  float Xcor;
  float Ycor;
  PImage buoy;
  boolean fire = true;
  Projectile projectile;
  float angle = 0;
  
  public Tower() {
  }
  
  public Tower(PImage b, PImage g,PImage p) {
    gun = g;
    buoy = b;
    projectile = p;
  }
  
  void setXcor(float a) {
    Xcor = a;
  }
  
  void setYcor(float a) {
    Ycor = a;
  }
  
  void setGun(PImage p) {
    gun = p;
  }
  
  void setBuoy(PImage p) {
    buoy = p;
  }
  void setProjectile(PImage p ) {
    projectile = p;
  }
  
  
  float getYcor() {
    return Ycor;
  }
  float getXcor() {
    return Xcor;
  }
  PImage getBuoy() {
    return buoy;
  }
  PImage getGun() {
    return gun;
  }
  
  PImage getProjectile() {
    return projectile;
  }
}
