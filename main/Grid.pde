Sector end = new Sector(240,560);
class Grid{
  Sector[][]world;
  int pathcount;
  
  public Grid(){
    world = new Sector[14][14];
    pathcount = 0;
    for(int i = 0;i<14;i++){
      for(int j = 0;j<14;j++){
        world[j][i] = new Sector(i*40,j*40);
      }
    }
    world[13][6].setDist(0);
    world[13][6].setNext(end);
    path();
    cpprep();
  }
  
  
  
  boolean path(){
    Queue<Sector> fringe= new LinkedList<Sector>();
    for(int i = 0;i<14;i++){
      for(int j = 0;j<14;j++){
        world[i][j].setChecked(false);
      } 
    }
    fringe.add(world[13][6]);
    //world[13][6].setChecked(true);
  
    while(fringe.size()>0){
      Sector s = fringe.remove();
      /*if(s.x == 0 && s.y == 0){
        return;
      }*/
      int x = s.x/40;
      int y = s.y/40;
      if(s.getChecked() == false){
        println(x+","+y);
        s.setChecked(true);
        try{
          if(y>0 && world[y-1][x].getChecked() == false && world[y-1][x].getOccupied() == false){
            world[y-1][x].setDist(s.getDist()+1);
            world[y-1][x].setNext(s);
            //world[y-1][x].setChecked(true);
            fringe.add(world[y-1][x]);
          }
        }catch(Exception e){}
        try{
          if(x<13 && world[y][x+1].getChecked() == false && world[y][x+1].getOccupied() == false){
            world[y][x+1].setDist(s.getDist()+1);
            world[y][x+1].setNext(s);
            //world[y][x+1].setChecked(true);
            fringe.add(world[y][x+1]);
          }
        }catch(Exception e){}
        try{
          if(y<13 && world[y+1][x].getChecked() == false && world[y+1][x].getOccupied() == false){
            world[y+1][x].setDist(s.getDist()+1);
            world[y+1][x].setNext(s);
            //world[y+1][x].setChecked(true);
            fringe.add(world[y+1][x]);
          }
        }catch(Exception e){}
        try{
          if(x>0 && world[y][x-1].getChecked() == false && world[y][x-1].getOccupied() == false){
            world[y][x-1].setDist(s.getDist()+1);
            world[y][x-1].setNext(s);
            //world[y][x-1].setChecked(true);
            fringe.add(world[y][x-1]);
          }
        }catch(Exception e){}
      }
    }
    return world[0][0].getChecked();
  }
    
    
  
  
  
  
  void cpprep(){
    /*for(Sector s : extra){
      s.setcp();
    }*/
      
    for(int i = 0;i<14;i++){
      for(int j = 0;j<14;j++){
        world[i][j].setcp();
      } 
    }
  }
  void show(){
    for(int i = 0;i<14;i++){
      for(int j = 0;j<14;j++){
        //println(world[i][j].next);
        try{
          rect(grid.world[i][j].cp.x,grid.world[i][j].cp.y,2,2);
        }catch(Exception e){}
        textSize(10);
        text(grid.world[i][j].getDist(),grid.world[i][j].x+10,grid.world[i][j].y+10);
      } 
    }
  }
  
}

    
    

