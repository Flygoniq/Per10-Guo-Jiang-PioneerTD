class Projectile {
  PImage projectile;
  Ship destination;
  float Xprogression = 0;
  float Yprogression = -10;
  float Xcord;
  float Ycord;
  float Angle;
  
  
  public Projectile(){}
  public Projectile(PImage p, float xp, float yp,float xc, float yc,float angle){
    projectile = p;
    Xprogression = xp;
    Yprogression = yp;
    Xcord = xc;
    Ycord = yc;
    Angle = angle;
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
  void setXcord(float t) {
    Xcord = t;
  }
  void setYcord(float t) {
    Ycord = t;
  }
  float getXcord(){
    return Xcord;
  }
  float getYcord() {
    return Ycord;
  }
  float getAngle() {
    return Angle;
  }
  void setAngle(float a) {
    Angle = a;
  }
}
