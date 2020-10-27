void setup()
{
  size(960, 540);
  frameRate(30);
}

void draw()
{
  background(0);
  stroke(0);
  fill(255);
  strokeWeight(2);
  
  float w = width/4;
  float h = height/2;
  
  int num = frameCount/7;
  
  switch (num)
  {
    case 8:
    {
      exit();
    }
    case 7:
    {
      rect(0, 0, w, h);
    }
    case 6:
    {
      rect(w, 0, w, h);
    }
    case 5:
    {
      rect(2*w, 0, w, h);
    }
    case 4:
    {
      rect(3*w, 0, w, h);
    }
    case 3:
    {
      rect(0, h, w, h);
    }
    case 2:
    {
      rect(w, h, w, h);
    }
    case 1:
    {
      rect(2*w, h, w, h);
    }
    case 0:
    {
      rect(3*w, h, w, h);
    }
  }
}
