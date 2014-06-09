class Tower{
  PImage gun;
  float Xcor;
  float Ycor;
  PImage buoy;
  boolean fire = true;
  PImage projectile;
  float angle = 0;
  float firingspeed;
  
  public Tower() {
  }
  
  public Tower(PImage b, PImage g,PImage p,float n) {
    gun = g;
    buoy = b;
    projectile=p;
    firingspeed = n;
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
  void setProjectile(PImage p) {
    projectile=p;
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
  float getFiringspeed() {
    return firingspeed;
  }
  void setFiringspeed(float n) {
    firingspeed = n;
  }
  float getAngle() {
    return angle;
  }
  void setAngle(float f ) {
    angle = f;
  }
  
}
