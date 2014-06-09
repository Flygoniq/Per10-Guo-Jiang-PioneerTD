class Ship{
  int health, attack;
  float basespeed, speed, x, y, direction;
  Sector target;
  PImage avatar;
  
  public Ship(int hp, int atk, float spd){
    health = hp;
    attack = atk;
    speed = spd;
    basespeed = spd;
    x = 20;
    y = 0;
    direction = PI/2;
    target = grid.world[0][0];
  }
  
  void move(){
    x += speed*(float)2/6*cos(direction);
    y += speed*(float)2/6*sin(direction);
    if(sqrt(sq(x-target.cp.x)+sq(y-target.cp.y))<1)target=target.next;
    rect(target.cp.x,target.cp.y,2,2);
  }

  void turn(){
    float angle = (atan2(target.cp.y-y,target.cp.x-x)-direction);
    //float angle = (atan2(50-x,50-y)-direction);
    //println("First angle calculation: " + angle);
    if(angle>90)direction -= -180;
    if(angle<-90)direction += 180;
    float max = (90*(speed*(float)2/6))/(10*PI);
    //println("Max is: "+max);
    if(angle>max)angle = max;
    if(angle<-1*max)angle = -1*max;
    //println("Second angle calculation: " + angle);
    direction+=angle;
  }
  void act(){
    turn();
    move();
    pushMatrix();
    translate(x,y);
    //println(x+" "+y);
    rotate(direction+PI/2);
    image(avatar,0,0);
    popMatrix();
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  void setX(float n) {
    x = n;
  }
  void setY(float n) {
    y = n;
  }
}
