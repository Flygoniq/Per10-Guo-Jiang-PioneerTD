class Ship{
  int health, attack;
  float speed, x, y, direction;
  Sector target;
  
  public Ship(int hp, int atk, float spd){
    health = hp;
    attack = atk;
    speed = spd;
    x = 20;
    y = 0;
    direction = PI/2;
  }
}
