
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
    path();
    cpPrep();
  }
  
  public ArrayList<Sector> getEmpties(Sector n){
    //Sector[] temp = new Sector[4];
    ArrayList<Sector> temp = new ArrayList<Sector>();
    try{if(world[(n.y/40)-1][(n.x/40)].getOccupied() == false){temp.add(world[(n.y/40)-1][(n.x/40)]);}}catch(Exception e){}
    try{if(world[(n.y/40)][(n.x/40)+1].getOccupied() == false){temp.add(world[(n.y/40)][(n.x/40)+1]);}}catch(Exception e){}
    try{if(world[(n.y/40)+1][(n.x/40)].getOccupied() == false){temp.add(world[(n.y/40)+1][(n.x/40)]);}}catch(Exception e){}
    try{if(world[(n.y/40)][(n.x/40)-1].getOccupied() == false){temp.add(world[(n.y/40)][(n.x/40)-1]);}}catch(Exception e){}
    return temp;
  }
  
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
      q.enqueue(s);
      a.add(s);
      //stack.push(s);
    }
<<<<<<< HEAD
    if(q.size>0){
      path(q.dequeue());
    }
=======
    path(q.dequeue());
<<<<<<< HEAD
    
=======
>>>>>>> 34bdf4af7b608d5897f9796f77db8e5a248f7326
>>>>>>> 08f43ce7cc0abe3f590d011ded5b22c8823cc7cf
  }
  public void path(Sector x){
    for(Sector s : getEmpties(x)){
      s.setDist(x.getDist()+1);
      s.setNext(x);
      q.enqueue(s);
      a.add(s);
      //stack.push(s);
    }
    if(q.size>0){
      path(q.dequeue());
    }
  }
<<<<<<< HEAD

=======
>>>>>>> 34bdf4af7b608d5897f9796f77db8e5a248f7326
  public void cpPrep(){
     for(int i = 0;i<a.size();i++){
       a.get(i).setcp();
     }
  }
}
    
    

