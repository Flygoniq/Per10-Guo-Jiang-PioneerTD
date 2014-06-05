import java.io.*;
import java.util.*;

boolean drawgrid = false;

void setup(){
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
  image(LightBuoyGun,37,585);
  image(EntranceTile,0,0);
}

void draw(){
  if(drawgrid == true){
    fill(#000000);
     for(int i = 40;i<560;i+=40){
       line(i,0,i,560);
     } 
     for(int i = 40;i<560;i+=40){
       line(0,i,560,i);
     }
  }
  else{setup();}//gonna need something less timeconsuming than this, like an abbreviated setup resetish thingy
}

void mouseClicked(){
  if(mouseY >= 575 && mouseY <= 635){
    drawgrid = true;
  }
  else{
    drawgrid = false;
  }
}
