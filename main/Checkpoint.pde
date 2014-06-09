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
  
  String toString(){
    return "("+x+","+y+")";
  }
}
