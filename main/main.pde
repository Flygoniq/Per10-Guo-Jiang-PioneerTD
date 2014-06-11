import java.io.*;
import java.util.*;


boolean drawgrid = false;
boolean placeTower = false;
boolean setTower = true;
Grid grid;
float resources;
Tower current;
boolean fire = true;
float tick= 0,timer = 0;
float m;
int wallhp;
int mode = 0;
int wave;
ArrayList<Ship> foes;
ArrayList<ArrayList<Integer>> levels;
//Checkpoint lastcp;


void setup(){
  grid = new Grid();
  backGround();
  addTower(FalseTower,BaseCannon,LightBuoyProjectile,50,240,520,10);
  current = Towers.get(0);
  wallhp = 30;
  resources = 400;
  wave = 0;
  foes = new ArrayList<Ship>();
  levels = new ArrayList<ArrayList<Integer>>();
  prepLevels();
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
  text("Health",380,600);
  textSize(26);
  fill(#E80000);
  text(resources,460,630);
  text(wallhp,400,630);
  switch(mode){
    case 0:
      image(PlayButton,280,520);
      break;
    case 1:
      break;
  }
}

void draw(){
  //System.out.println(tick);
  backGround();
  /*if (drawgrid){
    drawGrid();
  }
  else{backGround();}*/
  if(placeTower){
    setX(mouseX-20);
    setY(mouseY-20);
  }
  switch(mode){
    case 0:
      if (setTower){
        m = m+1;
        }
      if (placeTower) {
        drawGrid();
        image(current.getBuoy(),ghostx,ghosty);
      }
    break;
    
    case 1:
      if(timer+30<tick && levels.get(wave).size() > 0){
        ships.add(addShip(levels.get(wave).remove(0)));
        timer = tick;
      }
      for(int i = 0;i<ships.size();i++){
        ships.get(i).act();
      }
      if(ships.size() == 0 && levels.get(wave).size() == 0){
        if(wave == 10)mode = 2;
        mode = 0;
        resources+=50;
      }
      update();
      break;
    case 2:
      text("Good Job",200,200);
  }
  DrawGuns();
  tick++;
  //println(pcount);
}

void mouseClicked(){
  switch(mode){
    case 0:
      println("yeah it's working");
      /*if(mouseY >= 575 && mouseY <= 635){
        drawgrid = true;
      }
      else{
        drawgrid = false;
      }*/
      if (checkMouse(20,60,585,625)) {
        current = new Tower(LightBuoyBase,LightBuoyGun,LightBuoyProjectile,30,50,1);
        //System.out.println("damage of current" + current.getDamage());
      }
      if (checkMouse(111,150,585,625)) {
        current = new Tower(RocketBase, RocketGun,RocketGun,100,100,30);
      }
      if (checkMouse("All Towers")){
        placeTower = true;
      }
      else if (placeTower) {
        if(mouseY < 575 && grid.world[(int)(ghosty+20)/40][(int)(ghostx+20)/40].occupied == false){
          grid.world[(int)(ghosty+20)/40][(int)(ghostx+20)/40].occupied = true;
        }
        if (resources > current.getCost() && grid.path()){
          addTower(current.getBuoy(), current.getGun(),current.getProjectile(),current.getFiringspeed(),(((int)((ghostx+20)/40))*40),(((int)((ghosty+20)/40))*40),current.getDamage());
          println((int)(ghostx+20)/40);
          println((int)(ghosty+20)/40);
          setTower = true;
          placeTower = false;
          resources = resources - current.getCost();
        }else{
          println("rejected");
          m--;
          setTower = true;
          placeTower = false;
          grid.world[(int)(ghosty+20)/40][(int)(ghostx+20)/40].occupied = false;
          grid.path();
        }
      }
      if(!placeTower && checkMouse(280,320,520,560)){
         if(!grid.path())break;
         grid.path();
         mode = 1;
         wave++;
         timer = tick;
      }
      break;
    case 1:
      Cannonfire();
      println("woot");
      break;
  }
  
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

  
