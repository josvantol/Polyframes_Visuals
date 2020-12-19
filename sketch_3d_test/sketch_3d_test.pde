void setup()
{
  size(960, 540, P3D);
  frameRate(30);
  surface.setLocation(displayWidth-width, displayHeight-height-30);
}

void draw()
{
  background(0xFF000000);
  translate(width/2, height/2);
  
  stroke(0xFFFFFFFF);
  noFill();
  
  beginShape();
  int Steps = 12;
  for (int i = 0; i < Steps; i++)
  {
    float x = height/3.0 * cos(TWO_PI/Steps*i - HALF_PI);
    float y = height/3.0 * sin(TWO_PI/Steps*i - HALF_PI);
    vertex(x, y, 0);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < Steps; i++)
  {
    float x = height/3.0 * cos(TWO_PI/Steps*i - HALF_PI);
    float y = height/3.0 * sin(TWO_PI/Steps*i - HALF_PI);
    vertex(x, y, 50);
  }
  endShape(CLOSE);
}
