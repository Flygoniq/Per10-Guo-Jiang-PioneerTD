import java.io.*;
import java.util.*;

double ghostx = 0;
double ghosty = 0;
PImage ghost;

void setX(double a){
   ghostx = a;
}

void setY(double a ) {
  ghosty = a;
}

double getX() {
  return ghostx;
}

double getY() {
  return ghosty;
}
void setImage(PImage n) {
  ghost = n;
}
PImage getImage() {
  return ghost;
}

