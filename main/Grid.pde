
class Grid{
  Sector[][]world;
<<<<<<< HEAD
  //SectorQueue q;
=======
  Queue<Sector> fringe;
>>>>>>> 66cba409ce4ece5f1a001fc891f7693c86e01912
  //Stack stack;
  ArrayList<Sector> a;
  int pathcount;
  
  public Grid(){
    world = new Sector[14][14];
<<<<<<< HEAD
    //q = new SectorQueue();
=======
    fringe = new LinkedList<Sector>();
>>>>>>> 66cba409ce4ece5f1a001fc891f7693c86e01912
    a = new ArrayList<Sector>();
    pathcount = 0;
    //stack = new Stack();    
    for(int i = 0;i<14;i++){
      for(int j = 0;j<14;j++){
        world[i][j] = new Sector(i*40,j*40);
      } 
    }
    world[13][6].setDist(0);
    world[13][6].setNext(new Sector(280,520));
    path();
    cpPrep();
  }
  
  
<<<<<<< HEAD
  public void path(){
    for(Sector[] ss : world){
      for(Sector s : ss){
        s.setChecked(false); 
      }
    }
    //ArrayList<Sector> holder = getEmpties(world[13][6]);
    for(Sector s : getEmpties(world[13][6])){
      s.setDist(world[13][6].getDist()+1);
      s.setNext(world[13][6]);
      //q.enqueue(s);
      a.add(s);
      //stack.push(s);
    }
    /*(if(q.size>0){
      path(q.dequeue());
    }*/
  }
  public void path(Sector x){
    for(Sector s : getEmpties(x)){
      s.setDist(x.getDist()+1);
      s.setNext(x);
      //q.enqueue(s);
      a.add(s);
      //stack.push(s);
    }
    /*(if(q.size>0){
      path(q.dequeue());
    }*/
=======
  void path(){
    fringe.add(world[13][6]);
    a.add(world[13][6]);
    pather();
  }
  void pather(){
    Queue<Sector> temp = new LinkedList<Sector>();
    for(Sector s : fringe){
      int x = s.x/40;
      int y = s.y/40;
      try{
        if(world[y-1][x].getOccupied() == false && world[y-1][x].getDist()>s.getDist()){
          world[y-1][x].setDist(s.getDist()+1);
          world[y-1][x].setNext(s);
          temp.add(world[y-1][x]);
          a.add(world[y-1][x]);
        }
      }catch(Exception e){}
      try{
        if(world[y][x+1].getOccupied() == false && world[y][x+1].getDist()>s.getDist()){
          world[y][x+1].setDist(s.getDist()+1);
          world[y][x+1].setNext(s);
          temp.add(world[y][x+1]);
          a.add(world[y][x+1]);
        }
      }catch(Exception e){}
      try{
        if(world[y+1][x].getOccupied() == false && world[y+1][x].getDist()>s.getDist()){
          world[y+1][x].setDist(s.getDist()+1);
          world[y+1][x].setNext(s);
          temp.add(world[y+1][x]);
          a.add(world[y+1][x]);
        }
      }catch(Exception e){}
      try{
        if(world[y][x-1].getOccupied() == false && world[y][x-1].getDist()>s.getDist()){
          world[y][x-1].setDist(s.getDist()+1);
          world[y][x-1].setNext(s);
          temp.add(world[y][x-1]);
          a.add(world[y][x-1]);
        }
      }catch(Exception e){}
    }
    for(Sector s : temp){
      fringe.add(s);
    }
  }
      
  void show(){
    for(int i = 0;i<14;i++){
      for(int j = 0;j<14;j++){
        print(world[i][j].getChecked() + "\t");
      } 
      println();
    }
>>>>>>> 66cba409ce4ece5f1a001fc891f7693c86e01912
  }
  
  public void cpPrep(){
     for(int i = 0;i<a.size();i++){
       println(a.get(i).y+" "+a.get(i).x);
       a.get(i).setcp();
     }
  }
}

    
    

