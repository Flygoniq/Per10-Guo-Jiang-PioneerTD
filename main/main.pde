import java.io.*;
import java.util.*;

boolean drawgrid = false;
boolean buoySelected = false;
PImage lightbuoy;

void setup(){
  backGround();
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
  lightbuoy = LightBuoyBase;
  image(lightbuoy,20,585);
  image(LightBuoyGun,37,585);
}

void draw(){
  if (drawgrid){
    drawGrid();
  }
  else{backGround();}//gonna need something less timeconsuming than this, like an abbreviated setup resetish thingy
  println(mouseX + "," + mouseY);
  while (buoySelected == true) {
    image(lightbuoy,mouseX,mouseY);
  }
}

void mouseClicked(){
  if(mouseY >= 575 && mouseY <= 635){
    drawgrid = true;
  }
  else{
    drawgrid = false;
  }
  if (mouseY >585 && mouseY < 600 && mouseX >20 && mouseX < 30) {
    buoySelected = true;
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
  
