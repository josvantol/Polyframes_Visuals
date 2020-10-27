class v2
{
  float x;
  float y;
  
  v2(float _x, float _y)
  {
    x = _x;
    y = _y;
  }
};

class circle
{
  v2 position;
  float size;
  color col;
  float velocity;
  float acceleration;
  
  circle(float _x, float _y)
  {
    position = new v2(_x, _y);
  }
  
  void draw()
  {
    noStroke();
    fill(col);
    circle(position.x, position.y, size);
  }
};

circle[] Star;
int Amount = 500;

void setup()
{
  size(960, 540);
  frameRate(30);
  
  Star = new circle[Amount];
  for (int StarIndex = 0; StarIndex < Amount; StarIndex++)
  {
    Star[StarIndex] = new circle(random(width), random(height));
    Star[StarIndex].col = 0xFFFFFFFF;
    Star[StarIndex].acceleration = random(1.01, 1.013);
    Star[StarIndex].velocity = random(0.5, 0.75);
  }
}

void draw()
{  
  for (int StarIndex = 0; StarIndex < Amount; StarIndex++)
  {
    if (Star[StarIndex].position.y >= height)
    {
      Star[StarIndex].position.y = 0;
      Star[StarIndex].velocity = 1.0f;
    }
    else
    {
      Star[StarIndex].velocity *= Star[StarIndex].acceleration;
      Star[StarIndex].position.y += Star[StarIndex].velocity;
    }
    
    Star[StarIndex].size = (Star[StarIndex].position.y / (float)height) * 7.0 + 4.0;
  }
  
  background(9, 31, 59);
  for (int StarIndex = 0; StarIndex < Amount; StarIndex++)
  {
    Star[StarIndex].draw();
  }
  
  for (int LineIndex = height; LineIndex > height/2; LineIndex--)
  {
    float A = 255.0 - ((height - LineIndex) / (float)(height/2)) * 255.0;
    stroke(A,A,A,A);
    line(0, LineIndex, width, LineIndex);
  }
  
  //if (frameCount < 30 * 60)
  //{
  //  saveFrame();
  //}
  //else
  //{
  //  exit();
  //}
}
