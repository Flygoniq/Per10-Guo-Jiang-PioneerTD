
class Grid{
  Sector[][]world;
  Queue<Sector> fringe;
  int pathcount;
  
  public Grid(){
    world = new Sector[14][14];
    fringe = new LinkedList<Sector>();
    pathcount = 0;
    for(int i = 0;i<14;i++){
      for(int j = 0;j<14;j++){
        world[i][j] = new Sector(i*40,j*40);
      } 
    }
    world[13][6].setDist(0);
    world[13][6].setNext(new Sector(280,520));
    path();
    cpprep();
  }
  
  
  
  void path(){
    for(int i = 0;i<14;i++){
      for(int j = 0;j<14;j++){
        world[i][j].setChecked(false);
      } 
    }
    fringe.add(world[13][6]);
    world[13][6].setChecked(true);
    pather();
  }
  
  void pather(){
    Sector s = fringe.remove();
    int x = s.x/40;
    int y = s.y/40;
    try{
      //Sector world[y-1][x] = world[y-1][x];
      if(world[y-1][x].getChecked() == false && world[y-1][x].getOccupied() == false && world[y-1][x].getDist()>s.getDist()){
        world[y-1][x].setDist(s.getDist()+1);
        world[y-1][x].setNext(s);
        world[y-1][x].setChecked(true);
        fringe.add(world[y-1][x]);
        pather();
      }
    }catch(Exception e){}
    try{
      //Sector world[y][x+1] = world[y][x+1];
      if(world[y][x+1].getChecked() == false && world[y][x+1].getOccupied() == false && world[y][x+1].getDist()>s.getDist()){
        world[y][x+1].setDist(s.getDist()+1);
        world[y][x+1].setNext(s);
        world[y][x+1].setChecked(true);
        fringe.add(world[y][x+1]);
        pather();
      }
    }catch(Exception e){}
    try{
      //Sector world[y+1][x] = world[y+1][x];
      if(world[y+1][x].getChecked() == false && world[y+1][x].getOccupied() == false && world[y+1][x].getDist()>s.getDist()){
        world[y+1][x].setDist(s.getDist()+1);
        world[y+1][x].setNext(s);
        world[y+1][x].setChecked(true);
        fringe.add(world[y+1][x]);
        pather();
      }
    }catch(Exception e){}
    try{
      //Sector world[y][x-1] = world[y][x-1];
      if(world[y][x-1].getChecked() == false && world[y][x-1].getOccupied() == false && world[y][x-1].getDist()>s.getDist()){
        world[y][x-1].setDist(s.getDist()+1);
        world[y][x-1].setNext(s);
        world[y][x-1].setChecked(true);
        fringe.add(world[y][x-1]);
        pather();
      }
    }catch(Exception e){}
  }

  
  
  
  
  
  
  void cpprep(){
    for(int i = 0;i<14;i++){
      for(int j = 0;j<14;j++){
        world[i][j].setcp();
      } 
    }
  }
  void show(){
    for(int i = 0;i<14;i++){
      for(int j = 0;j<14;j++){
        println(world[i][j].next);
        //rect(grid.world[i][j].cp.x,grid.world[i][j].cp.y,2,2);
      } 
    }
  }
  
}

    
    

