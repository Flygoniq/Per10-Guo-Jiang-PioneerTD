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
    if(x == 6*40 && y == 13*40){
      cp = new Checkpoint(x+20,y+40);
    }
    try{
      cp = new Checkpoint(((next.x+x)/2)+20,((next.y+y)/2),next.cp);
    }catch(Exception e){
      return;
    }
    //println((((next.x+x)/2)+20)+","+(((next.y+y)/2)+20)+","+next.cp);
    //println(cp);
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
  Checkpoint getcp(){
    return cp;
  }
  
  String toString(){
    return "("+x+","+y+")";
  }
}
  
