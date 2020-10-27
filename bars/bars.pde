float[] Blocks;
float[] T;
float[] Coord;
color[] Colors;
int Amount = 40;

color[] Pallet;

void setup()
{
  size(1280, 720);
  frameRate(30);
  Blocks = new float[Amount];
  T = new float[Amount];
  Coord = new float[Amount];
  Colors = new color[Amount+2];
  Pallet = new color[7];
  
  Pallet[0] = color(225, 0, 49);
  Pallet[1] = color(10, 73, 125);
  Pallet[2] = color(9, 31, 59);
  Pallet[3] = 0xFFFF00FF; // M
  Pallet[4] = 0xFF00FF00; // G
  Pallet[5] = 0xFF0000FF; // B
  Pallet[6] = 0xFFE0E0E0; 
  
  for (int i = 0; i < Blocks.length; i++)
  {
    Blocks[i] = (width/Blocks.length) * i;
    Blocks[i] += (width/Blocks.length) / 2;
    Colors[i] = color(Pallet[(int)random(7)]);
    T[i] = (float)i;
  }
  Colors[Amount] = color(Pallet[(int)random(7)]);
  Colors[Amount+1] = color(Pallet[(int)random(7)]);
}

void draw()
{
  if (frameCount % (int)(3.43*30) == 0)
  {
    for (int i = 0; i < Blocks.length; i++)
    {
      Colors[i] = color(Pallet[(int)random(7)]);
    }
    Colors[Amount] = color(Pallet[(int)random(7)]);
    Colors[Amount+1] = color(Pallet[(int)random(7)]);
  }
  
  for (int i = 0; i < Blocks.length; i++)
  {
    T[i] += 0.04;
    Coord[i] = Blocks[i] + (noise(T[i])*2 - 1)*15.0;
  }
  
  noStroke();
  
  fill(Colors[Amount]);
  rect(0, 0, Coord[1], height);
  for (int i = 0; i < Blocks.length - 1; i++)
  {
    fill(Colors[i]);
    rect(Coord[i], 0, Coord[i+1] - Coord[i], height);
  }
  fill(Colors[Amount+1]);
  rect(Coord[Amount-1], 0, width - Coord[Amount-1], height);
  
  //if (frameCount < (int)(3.43*30)*4)
  //{
  //  saveFrame();
  //}
  //else
  //{
  //  exit();
  //}
}
