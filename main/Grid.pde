
class Grid{
  Sector[][]world;
  SectorQueue q;
  public Grid(){
    world = new Sector[14][14];
    q = new SectorQueue();
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
  
  public void path(Sector x){
    for(Sector s : getEmpties(x)){
      s.setDist(x.getDist()+1);
      s.setNext(x);
      q.enqueue(s);
    }
    path(q.dequeue());
  }
}
    
    

