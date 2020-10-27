class planet
{
  float Position;
  int Size;
  float Speed;
  int Color;
  
  planet()
  {
    Size = (int)random(100, height*0.75);
    Color = (int)random(7);
    int Direction = (int)random(2)*2-1;
    Speed = Size/200.0f * Direction;
    if (Speed > 0.0f)
    {
      Position = -Size/2;
    }
    else
    {
      Position = width + Size/2;
    }
  }
}

planet[] Planets;
int Amount = 7;
color[] Colors;

void setup()
{
  size(960, 540);
  frameRate(30);
  Planets = new planet[Amount];
  for (int Index = 0; Index < Amount; Index++)
  {
    Planets[Index] = new planet();
    Planets[Index].Position = random(width);
  }
  
  Colors = new color[7];
  Colors[0] = 0xFFEFEFEF;
  Colors[1] = 0xFFFF2020;
  Colors[2] = 0xFF20FF20;
  Colors[3] = 0xFF2020FF;
  Colors[4] = 0xFF20FFFF;
  Colors[5] = 0xFFFF20FF;
  Colors[6] = 0xFFFFFF20;
}

void draw()
{
  for (int Index = 0; Index < Amount; Index++)
  {
    Planets[Index].Position += Planets[Index].Speed;
    if (Planets[Index].Position <= -Planets[Index].Size || Planets[Index].Position >= width+Planets[Index].Size)
    {
      Planets[Index] = new planet();
    }
  }
  
  background(0xFF000000);
  
  for (int LineIndex = height; LineIndex > height/2; LineIndex--)
  {
    float A = 255.0 - ((height - LineIndex) / (float)(height/2)) * 255.0;
    stroke(A,A,A,A);
    line(0, LineIndex, width, LineIndex);
  }
  
  int Search = 0;
  int Found = 0;
  
  while (Found < Amount)
  {
    for (int Index = 0; Index < Amount; Index++)
    {
      if (Search == Planets[Index].Size)
      {
        fill(Colors[Planets[Index].Color], 255*0.65);
        circle(Planets[Index].Position, height/2, Planets[Index].Size);
        Found++;
      }
    }
    Search++;
  }
  
  //if (frameCount < 30*60*5)
  //{
  //  saveFrame();
  //}
  //else
  //{
  //  exit();
  //}
}
