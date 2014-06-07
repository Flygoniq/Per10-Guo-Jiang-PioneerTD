
class Grid{
  Sector[][]world;
  SectorQueue q;
  //Stack stack;
  ArrayList<Sector> a;
  
  public Grid(){
    world = new Sector[14][14];
    q = new SectorQueue();
    a = new ArrayList<Sector>();
    //stack = new Stack();    
    for(int i = 0;i<14;i++){
      for(int j = 0;j<14;j++){
        world[i][j] = new Sector(i*40,j*40);
      } 
    }
  }
  
  public ArrayList<Sector> getEmpties(Sector n){
    //Sector[] temp = new Sector[4];
    ArrayList<Sector> temp = new ArrayList<Sector>();
    if(world[(n.y)-1][(n.x)].getOccupied() == false){temp.add(world[(n.y)-1][(n.x)]);}
    if(world[(n.y)][(n.x)+1].getOccupied() == false){temp.add(world[(n.y)][(n.x)+1]);}
    if(world[(n.y)+1][(n.x)].getOccupied() == false){temp.add(world[(n.y)+1][(n.x)]);}
    if(world[(n.y)][(n.x)-1].getOccupied() == false){temp.add(world[(n.y)][(n.x)-1]);}
    return temp;
  }
  
  public void path(){
    for(Sector[] ss : world){
      for(Sector s : ss){
        s.setChecked(false); 
      }
    }
    for(Sector s : getEmpties(world[13][6])){
      s.setDist(world[13][6].getDist()+1);
      s.setNext(world[13][6]);
      q.enqueue(s);
      a.add(s);
      //stack.push(s);
    }
    path(q.dequeue());
    
  }
  public void path(Sector x){
    for(Sector s : getEmpties(x)){
      s.setDist(x.getDist()+1);
      s.setNext(x);
      q.enqueue(s);
      a.add(s);
      //stack.push(s);
    }
    path(q.dequeue());
  }
  public void cpPrep(){
     for(int i = 0;i<a.size();i++){
       a.get(i).setcp();
     }
  }
}
    
    

