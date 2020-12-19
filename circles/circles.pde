float MaxRadiusMargin = 1.23;

// Nick Mason
//color A = 0xFFE8E3C5;
//color B = 0xFF97B18F;

// Artwork 1
//color A = 0xFFF2E32E;
//color B = 0xFFC26302;

// Artwork 2
//color A = 0xFF874B72;
//color B = 0xFFD80441;

// Artwork 3
//color A = 0xFFCF0503;
//color B = 0xFF000000;

// Artwork 4
color A = 0xFFAEB2AE;
color B = 0xFFC7CC33;

class Circle
{
  float Radius, MaxRadius, Lerp;
  int Color;
  boolean Reset = false;
  
  Circle(float init, int Index)
  {
    Color = Index % 2;
    Lerp = init;
    MaxRadius = MaxRadiusMargin * dist(0, 0, width, height);
  }
  
  void update(float Value)
  {
    Lerp += Value;
    Radius = EaseInQuad(0.0, Lerp, MaxRadius);
  }
  
  void render()
  {
    noStroke();
    if (boolean(Color))
    {
      fill(A);
    }
    else
    {
      fill(B);
    }
    ellipseMode(CENTER);
    circle(width/2.0, height/2.0, Radius);
  }
};

Circle[] Circles;
int Amount = 10; // Preferably EVEN
float Speed = 15.0;

void setup()
{
  size(1280, 720);
  //fullScreen();
  frameRate(30);
  
  Circles = new Circle[Amount];
  for (int Index = 0; Index < Amount; Index++)
  {
    Circles[Index] = new Circle(1.0/Amount*Index, Index);
  }
}

void draw()
{
  background(0xFF000000);
  for (Circle C : Circles) 
  {
    if (C.Lerp > 1.0)
    {
      C.Lerp -= 1.0;
      
      Circle[] Temp = new Circle[Amount];
      arrayCopy(Circles, Temp);
      Circles[0] = C;
      for (int i = 1; i < Amount; i++)
      {
        Circles[i] = Temp [i-1];
      }
    }
    C.update(1.0 / (30.0 * Speed));
  }
  
  for (int Index = Amount; Index > 0; Index--)
  {
    Circles[Index-1].render();
  }
  
  if (frameCount < 15*30)
  {
    saveFrame();
  }
  else
  {
    exit();
  }
}
