import java.io.*;
import java.util.*;


boolean drawgrid = false;
boolean placeTower = false;
boolean setTower = true;
Grid grid;
float resources = 400;
PTBoat tester;
Tower current;
boolean fire = true;
float tick= 0;
float m;
//Checkpoint lastcp;


void setup(){
  grid = new Grid();
  grid.show();
  backGround();
  tester = new PTBoat();
  addTower(FalseTower,BaseCannon,LightBuoyProjectile,50,240,520,10);
  current = Towers.get(0);
  ships.add(tester);
  bcount = 1;
}
void backGround() {
  loadImages();
  size(560,650);
  background(#4BC8F0);
  fill(#004B64);
  rect(0,560,560,90);//menu rect
  fill(#B4BEC8);
  rect(240,520,80,40);//base
  fill(#FFFF00);
  rect(10,575,60,60);//yellow button
  image(LightBuoyBase,20,585);
  image(LightBuoyGun,20,585);
  rect(100,575,60,60);
  image(RocketBase, 110,585);
  image(RocketGun, 110,583);
  textSize(20);
  text("Resources",460,580);
  textSize(32);
  text(resources,460,630);
  grid.show();
}

void draw(){
  //println(count);
  //System.out.println(tick);
  backGround();
  if (drawgrid){
    drawGrid();
  }
  else{backGround();}
  //println(mouseX + "," + mouseY);
  if(placeTower){
  setX(mouseX-20);
  setY(mouseY-20);
  }
  if (setTower){
    DrawGuns();
    m = m+1;
    }
  if (placeTower) {
    drawGrid();
    image(current.getBuoy(),ghostx,ghosty);
  }
  for(int i = 0;i<14;i++){
    for(int j = 0;j<14;j++){
      try{rect(grid.world[i][j].cp.x,grid.world[i][j].cp.y,2,2);}catch(Exception e){}
    } 
  }
  //rect(tester.target.x,tester.target.y,40,40);
  //tester.act();
  tick++;
  update();
  //println(pcount);
}

void mouseClicked(){
  if(mouseY >= 575 && mouseY <= 635){
    drawgrid = true;
  }
  else{
    drawgrid = false;
  }
  if (checkMouse(20,60,585,625)) {
    current = new Tower(LightBuoyBase,LightBuoyGun,LightBuoyProjectile,50,50,15);
    System.out.println("damage of current" + current.getDamage());
  }
  if (checkMouse(111,150,585,625)) {
    current = new Tower(RocketBase, RocketGun,RocketGun,100,100,30);
  }
  if (checkMouse("All Towers")){
    placeTower = true;
  }
  else if (placeTower) {
    if (grid.world[(int)(ghostx+20)/40][(int)(ghosty+20)/40].occupied == true) {}
    else if (resources - current.getCost() < 0){}
    else {
    addTower(current.getBuoy(), current.getGun(),current.getProjectile(),current.getFiringspeed(),(((int)((ghostx+20)/40))*40),(((int)((ghosty+20)/40))*40),current.getDamage());
    grid.world[(int)(ghostx+20)/40][(int)(ghosty+20)/40].occupied = true;
    setTower = true;
    placeTower = false;
    resources = resources - current.getCost();
    }
  }
  Cannonfire();
}

void drawGrid() {
  fill(#000000);
     for(int i = 40;i<560;i+=40){
       line(i,0,i,560);
     } 
     for(int i = 40;i<560;i+=40){
       line(0,i,560,i);
     }
}
boolean checkMouse(int startX, int endX, int startY, int endY) {
  return (mouseY > startY && mouseX>startX && mouseY<endY && mouseX < endX);
}
boolean checkMouse(String s) {
  return (checkMouse(20,60,585,625) || checkMouse(111,150,585,625));
}

  
