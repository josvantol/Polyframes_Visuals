float Lerp = 0.0;

float TheFunction(float X)
{
  float Result;

  // easeOutInSine
  //X *= 2.0;
  //if (X < 1.0)
  //{
  //  Result = 0.5 * (sin((X*PI) / 2.0));
  //}
  //else
  //{
  //  Result = 0.5 * (1 - cos(((X-1.0) * PI) / 2)) + 0.5;
  //}
  
  // easeOutInCubic
  X *= 2.0;
  if (X < 1.0)
  {
    Result = 0.5 * (1 - pow(1 - X, 3));
  }
  else
  {
    Result = 0.5 * ((X - 1.0)*(X - 1.0)*(X - 1.0)) + 0.5;
  }

  return Result;
}

void setup()
{
  //size(1280, 720);
  size(640, 360);
  frameRate(30);
  //surface.setLocation(0, 0);
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
    float X = TheFunction(L) * width;
    line(X, 0, X, height);
  }
  
  // MOVER
  Lerp += 1.0 / (30.0 * 5.0);
  if (Lerp > 1.0) Lerp -= 1.0;
  stroke(0xFFFF0000);
  strokeWeight(5);
  point(TheFunction(Lerp) * width, height/2 + 5);
}
