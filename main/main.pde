import java.io.*;
import java.util.*;


boolean drawgrid = false;
boolean placeTower = false;
boolean setTower = false;
Grid grid;
int resources;
PTBoat tester;
Tower current;
//Checkpoint lastcp;


void setup(){
  grid = new Grid();
  backGround();
  tester = new PTBoat();
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
}

void draw(){
  backGround();
  if (drawgrid){
    drawGrid();
  }
  else{backGround();}
  println(mouseX + "," + mouseY);
  if(placeTower){
  setX(mouseX-20);
  setY(mouseY-20);
  }
  if (setTower){
    DrawGuns();
  }
  if (placeTower) {
    drawGrid();
    image(current.getBuoy(),ghostx,ghosty);
  }
  //tester.act();
}

void mouseClicked(){
  if(mouseY >= 575 && mouseY <= 635){
    drawgrid = true;
  }
  else{
    drawgrid = false;
  }
  if (checkMouse(20,60,585,625)) {
    current = new Tower(LightBuoyBase,LightBuoyGun);
  }
  if (checkMouse(111,150,585,625)) {
    current = new Tower(RocketBase, RocketGun);
  }
  if (checkMouse("All Towers")){
    placeTower = true;
  }
  else if (placeTower) {
    addTower(current.getBuoy(), current.getGun(),(((int)((ghostx+20)/40))*40),(((int)((ghosty+20)/40))*40));
    grid.world[(int)(ghostx+20)/40][(int)(ghosty+20)/40].occupied = true;
    setTower = true;
    placeTower = false;
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

  
