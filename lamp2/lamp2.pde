float Speed = 20.0;
float Bleed = 0.27;
float Margin = 0.05;
int XAmount = 16;
int YAmount = 7;
color Color = #FF4000;
boolean Record = false;

PVector[][] Coord;

void setup()
{
  size(640, 360);
  //fullScreen();
  frameRate(30);
  
  if (IsOdd(XAmount))
  {
    println("XAmount has to be EVEN.");
    exit();
  }
  
  Coord = new PVector[YAmount][XAmount];
  for (int YIndex = 0; YIndex < YAmount; YIndex++)
  {
    for (int XIndex = 0; XIndex < XAmount; XIndex++)
    {
      Coord[YIndex][XIndex] = new PVector(1.0/XAmount*XIndex, 1.0/YAmount*YIndex);
    }
  }
}

void draw()
{
  background(0xFF000000);
  noStroke();
  
  for (int YIndex = 0; YIndex < YAmount; YIndex++)
  {
    // Offset for strating at first or second X coord
    int Offset = YIndex % 2;
    for (int XIndex = 0; XIndex < XAmount; XIndex++)
    {
      // Lerp
      Coord[YIndex][XIndex].x += 1.0 / (30.0 * Speed);
      if (Coord[YIndex][XIndex].x > 1.0) Coord[YIndex][XIndex].x -= 1.0;
      
      // Draw Rects
      fill(Color);
      if((XIndex + Offset) % 2 == 0)
      {
        // Get base coord.
        float x = EaseOutInSqrt(-width*Bleed, Coord[YIndex][XIndex].x, width*(1.0+Bleed));
        float y = Coord[YIndex][XIndex].y * height;
        float NextX = 0.0;
        float NextY = 0.0;
        float h = 0.0;
        float w = 0.0;
        
        // Calc w/h with 'next' coord
        if (XIndex < XAmount-1 && YIndex < YAmount-1)
        {
          NextX = EaseOutInSqrt(-width*Bleed, Coord[YIndex][XIndex+1].x, width*(1.0+Bleed));
          NextY = Coord[YIndex+1][XIndex].y * height;
          w = NextX - x;
          h = NextY - y;
        }
        // special cases at 1.0/0.0 border
        else if (XIndex == XAmount-1)
        {
          NextX = EaseOutInSqrt(-width*Bleed, Coord[YIndex][0].x, width*(1.0+Bleed));
          NextY = Coord[YIndex+1][XIndex].y * height;
          w = NextX - x;
          h = NextY - y;
        }
        // special cases at bottom
        else if (YIndex == YAmount-1)
        {
          NextX = EaseOutInSqrt(-width*Bleed, Coord[YIndex][XIndex+1].x, width*(1.0+Bleed));
          NextY = height;
          w = NextX - x;
          h = NextY - y;
        }
        
        if (NextX > x)
        {
          // Add margins.
          float RealW = w * (1.0 - Margin);
          float RealH = h * (1.0 - Margin);
          y += (h - RealH) / 2.0;
          x += (w - RealW) / 2.0;
          
          rect(x, y, RealW, RealH);
        }
      }
    }
  }
  
  filter(BLUR, 2);
  
  if (Record)
  {
    if (frameCount < 30.0 * Speed) 
    {
      saveFrame();
    }
    else
    {
      exit();
    }
  }
}
