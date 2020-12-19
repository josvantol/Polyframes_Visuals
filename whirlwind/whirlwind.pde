//int Spirals = 23;
//int VertexCount = 150;
//float RadiusIncrease = 1.024;
//float StartRadius;
float MaxRadius;

PShape Whirl;

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

void setup()
{
  size(1280, 720);
  //fullScreen();
  frameRate(30);
  
  //StartRadius = height/10.0;
  MaxRadius = dist(0, 0, width/2, height/2);
  
  Whirl = loadShape("whirlwind.svg");
  Whirl.disableStyle();
}

void draw()
{
  translate(width/2, height/2);
  background(A);
  noStroke();
  fill(B);
  
  //for (int SpiralIndex = 0; SpiralIndex < Spirals; SpiralIndex++)
  //{
  //  int VertexIndex = 0;
  //  float Radius = StartRadius;
  //  beginShape();
  //  while (Radius < MaxRadius)
  //  {
  //    float X = Radius * cos(TAU/VertexCount*VertexIndex);
  //    float Y = Radius * sin(TAU/VertexCount*VertexIndex);
  //    vertex(X-StartRadius, Y);
  //    Radius *= RadiusIncrease;
  //    VertexIndex++;
  //  }
  //  endShape();
  
  //  rotate(TAU/Spirals);
  //}
  
  rotate(frameCount/100.0);
  shape(Whirl, -MaxRadius-15, -MaxRadius-15, MaxRadius*2+30, MaxRadius*2+30);
  
  //if (frameCount < 15*30)
  //{
  //  saveFrame();
  //}
  //else
  //{
  //  exit();
  //}
}
