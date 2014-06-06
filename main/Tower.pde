class Tower{
  PImage gun;
  float Xcor;
  float Ycor;
  PImage buoy;
  
  void setXcor(float a) {
    Xcor = a;
  }
  
  void setYcor(float a) {
    Ycor = a;
  }
  
  void setImage(PImage p) {
    gun = p;
  }
  
  void setBuoy(PImage p) {
    buoy = p;
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
}
