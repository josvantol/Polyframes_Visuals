enum State
{
  DEAD, 
  GROW, 
  SHRINK
};

class Pop
{
  float X;
  float Y;
  float R;
  float T;
  State S;
  int Life;
  int D;
  float sec;
  float Smooth;
  
  Pop()
  {
    Life = frameCount;
    D = (int)random(90.0);
    R = random(100.0, 200.0);
    X = random(R/2.0, width - R/2.0);
    Y = random(R/2.0, height*0.75 - R/2.0);
    T = 0.0;
    S = State.GROW;
    sec = map(R, 100.0, 200.0, 2.0, 6.0);
  }
  
  void update()
  {
    if (frameCount < Life + D) return;
    
    if (S == State.GROW)
    {
      T += 1.0 / (30.0 * sec);
      T = constrain(T, 0.0, 1.0);
      if (T >= 1.0)
      {
        S = State.SHRINK;
      }
      Smooth = 1 - pow(1 - T, 2);
    }
    else if (S == State.SHRINK)
    {
      T -= 1.0 / (30.0 * sec);
      T = constrain(T, 0.0, 1.0);
      if (T <= 0.0)
      {
        S = State.DEAD;
      }
      Smooth = T * T * T * T * T;
    }
  }
  
  void draw()
  {
    noStroke();
    fill(255, 255*0.75*Smooth);
    circle(X, Y, R*Smooth);
  }
};
