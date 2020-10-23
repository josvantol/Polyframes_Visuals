void setup()
{
  size(350, 700);
  frameRate(30);
  surface.setLocation(0, 0);
}

void draw()
{
  background(0xFF000000);
  
  translate(width/2, height/4);
  noStroke();
  
  fill(0x55FF0000);
  float x = 50 * cos(TAU/12*7);
  float y = 50 * sin(TAU/12*7);
  circle(x, y, 150);
  fill(0x5500FF00);
  x = 50 * cos(TAU/12*11);
  y = 50 * sin(TAU/12*11);
  circle(x, y, 150);
  fill(0x550000FF);
  x = 50 * cos(TAU/12*3);
  y = 50 * sin(TAU/12*3);
  circle(x, y, 150);
  
  translate(0, height/2);
  
  fill(0x5500FFFF);
  x = 50 * cos(TAU/12*7);
  y = 50 * sin(TAU/12*7);
  circle(x, y, 150);
  fill(0x55FF00FF);
  x = 50 * cos(TAU/12*11);
  y = 50 * sin(TAU/12*11);
  circle(x, y, 150);
  fill(0x55FFFF00);
  x = 50 * cos(TAU/12*3);
  y = 50 * sin(TAU/12*3);
  circle(x, y, 150);
}
