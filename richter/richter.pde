int Tinten = 16;

class Mover
{
  PVector P;
  float W, H;
  float C;
  PVector V;
  boolean Alive = false;
  
  Mover()
  {
    C = ((int)random(Tinten) * 255.0/(Tinten - 1));
    W = random(height/10, height/2);
    H = random(height/10, height/2);
    V = new PVector(random(-1, 1), random(-1, 1));
    V.mult(10.0);
    float X = random(-width/4, width + width/4);
    float Y = random(-height/4, height + height/4);
    int Choice = (int)random(2);
    switch (Choice)
    {
      case 0:
      {
        if (V.x > 0)
        {
          X = -W;
        }
        else if (V.x < 0)
        {
          X = width + W;
        }
        else
        {
          return;
        }
        break;
      }
      case 1:
      {
        if (V.y > 0)
        {
          Y = -H;
        }
        else if (V.y < 0)
        {
          Y = height + H;
        }
        else
        {
          return;
        }
        break;
      }
    }
    
    
    P = new PVector(X, Y);
    
    Alive = true;
  }
  
  void update()
  {
    if (P.x > width || P.x < -W || P.y > height || P.y < -H)
    {
      Alive = false;
    }
    P.add(V);
  }
  
  void draw()
  {
    noStroke();
    fill(C);
    rect(P.x, P.y, W, H);
  }
}

Mover[] M;

void setup()
{
  size(960, 540);
  frameRate(30);
  M = new Mover[100];
  for (int i = 0; i < M.length; i++)
  {
    M[i] = new Mover();
  }
  
}

void draw()
{
  background(0);
  
  for (int i = 0; i < M.length; i++)
  {
    if (M[i].Alive == false)
    {
      M[i] = new Mover();
    }
    M[i].update();
    M[i].draw();
  }
  
  //if (frameCount < 30*70)
  //{
  //  saveFrame();
  //}
  //else
  //{
  //  exit();
  //}
}
