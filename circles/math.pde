// Last update: Nov 3, 2020

boolean IsOdd(int X)
{
  boolean Result;
  Result = boolean(X % 2);
  return Result;
}

boolean IsEven(int X)
{
  boolean Result;
  Result = boolean(1 - (X % 2));
  return Result;
}

float Clamp(float Value)
{
  if (Value > 1.0) Value = 1.0;
  else if (Value < 0.0) Value = 0.0;
  return Value;
}

float Lerp(float A, float t, float B)
{
  return (1.0 - t) * A + t * B;
}

// Smoothstep functions from
// http://sol.gfxile.net/interpolation

float Smoothstep(float A, float t, float B)
{
  t = t * t * (3.0 - 2.0 * t);
  return Lerp(A, t, B);
}

float Smootherstep(float A, float t, float B)
{
  t = t * t * t * (t * (t * 6.0 - 15.0) + 10.0);
  return Lerp(A, t, B);
}

// Easing functions from
// https://easings.net

float EaseOutSine(float A, float t, float B)
{
  t = sin(t * HALF_PI);
  return Lerp(A, t, B);
}

float EaseInSine(float A, float t, float B)
{
  t =  1.0 - cos(t * HALF_PI);
  return Lerp(A, t, B);
}

float EaseInOutSine(float A, float t, float B)
{
  t = -(cos(t * PI) - 1.0) / 2.0;
  return Lerp(A, t, B);
}

float EaseOutInSine(float A, float t, float B)
{
  t *= 2.0;
  if (t < 1.0)
  {
    t = 0.5 * sin(t * HALF_PI);
  }
  else
  {
    t = 0.5 * (1 - cos((t - 1.0) * HALF_PI)) + 0.5;
  }
  return Lerp(A, t, B);
}

float EaseInQuad(float A, float t, float B)
{
  t = t * t;
  return Lerp(A, t, B);
}

float EaseOutQuad(float A, float t, float B)
{
  t = 1 - (1 - t) * (1 - t);
  return Lerp(A, t, B);
}

float EaseInOutQuad(float A, float t, float B)
{
  if (t < 0.5)
  {
    t = 2 * t * t;
  }
  else
  {
    t = 1 - pow(-2 * t + 2, 2) / 2;
  }
  return Lerp(A, t, B);
}

// Other easing functions

float EaseOutInSqrt(float A, float t, float B)
{
  t *= 2.0;
  if (t < 1.0)
  {
    t = 0.5 * pow(t, 0.5);
  }
  else
  {
    t = 0.5 * (2.0 - pow(2.0 - t, 0.5));
  }
  return Lerp(A, t, B);
}
