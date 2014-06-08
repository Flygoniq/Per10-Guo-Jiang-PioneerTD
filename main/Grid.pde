
class Grid{
  Sector[][]world;
  Queue<Sector> q;
  //Stack stack;
  ArrayList<Sector> a;
  int pathcount;
  
  public Grid(){
    world = new Sector[14][14];
    q = new LinkedList<Sector>();
    a = new ArrayList<Sector>();
    pathcount = 0;
    //stack = new Stack();    
    for(int i = 0;i<14;i++){
      for(int j = 0;j<14;j++){
        world[i][j] = new Sector(i*40,j*40);
      } 
    }
    path();
    cpPrep();
  }
  
  public ArrayList<Sector> getEmpties(Sector n){
    ArrayList<Sector> temp = new ArrayList<Sector>();
    int x = n.x/40;
    int y = n.y/40;
    println(x+","+y);
    if(y>0 && world[y-1][x].getOccupied() == false && world[y-1][x].getChecked() == false){
      temp.add(world[y-1][x]);
      println(world[y-1][x].getChecked());
    }
    if(x<13 && world[y][x+1].getOccupied() == false && world[y][x+1].getChecked() == false){
      temp.add(world[y][x+1]);
    }
    if(y<13 && world[y+1][x].getOccupied() == false && world[y+1][x].getChecked() == false){
      temp.add(world[y+1][x]);
    }
    if(x>0 && world[y][x-1].getOccupied() == false && world[y][x-1].getChecked() == false){
      temp.add(world[y][x-1]);
    }
    println(temp.size());
    return temp;
  }
  
  public void path(){
    /*for(Sector[] ss : world){
      for(Sector s : ss){
        s.setChecked(false); 
        println("running");
      }
    }*/
    ArrayList<Sector> holder = getEmpties(world[13][6]);
    world[13][6].setChecked(true);
    for(Sector s : holder){
      s.setDist(world[13][6].getDist()+1);
      s.setNext(world[13][6]);
      q.add(s);
      a.add(s);
    }
    Sector temp = q.remove();
    if(q.size()>0)path(temp.y/40,temp.x/40);
  }
  
  public void path(int y,int x){
    ArrayList<Sector> holder = getEmpties(world[y][x]);
    world[y][x].setChecked(true);
    for(Sector s : holder){
      s.setDist(world[y][x].getDist()+1);
      s.setNext(world[y][x]);
      q.add(s);
      a.add(s);
    }
    Sector temp = q.remove();
    if(q.size()>0)path(temp.y/40,temp.x/40);
  }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
  public void cpPrep(){
     for(int i = 0;i<a.size();i++){
       a.get(i).setcp();
     }
  }
}
    
    

