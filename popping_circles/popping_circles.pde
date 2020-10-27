Pop[] Pops;

void setup()
{
  size(960, 540);
  frameRate(30);
  
  Pops = new Pop[8];
  for (int i = 0; i < Pops.length; i++)
  {
    Pops[i] = new Pop();
  }
}

void draw()
{
  background(0xFF000000);
  
  for (int i = 0; i < Pops.length; i++)
  {
    if (Pops[i].S == State.DEAD)
    {
      Pops[i] = new Pop();
    }
    Pops[i].update();
    Pops[i].draw();
  }
  
  //if (frameCount < 12*30)
  //{
  //  saveFrame();
  //}
  //else
  //{
  //  exit();
  //} //<>//
}

void keyReleased()
{
  for (int i = 0; i < Pops.length; i++)
  {
    Pops[i] = new Pop();
  }
}
