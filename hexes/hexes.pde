class Hex
{
  float x;
  float y;
  float r;
  color c;
  float weight;
  
  Hex(color _c, float _r)
  {
    x = -width/3;
    y = 0;
    r = _r;
    c = _c;
    weight = 3;
  }
  
  void update(float w)
  {
    r -= 1.0;
    if (r < 0) r = height*1.155;
    weight = w;
  }
  
  void draw()
  {
    beginShape();
    noFill();
    stroke(c);
    strokeWeight(weight);
    for (int i = 0; i < 6; i++)
    {
      float ax = x + r * cos(TAU/6*i + TAU/12);
      float ay = y + r * sin(TAU/6*i + TAU/12);
      vertex(ax, ay);
    }
    endShape(CLOSE);
  }
};

color[] Colors;
Hex[] Hexes;
int Amount = 26;

float Start = 3.0f;
float End = 18.0f;
float Lerp = 0.0f;

void flipHalf() {
  loadPixels();
  for (int x=width/2; x<width; x++) {
    for (int y=0; y<height; y++) {
      pixels[x+y*width] = pixels[(width-x)+y*width];
    }
  }
  updatePixels();
}

void setup()
{
  size(960, 540);
  frameRate(30);
  
  Colors = new color[7];
  Colors[0] = 0xFFEFEFEF; // wit
  Colors[1] = 0xFFFF2020; // rood
  Colors[2] = 0xFF20FF20; // groen
  Colors[3] = 0xFF2020FF; // blauw
  Colors[4] = 0xFF000000; //0xFF20FFFF; // cyan
  Colors[5] = 0xFFFF20FF; // magenta
  Colors[6] = 0xFFFFFF20; // geel
  
  Hexes = new Hex[Amount];
  for (int i = 0; i < Amount; i++)
  {
    Hexes[i] = new Hex(Colors[i%7], height*1.155 - i*24);
  }
}

void draw()
{
  background(0xFF000000);
  translate(width/2, height/2);
  
  Lerp += 1.0 / (5*30);
  float W = (1.0 - Lerp) * Start + (Lerp * End);
  
  for (int i = 0; i < Amount; i++)
  {
    Hexes[i].update(W);
  }
  
  for (int i = 0; i < Amount; i++)
  {
    Hexes[i].draw();
  }
  
  flipHalf();
  
  //if (frameCount < 60*30)
  //{
  //  saveFrame();
  //}
  //else
  //{
  //  exit();
  //}
}

void mouseReleased()
{
  saveFrame("hexes.jpg"); exit();
}
