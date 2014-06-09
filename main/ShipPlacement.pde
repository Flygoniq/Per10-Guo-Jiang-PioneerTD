ArrayList<Ship> ships = new ArrayList<Ship>();
int bcount = 0;

void addShip(float damage, float health){
  bcount ++;
  Ship s = new Ship();
  s.setDamage(damage);
  s.setHealth(health);
  ships.add(s);
}

void removeShip(Ship s) {
  ships.remove(s);
  bcount --;
}
