class PTBoat extends Ship{
  public PTBoat(){
    super(20,1,3,10);
    avatar = PTBoat;
  }
}

class Cruiser extends Ship{
  public Cruiser(){
    super(140,4,2,40);
    avatar = Cruiser;
  }
}

class Corvette extends Ship{
  public Corvette(){
    super(80,2,3,30);
    avatar = Corvette;
  }
}

class Carrier extends Ship{
  public Carrier(){
    super(200,10,1,60);
    avatar = Carrier;
  }
}
