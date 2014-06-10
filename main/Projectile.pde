class Projectile {
  PImage projectile;
  Ship destination;
  float Xprogression = 0;
  float Yprogression = -10;
  float Xcord;
  float Ycord;
  float Angle;
  float damage;
  
  
  public Projectile(){}
  public Projectile(PImage p, float xp, float yp,float xc, float yc,float angle,float d, Ship target){
    projectile = p;
    Xprogression = xp;
    Yprogression = yp;
    Xcord = xc;
    Ycord = yc;
    Angle = angle;
    damage = d;
    destination = target;
  }
  public Projectile(PImage p, float xp, float yp,float xc, float yc,float angle,float damage){
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
  void setDestination(Ship s){
    destination = s;
  }
  Ship getDestination() {
    return destination;
  }
  
  void attack() {
    Xcord += Xprogression;
    Ycord += Yprogression;
    //println("part 3");
    if (destination != null) {
      if (destination.getHealth() <= 0 || !(destination.getInplay())) {
      destination = null;
    }
    else{
      //println("true");
      if (Ycord +20 > destination.getY()) {
        Angle = atan((destination.getX() - Xcord - 20)/(Ycord+20 - destination.getY()));
      }
      else {
        Angle = (-1*atan((destination.getX()-Xcord - 20)/(destination.getY() - Ycord - 20))) + PI;
      }
    
      setXprogression(5*sin(Angle));
      setYprogression(-5*cos(Angle));
      println(dist(Xcord-20*cos(PI-Angle),Ycord-20*sin(PI-Angle),destination.getX(),destination.getY()));
       if (dist(Xcord-20*cos(PI-Angle),Ycord-20*sin(PI-Angle),destination.getX(),destination.getY()) < 10) {
         //System.out.println("damage" +damage);
      destination.takeDamage(damage);
      projectiles.remove(this);
      pcount --;
       }
    }
    }
    else {
      for(int i = 0; i<bcount; i++ ) {
        float shipx = ships.get(i).getX();
        float shipy = ships.get(i).getY();
        if (dist(shipx,shipy,Xcord,Ycord) < 10){
          ships.get(i).takeDamage(10);
          this.setXcord(-300);
          this.setYcord(-300);
        }
      }
    }
      pushMatrix();
      translate(Xcord,Ycord);
      translate(20,20);
      rotate(Angle);
      translate(-20,-20);
      image(projectile,0,0);
      popMatrix();
    }
}
