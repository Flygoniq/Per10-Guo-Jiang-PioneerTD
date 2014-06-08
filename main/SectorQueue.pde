class SectorQueue{
  class Node{
    Sector data;
    Node next, prev;
    
    public Node(Sector s){
      data = s;
      next = null;
      prev = null;
    }
    public Node(){
      data = null;
      next = null;
      prev = null;
    }
    
    public boolean hasNext(){
      return (next != null);
    }
    
    public Sector getData(){
      return data; 
    }
    public void setData(Sector s){
      data = s;
    }
    public Node getNext(){
      return next;
    }
    public void setNext(Node n){
      next = n;
    }
    public Node getPrev(){
      return prev;
    }
    public void setPrev(Node n){
      prev = n;
    }
  }
  
  private Node root,start;
  int size;
  
  public SectorQueue(){
    root = new Node();
    start = root;
    size = 0;
  }
  
  public void enqueue(Sector s){
    Node temp = new Node(s);
    if(root.getPrev() == null){
      root.setPrev(temp);
    }
    temp.setNext(start);
    start.setPrev(temp);
    start = temp;
    size++;
  }
  public Sector dequeue(){
    if(root.getPrev() == null)throw new NoSuchElementException();
    Sector temp = root.getPrev().getData();
    try{
      root.setPrev(root.getPrev().getPrev());
      root.getPrev().getPrev().setNext(root);
    }
    catch(Exception e){root.setPrev(null);}
    size--;
    return temp;
  }
}
