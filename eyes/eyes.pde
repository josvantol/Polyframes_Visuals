class eye
{
  PShape SVG;
  float w;
  float h;
  
  color[] Colors;
  
  eye(float _w)
  {
    SVG = loadShape("eye.svg");
    Colors = new color[3];
    SVG.disableStyle();
    w = _w;
    h = w/2;
    Colors[0] = color(10, 73, 125);
    Colors[1] = color(22, 58, 104);
    Colors[2] = color(207, 18, 59);
  }
  
  void draw(float x, float y, int c)
  {
    noStroke();
    fill(Colors[c]);
    circle(x, y, h);
    fill(0xFFFFFFFF);
    shape(SVG, x-w/2, y-h/2, w, h);
  }
};

float x = 0;
float y = 0;
int c = 0;
eye Eye;
int Amount = 10;

float ScaleStart = 1.0;
float ScaleEnd = 4.0;
float Lerp;
float Scale;

void setup()
{
  size(960,540);
  frameRate(30);
  Eye = new eye(width/Amount);
}

void draw()
{
  float Smooth = Lerp * Lerp * Lerp;
  Scale = (1.0 - Smooth) * ScaleStart + Smooth * ScaleEnd;
  Lerp += 1.0 / (30.0*240.0);
  Lerp = constrain(Lerp, 0.0, 1.0);
  
  translate(width/2, height/2);
  scale(Scale);
  
  if (frameCount%20 == 0)
  {
    c++;
  }
  float Xorig = 10*sin(frameCount/TWO_PI/2.0);
  float Yorig = 10*cos(frameCount/TWO_PI/2.0);
  
  background(0xFF000000);
  
  int ci = 0;
  y = Yorig - height/2;
  for (int i = 0; i < Amount*2; i++)
  {
    x = Xorig - width/2;
    for (int j = 0; j < Amount+1; j++)
    {
      Eye.draw(x, y, (c+ci)%3);
      x += Eye.w;
      ci++;
    }
    y += Eye.w/2;
  }
  
  //if (frameCount < (30.0*330.0))
  //{
  //  saveFrame();
  //}
  //else
  //{
  //  exit();
  //}
}
