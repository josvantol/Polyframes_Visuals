void patternA(float x, float y, float s, float r, color c)
{
  push();
  translate(x, y);
  rotate(r);
  
  noStroke();
  fill(c);
  for (int i = 0; i < 5; i++)
  {
    ellipse(0, -50*s, 50*s, 20*s);
    ellipse(0, -35*s, 40*s, 15*s);
    ellipse(0, -25*s, 30*s, 10*s);
    ellipse(0, -17*s, 20*s, 8*s);
    ellipse(0, -12*s, 10*s, 5*s);
    rotate(TWO_PI/5);
  }
  pop();
}

void patternB(float x, float y, float scale, float r, color c)
{
  push();
  translate(x, y);
  rotate(r);
  
  PShape s;
  s = createShape();
  s.beginShape();
  s.fill(c);
  s.noStroke();
  s.vertex(0, 0);
  s.vertex(-10*scale, -20*scale);
  s.vertex(0, -40*scale);
  s.vertex(5*scale, -30*scale);
  s.vertex(7*scale, -15*scale);
  s.endShape(CLOSE);
  
  noStroke();
  fill(c);
  for (int i = 0; i < 14; i++)
  {
    ellipse(0, -10*scale, 10*scale, 20*scale);
    shape(s, 0, -20*scale);
    rotate(TWO_PI/14);
  }
  pop();
}

void patternC(float x, float y, float s, float r, color c)
{
  push();
  translate(x, y);
  rotate(r);
  noStroke();
  fill(c);
  
  rect(-25*s, -25*s, 50*s, 50*s);
  for (int i = 0; i < 4; i++)
  {
    triangle(25*s, -35*s, 25*s, -60*s, -60*s, -35*s);
    rotate(TWO_PI/4);
  }
  
  pop();
}

void patternD(float x, float y, float s, float r, color c)
{
  push();
  translate(x, y);
  rotate(r);
  noStroke();
  fill(c);
  
  for (int i = 0; i < 6; i++)
  {
    rect(-1*s, -5*s, 2*s, -25*s);
    triangle(-5*s, -35*s, 0, -55*s, 5*s, -35*s);
    ellipse(0, -45*s, 10*s, 5*s);
    ellipse(0, -50*s, 8*s, 4*s);
    rotate(TWO_PI/12);
    quad(0, -15*s, -5*s, -25*s, 0*s, -35*s, 5*s, -25*s);
    triangle(0, -40*s, 10*s, -25*s, 0, -50*s);
    triangle(0, -40*s, -10*s, -25*s, 0, -50*s);
    triangle(5*s, -50*s, 3*s, -35*s, 8*s, -30*s);
    triangle(-5*s, -50*s, -3*s, -35*s, -8*s, -30*s);
    rotate(TWO_PI/12);
  }
  
  pop();
}

void patternE(float x, float y, float s, float r, color c1, color c2)
{
  push();
  translate(x, y);
  noFill();
  strokeCap(SQUARE);
  
  stroke(c1);
  strokeWeight(25*s);
  arc(0, 0, 110*s, 110*s, 0+r, TAU*0.65+r);
  
  stroke(c2);
  strokeWeight(15*s);
  arc(0, 0, 60*s, 60*s, 0-r, TAU*0.65-r);
  
  pop();
}
