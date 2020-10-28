float Speed = 20.0;
int XAmount = 20;
int YAmount = 7;
PVector[][] Coord;

void setup()
{
  size(1280, 720);
  frameRate(30);
  
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
  stroke(0xFFFFFFFF);
  strokeWeight(5);
  
  int Counter = 0;
  
  for (int YIndex = 0; YIndex < YAmount; YIndex++)
  {
    for (int XIndex = 0; XIndex < XAmount; XIndex++)
    {
      // DEBUG DRAW
      point(Coord[YIndex][XIndex].x * width, Coord[YIndex][XIndex].y * height);
      text(Counter, Coord[YIndex][XIndex].x * width + 5, Coord[YIndex][XIndex].y * height + 10);
      Counter++;
      
      // RELEASE DRAW
      //Coord[YIndex][XIndex].x += 1.0 / (frameRate * Speed);
      //if (Coord[YIndex][XIndex].x > 1.0) Coord[YIndex][XIndex].x -= 1.0;
      //point(EaseOutInSqrt(-width*0.25, Coord[YIndex][XIndex].x, width*1.25), Coord[YIndex][XIndex].y * height);
    }
  }
}
