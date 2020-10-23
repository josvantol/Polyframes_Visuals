//int Spirals = 23;
//int VertexCount = 150;
//float RadiusIncrease = 1.024;
//float StartRadius;
float MaxRadius;

PShape Whirl;

void setup()
{
  //size(1280, 720);
  //surface.setLocation(0, 0);
  fullScreen();
  frameRate(30);
  
  //StartRadius = height/10.0;
  MaxRadius = dist(0, 0, width/2, height/2);
  
  Whirl = loadShape("whirlwind.svg");
  Whirl.disableStyle();
}

void draw()
{
  translate(width/2, height/2);
  background(0xFF808000);
  noStroke();
  fill(0xFF800000);
  
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
}
