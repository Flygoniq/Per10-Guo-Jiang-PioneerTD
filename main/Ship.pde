class Ship{
  int health, attack;
  float basespeed, speed, x, y, direction;
  Checkpoint target;
  PImage avatar;
  
  public Ship(int hp, int atk, float spd){
    health = hp;
    attack = atk;
    speed = spd;
    basespeed = spd;
    x = 20;
    y = 0;
    direction = PI/2;
    target = grid.world[0][0].getcp();
  }
  
  void move(){
    //println(x+" "+y);
    //println("Direction: "+direction);
    //println(speed+" "+(float)2/6+" "+sin(direction));
    x += speed*(float)2/6*cos(direction);
    y += speed*(float)2/6*sin(direction);
    //println(x+" "+y);
    //if(sqrt(sq(x-target.x)+sq(y-target.y))<1)target=target.next;
  }

  void turn(){
    //float angle = (atan2(target.x-x,target.y-y)-direction);
    float angle = (atan2(50-x,50-y)-direction);
    if(angle>90)direction -= -180;
    if(angle<-90)direction += 180;
    float max = (90*(speed*(float)(2/6)))/(10*PI);
    if(angle>max)angle = max;
    if(angle<-1*max)angle = -1*max;
    direction+=angle;
  }
  void act(){
    turn();
    move();
    pushMatrix();
    translate(x,y);
    println(x+" "+y);
    rotate(direction);
    image(avatar,0,0);
    popMatrix();
  }
}
