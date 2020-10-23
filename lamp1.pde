float Easing(float Lerp)
{
  float Result;
  // easeInOutSine
  //Result =  -(cos(PI * Lerp) - 1) / 2;
  
  // easeInOutCubic
  if (Lerp < 0.5)
  {
    Result =  4 * Lerp * Lerp * Lerp;
  }
  else
  {
    Result =  1 - pow(-2 * Lerp + 2, 3) / 2;
  }
  
  return Result;
}

int Amount = 64;
float[] A;
PVector[] B;

void setup()
{
  //size(1280, 720);
  size(640, 360);
  frameRate(30);
  //surface.setLocation(0, 0);
  
  A = new float[Amount];
  B = new PVector[Amount];
  for (int i = 0; i < Amount; i++)
  {
    A[i] = 1.0/Amount*i;
    B[i] = new PVector(A[i] * width, 0);
  }
}

void draw()
{
  background(0xFF000000);
  noStroke();
  fill(0xFFFF4400);
  
  for (int i = 0; i < Amount; i++)
  {
    A[i] += 1.0 / (30.0 * 40.0);
    if (A[i] > 1.0)
    {
      A[i] -= 1.0;
    }
    B[i].x = Easing(A[i]) * width;
    point(B[i].x, B[i].y);
  }
  
  for (int i = 0; i < Amount; i += 2)
  {
    float w = B[i+1].x - B[i].x;
    float h = height/7.0;
    float Y = 0.0;
    for (int j = 0; j < 4; j++)
    {
      if (w > 0)
      {
        rect(B[i].x, B[i].y + Y, w, h);
      }
      Y += 2*h;
    }
  }
  
  for (int i = 1; i < Amount - 1; i += 2)
  {
    float w = B[i+1].x - B[i].x;
    float h = height/7.0;
    float Y = h;
    for (int j = 0; j < 3; j++)
    {
      if (w > 0)
      {
        rect(B[i].x, B[i].y + Y, w, h);
      }
      Y += 2*h;
    }
  }
  
  float w = B[0].x - B[Amount-1].x;
  float h = height/7.0;
  float Y = h;
  for (int j = 0; j < 3; j++)
  {
    if (w > 0)
    {
      rect(B[Amount-1].x, B[Amount-1].y + Y, w, h);
    }
    Y += 2*h;
  }
  
  filter(BLUR, 2);
  
  //if (frameCount < 30 * 5)
  //{
  //  saveFrame();
  //}
  //else
  //{
  //  exit();
  //} //<>//
}
