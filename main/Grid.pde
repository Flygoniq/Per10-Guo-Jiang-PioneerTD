
class Grid{
  Sector[][]world;
  Queue<Sector> fringe;
  //Stack stack;
  ArrayList<Sector> a;
  int pathcount;
  
  public Grid(){
    world = new Sector[14][14];
    fringe = new LinkedList<Sector>();
    a = new ArrayList<Sector>();
    pathcount = 0;
    //stack = new Stack();    
    for(int i = 0;i<14;i++){
      for(int j = 0;j<14;j++){
        world[i][j] = new Sector(i*40,j*40);
      } 
    }
    world[13][6].setDist(0);
    path();
    cpPrep();
  }
  
  
  void path(){
    fringe.add(world[13][6]);
    a.add(world[13][6]);
    pather();
  }
  void pather(){
    for(Sector s : fringe){
      int x = s.x/40;
      int y = s.y/40;
      try{
        if(world[y-1][x].getOccupied() == false && world[y-1][x].getDist()>s.getDist()){
          world[y-1][x].setDist(s.getDist()+1);
          fringe.add(world[y-1][x]);
          a.add(world[y-1][x]);
        }
      }catch(Exception e){}
      try{
        if(world[y][x+1].getOccupied() == false && world[y][x+1].getDist()>s.getDist()){
          world[y][x+1].setDist(s.getDist()+1);
          fringe.add(world[y][x+1]);
          a.add(world[y][x+1]);
        }
      }catch(Exception e){}
      try{
        if(world[y+1][x].getOccupied() == false && world[y+1][x].getDist()>s.getDist()){
          world[y+1][x].setDist(s.getDist()+1);
          fringe.add(world[y+1][x]);
          a.add(world[y+1][x]);
        }
      }catch(Exception e){}
      try{
        if(world[y][x-1].getOccupied() == false && world[y][x-1].getDist()>s.getDist()){
          world[y][x-1].setDist(s.getDist()+1);
          fringe.add(world[y][x-1]);
          a.add(world[y][x-1]);
        }
      }catch(Exception e){}
    }
  }
      
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  void show(){
    for(int i = 0;i<14;i++){
      for(int j = 0;j<14;j++){
        print(world[i][j].getChecked() + "\t");
      } 
      println();
    }
  }
  
  public void cpPrep(){
     for(int i = 0;i<a.size();i++){
       a.get(i).setcp();
     }
  }
}
    
    

