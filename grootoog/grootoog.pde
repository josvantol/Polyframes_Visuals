PShape Mask;

float Lerp;

int State=0;

void setup()
{
  size(1280, 720);
  frameRate(30);
  
  Mask = loadShape("mask.svg");
}

void draw()
{
  background(0xFFFFFFFF);
  
  noStroke();
  fill(0xFF00376D);
  
  float PosX = 0, PosY = 253, W = 0, H = 410;
  
  // width/2 + EaseInOutSine(0, Lerp, 150)
  // 253
  // 410 - EaseInOutSine(0, Lerp, 20)
  // 410
  if (Lerp >= 0.0 && Lerp < 1.0)
  {
    PosX = width/2 + EaseInOutSine(0, Lerp, 150);
  }
  else if (Lerp >= 1.0 && Lerp < 3.0)
  {
    PosX = width/2 + EaseInOutSine(150, (Lerp-1.0)/2.0, -150);
  }
  else if (Lerp >= 3.0 && Lerp < 4.0)
  {
    PosX = width/2 + EaseInOutSine(-150, Lerp-3.0, 0);
  }
  
  if (Lerp >= 0.0 && Lerp < 1.0)
  {
    W = 410 - EaseInOutSine(0, Lerp, 20);
  }
  else if (Lerp >= 1.0 && Lerp < 2.0)
  {
    W = 410 - EaseInOutSine(20, Lerp-1.0, 0);
  }
  else if (Lerp >= 2.0 && Lerp < 3.0)
  {
    W = 410 - EaseInOutSine(0, Lerp-2.0, 20);
  }
  else if (Lerp >= 3.0 && Lerp < 4.0)
  {
    W = 410 - EaseInOutSine(20, Lerp-3.0, 0);
  }
  ellipse(PosX, PosY, W, H);
  shape(Mask, 0, 0, width, height);
  
  Lerp += 1.0 / 30.0;
  if (Lerp >= 4.0) exit();
  
  
}
