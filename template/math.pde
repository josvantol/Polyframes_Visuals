float Abs(float Value)
{
  if (Value >= 0.0f)
  {
    return Value;
  }
  else
  {
    return (Value * -1.0f);
  }
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

float Smoothstep(float A, float t, float B)
{
  t = t * t * (3 - 2 * t);
  return (1.0f - t) * A + t * B;
}

float Smootherstep(float A, float t, float B)
{
  t = t * t * t * (t * (t * 6 - 15) + 10);
  return (1.0f - t) * A + t * B;
}

float EaseInSine(float A, float t, float B)
{
  t =  1 - cos((t * PI) / 2);
  return (1.0 - t) * A + t * B;
}

float EaseOutSine(float A, float t, float B)
{
  t = sin((t * PI) / 2);
  return (1.0 - t) * A + t * B;
}

float EaseInOutSine(float A, float t, float B)
{
  t = -(cos(PI * t) - 1) / 2;
  return (1.0 - t) * A + t * B;
}

float EaseInCubic(float A, float t, float B)
{
  t = t * t * t;
  return (1.0 - t) * A + t * B;
}

float EaseOutCubic(float A, float t, float B)
{
  t = 1 - pow(1 - t, 3);
  return (1.0 - t) * A + t * B;
}

float EaseInOutCubic(float A, float t, float B)
{
  if (t < 0.5)
  {
    t = 4 * t * t * t;
  }
  else
  {
    t = 1 - pow(-2 * t + 2, 3) / 2;
  }
  return (1.0 - t) * A + t * B;
}

float EaseInQuint(float A, float t, float B)
{
  t = t * t * t * t * t;
  return (1.0 - t) * A + t * B;
}

float EaseOutQuint(float A, float t, float B)
{
  t = 1 - pow(1 - t, 5);
  return (1.0 - t) * A + t * B;
}

float EaseInOutQuint(float A, float t, float B)
{
  if (t < 0.5)
  {
    t = 16 * t * t * t * t * t;
  }
  else
  {
    t = 1 - pow(-2 * t + 2, 5) / 2;
  }
  return (1.0 - t) * A + t * B;
}
