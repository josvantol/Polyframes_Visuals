float[] TowerSrc;
float[] TowerDest;
int Amount = 5;
float Lerp = 0.0f;

float Clamp(float Value)
{
  if (Value > 1.0f) Value = 1.0f;
  else if (Value < 0.0) Value = 0.0f;
  return Value;
}

float Lerp(float A, float t, float B)
{
  return (1.0f - t) * A + t * B;
}

float Smoothstep(float A, float t, float B)
{
  t = t * t * (3 - 2 * t);
  return (1.0f - t) * A + t * B;
}

float Smootherstep(float A, float t, float B)
{
  t = t * t * t * (t * (t * 6 - 15) + 10);
  return (1.0f - t) * A + t * B;
}

void setup()
{
  size(960, 540);
  frameRate(30);
  
  TowerSrc = new float[Amount]; //<>//
  TowerDest = new float[Amount];
  for (int i = 0; i < Amount; i++)
  {
    TowerSrc[i] = -random(height/4, height);
    TowerDest[i] = -random(height/4, height);
  }
}

void draw()
{
  Lerp += 1.0 / (55.4 * 2.0);
  
  background(9, 31, 59);
  fill(225, 0, 49);
  stroke(10, 73, 125);
  
  for (int i = 0; i < Amount; i++)
  {
    rect(i*(width/Amount), height, width/Amount, Smoothstep(TowerSrc[i], Lerp, TowerDest[i]));
  }
  
  if (Lerp >= 1.0f)
  {
    for (int i = 0; i < Amount; i++)
    {
      TowerSrc[i] = TowerDest[i];
      TowerDest[i] = -random(height/4, height);
    }
    Lerp = 0.0f;
  }
  
  //if (frameCount < 30*75)
  //{
  //  saveFrame();
  //}
  //else
  //{
  //  exit();
  //}
}
