float X = 0.0;

void setup()
{
  size(1280, 720);
  frameRate(30);
}

void draw()
{
  background(0xFF000000);
  noFill();
  
  // GRID
  int Amount = 32;
  float L = 0.0;
  stroke(0xFF404040);
  strokeWeight(1);
  for (int i = 0; i < Amount; i++)
  {
    L = 1.0/(float)Amount*i;
    float XL = EaseOutInSqrt(0, L, width);
    line(XL, 0, XL, height);
  }
  
  // MOVER
  X += 1.0 / (30.0 * 5.0);
  if (X > 1.0) X -= 1.0;
  stroke(0xFFFF0000);
  strokeWeight(5);
  point(EaseOutInSqrt(0, X, width), height/2 + 5);
}
