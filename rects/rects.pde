class Rect
{
  float w, h, lerp;
  color c;
  
  Rect(float init)
  {
    lerp = init;
    w = (1.0f - lerp) * ((width/Amount*2) + width);
    h = (1.0f - lerp) * ((height/Amount*2) + height);
  }
  
  void draw()
  {
    fill(c);
    noStroke();
    rect(0, 0, w, h);
    
    lerp += (1.0f/30.0f) / 10.0f;
    lerp = Clamp(lerp);
    
    w = (1.0f - lerp) * ((width/Amount*2) + width);
    h = (1.0f - lerp) * ((height/Amount*2) + height);
  }
};

Rect[] Rects;
Rect[] Temp;
color[] Colors;
int Amount = 20;

float Clamp(float Value)
{
  if (Value > 1.0f) Value = 1.0f;
  else if (Value < 0.0) Value = 0.0f;
  return Value;
}

void setup()
{
  size(960, 540);
  frameRate(30);
  
  Colors = new color[3];
  Colors[0] = color(9, 31, 59);
  Colors[1] = color(10, 73, 125);
  //Colors[2] = color(225, 0, 49);
  Colors[2] = color(0xFF00FF00);
  
  Rects = new Rect[Amount];
  for (int i = 0; i < Amount; i++)
  {
    Rects[i] = new Rect(i * (1.0f/Amount));
    Rects[i].c = Colors[2*(i%2)];
  }
}

void draw()
{
  background(0); //<>//
  translate(width/2, height/2);
  rectMode(CENTER);
  
  for (int i = 0; i < Amount; i++)
  {
    Rects[i].draw();
    if (Rects[i].lerp == 1.0f)
    {
      Rects[i].lerp = 0.0f;
      
      Temp = new Rect[Amount];
      arrayCopy(Rects, Temp);
      Rects[0] = Temp[Amount-1];
      for (int j = 1; j < Amount; j++)
      {
        Rects[j] = Temp[j-1];
      }
    }
  }
  
  //if (frameCount < 30*30)
  //{
  //  saveFrame();
  //}
  //else
  //{
  //  exit();
  //}
}
