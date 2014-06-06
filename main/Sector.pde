class Sector{
  private boolean occupied, buildable, checked;
  private int dist;
  int x,y;
  private Sector next;
  Checkpoint cp;
  
  public Sector(int x, int y){
   occupied = false;
   checked = false;
   buildable = true;
   this.x = x;
   this.y = y;
   dist = 0;
   next = null;
   cp = null;
  }
  
  void setcp(){
    cp = new Checkpoint(abs(next.x-x),abs(next.y-y),next.cp);
  }
  void setOccupied(boolean boo){
    occupied = boo;
  }
  void setBuildable(boolean boo){
    buildable = boo;
  }
  void setChecked(boolean boo){
    checked = boo;
  }
  void setDist(int x){
    dist = x; 
  }
  void setNext(Sector s){
    next = s;
  }
  
  boolean getOccupied(){
    return occupied;
  }
  boolean getBuildable(){
    return buildable;
  }
  boolean getChecked(){
    return checked;
  }
  int getDist(){
    return dist;
  }
  Sector getNext(){
    return next;
  }
  
  class Checkpoint{
    int x, y;
    Checkpoint next;
    
    public Checkpoint(int x, int y){
      this.x = x;
      this.y = y;
      next = null;
    }
    
    public Checkpoint(int x, int y, Checkpoint n){
      this.x = x;
      this.y = y;
      next = n;
    }
  }
}
