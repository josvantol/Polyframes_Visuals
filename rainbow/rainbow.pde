float lerp_wobble = 0.0;
float wobble = 0.0;
float lerp_show = 0.0;
float show = 0.0;
float direction = 1.0;

float lerp_trip;

color[] Colors;

void setup()
{
  size(960,540);
  frameRate(30);
  
  Colors = new color[3];
  Colors[0] = color(0x8000FDFF);
  Colors[1] = color(0x80FF00FB);
  Colors[2] = color(0x80FEFF00);
}

int Hue;

void draw()
{
  background(0xFFFFD8FE);
  noFill();
  
  colorMode(HSB, 360, 100, 100, 255);
  noStroke();
  if (frameCount > 30 * 5) lerp_trip += 1.0 / (30.0 * 10.0);
  if (lerp_trip > 1.0) lerp_trip = 1.0;
  else if (lerp_trip < 0.0) lerp_trip = 0.0;
  fill(Hue%360, 100, 100, lerp_trip * 128.0);
  Hue += 3;
  rect(0, 0, width, height);
  noFill();
  colorMode(RGB, 255);
  
  strokeWeight(20);
  translate(width/2, height+50);
  
  
  
  float Angle;
  
  float t = 0.0f;
  
  if (frameCount > 30 * 5) lerp_wobble += 1.0 / (30.0 * 45.0);
  if (lerp_wobble > 1.0) lerp_wobble = 1.0;
  else if (lerp_wobble < 0.0) lerp_wobble = 0.0;
  wobble = lerp_wobble * 20.0f;
  
  lerp_show += 1.0 / (30.0 * 5.0);
  if (lerp_show > 1.0) lerp_show = 1.0;
  else if (lerp_show < 0.0) lerp_show = 0.0;
  show = lerp_show * TAU/2 + TAU/2;
  
  rotate(show);
  
  stroke(Colors[0]); // CYAN
  beginShape();
  for (Angle = TAU/2; Angle < TAU; Angle += TAU/80.0f)
  {
    float Radius = height*1.0 + (noise(t) * 2.0f - 1.0f) * wobble;
    Radius += noise(frameCount) * 7.0 * lerp_wobble;
    float X = Radius * cos(Angle);
    float Y = Radius * sin(Angle);
    curveVertex(X, Y); //<>//
    t += 0.5f;
  }
  endShape();
  
  stroke(Colors[1]); // MAGENTA
  beginShape();
  for (Angle = TAU/2; Angle < TAU; Angle += TAU/80.0f)
  {
    float Radius = height*1.0-20.0f + (noise(t) * 2.0f - 1.0f) * wobble/2.0;
    Radius += noise(frameCount + 1) * 7.0 * lerp_wobble;
    float X = Radius * cos(Angle);
    float Y = Radius * sin(Angle);
    curveVertex(X, Y);
    t += 0.5f;
  }
  endShape();
  
  stroke(Colors[2]); // YELLOW
  beginShape();
  for (Angle = TAU/2; Angle < TAU; Angle += TAU/80.0f)
  {
    float Radius = height*1.0-40.0f + (noise(t) * 2.0f - 1.0f) * wobble*2.0;
    Radius += noise(frameCount + 2) * 7.0 * lerp_wobble;
    float X = Radius * cos(Angle);
    float Y = Radius * sin(Angle);
    curveVertex(X, Y);
    t += 0.5f;
  }
  endShape();
  
  rotate(-show);
  
  //if (frameCount < 30*(50+60))
  //{
  //  saveFrame();
  //}
  //else
  //{
  //  exit();
  //}
}
