ArrayList<Ship> ships = new ArrayList<Ship>();

int[]first = {1,1,1,1,1};
int[]second = {1,1,1,1,1,2};
int[]third = {1,1,1,1,2,2,2,2};
int[]fourth = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2};
int[]fifth = {1,1,2,2,1,2,1,2};
int[]sixth = {3,3,3,3};
int[]seventh = {2,2,2,1,2,1,4};
int[]eighth = {3,3,3,3,3,3,3,3,3,3,3,3,3};
int[]ninth = {2,2,3,3,4,2,2,3,3,4,4};
int[]tenth = {3,4,3,4,3,4,3,3,3,3,4,4,4};

void prepLevels(){
  for(int i = 0;i<10;i++){
    levels.add(new ArrayList<Integer>());
  }
  for(int i : first){
    levels.get(0).add(first[i]); 
  }
  for(int i : second){
    levels.get(1).add(second[i]); 
  }
  for(int i : third){
    levels.get(2).add(third[i]); 
  }
  for(int i : fourth){
    levels.get(3).add(fourth[i]); 
  }
  for(int i : fifth){
    levels.get(4).add(fifth[i]); 
  }
  for(int i : sixth){
    levels.get(5).add(sixth[i]); 
  }
  for(int i : seventh){
    levels.get(6).add(seventh[i]); 
  }
  for(int i : eighth){
    levels.get(7).add(eighth[i]); 
  }
  for(int i : ninth){
    levels.get(8).add(ninth[i]); 
  }
  for(int i : tenth){
    levels.get(9).add(tenth[i]); 
  }
}
  
int bcount = 0;

Ship addShip(int x){
  bcount ++;
  switch(x){
    case 1: return new PTBoat();
    case 2: return new Cruiser();
    case 3: return new Corvette();
    case 4: return new Carrier();
  }
  return new PTBoat();
}

void removeShip(Ship s) {
  ships.remove(s);
  bcount --;
}
