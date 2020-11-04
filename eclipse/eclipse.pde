void setup()
{
  size(960, 540);
  frameRate(30);
}

float t = 0.0;
float Speed = 20.0;

void draw()
{
  background(0xFF000000);
  fill(0xFFFFFFFF);
  noStroke();
  translate(width/2, height*2);
  
  t += 1.0 / (30.0 * Speed);
  t = Clamp(t);
  
  float x1 = height*1.5 * sin(Lerp(-0.25*PI, t, 0));
  float y1 = height*1.5 * cos(Lerp(0.75*PI, t, PI));
  float x2 = height*1.5 * sin(Lerp(-0.15*PI, t, 0));
  float y2 = height*1.5 * cos(Lerp(0.85*PI, t, PI));
  
  circle(x1, y1, Lerp(0.5, t, 1.0)*height*0.5);
  fill(0xFF000000);
  circle(x2, y2, Lerp(0.5, t, 1.0)*height*0.49);
  
  strokeWeight(1);
  stroke(0xFFFF0000);
  line(0, 0, x1, y1);
  stroke(0xFF00FF00);
  line(0, 0, x2, y2);
}

void mouseReleased()
{
  saveFrame("eclipse.jpg");
}
