float Lerp;

void setup()
{
  size(1280, 720);
  frameRate(30);
}

void draw()
{
  Lerp += 1.0f / (30.0 * 180.0);
  //Lerp += 1.0f / (30.0 * 60.0);
  
  if (Lerp > 1.0f) Lerp = 1.0f;
  else if (Lerp < 0.0f) Lerp = 0.0f;

  if (Lerp == 1.0f) exit();
  
  float Speed = (1.0f - Lerp) * 40.0f + Lerp * 30.0f;
  float Amplitude = (1.0f - Lerp) * 30.0f + Lerp * 150.0f;
  //float Speed = (1.0f - Lerp) * 30.0f + Lerp * 40.0f;
  //float Amplitude = (1.0f - Lerp) * 150.0f + Lerp * 30.0f;
  
  float Sine = Amplitude * sin(frameCount/Speed);
  
  background(10, 73, 125);
  noStroke();
  fill(0xFFFFC400);
  circle(width/2, height*2/3, height*1.1f + Sine);
  fill(207*(Lerp/2.0 + 0.5), 18*(Lerp/2.0 + 0.5), 59*(Lerp/2.0 + 0.5));
  circle(width/2, height*2/3, height*1.0f + Sine);
}
