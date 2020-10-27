color[] Colors; //<>//
float x = 0.0f;
float y = 0.0f;
float r = 0.0f;

float Lerp;

void setup()
{
  size(960, 540);
  frameRate(30);

  Colors = new color[3];
  Colors[0] = color(9, 31, 59);
  Colors[1] = color(10, 73, 125);
  Colors[2] = color(225, 0, 49);
}

void draw()
{
  if (frameCount < 27*30)
  {
    Lerp += 1.0/90.0;
  }
  else
  {
    Lerp -= 1.0/90.0;
  }
  Lerp = constrain(Lerp, 0.0, 1.0);

  background(0xFF000000);
  translate(width/2, height/2);

  x = width*0.285 * cos(frameCount/100.0f);
  y = height*0.12 * sin(frameCount/50.0f);
  patternD(x, y, 3.0f*Lerp, frameCount/35.0f, 0xFFFF0000);

  x = width/4 + width*0.14 * sin(frameCount/40.0f);
  y = height*0.3 * cos(frameCount/80.0f);
  patternB(x, y, 1.5f*Lerp, frameCount/25.0f, 0xFF00FF00);

  x = -width/4 + width*0.14 * -sin(frameCount/40.0f);
  y = height*0.3 * cos(frameCount/80.0f);
  patternC(x, y, 1.5f*Lerp, -frameCount/25.0f, 0xFF0000FF);

  x = width*0.285 * -sin(frameCount/45.0f + 2.3f);
  y = height*0.12 * -cos(frameCount/90.0f);
  patternA(x, y, 1.8f*Lerp, -frameCount/35.0f, 0xFFFFFF00);
}
