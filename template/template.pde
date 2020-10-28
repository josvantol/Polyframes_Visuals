void setup()
{
  size(1280, 720);
  //surface.setLocation(0, 0);
  frameRate(30);
}

void draw()
{
  background(0xFF000000);
  stroke(0xFFFFFFFF);
  strokeWeight(5);
  translate(0, height);
  
  float x = 0.0;
  while (x < 1.0)
  {
    point(x * width, EaseOutInSqrt(0.0, x, -height));
    x += 1.0/100.0;
  }
}
