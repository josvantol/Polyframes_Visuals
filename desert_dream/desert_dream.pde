ArrayList<DuneRow> dunes;
int DUNE_ROWS = 20;
color front = color(0);
color back = color(9, 31, 59);
int x_offset = 30;

void setup() {
  size(960, 540);
  background(front);
  frameRate(60);

  dunes = new ArrayList<DuneRow>();
  dunes.add(new DuneRow());
}

void draw() {
  noStroke();
  fill(front, 100);
  rect(0, 0, width, height);

  stroke(255);
  strokeWeight(2);

  if (frameCount % 120 < 1)
    if (dunes.size() < DUNE_ROWS)
      dunes.add(new DuneRow());

  for (int i = dunes.size(); i > 0; i--) {
    DuneRow d = dunes.get(i-1);
    d.update();
    d.draw();
    if (d.alive == false) dunes.remove(0);
  }
  
  //if (frameCount > 60*60 && frameCount < 4 * 60 * 60)
  //{
  //  saveFrame();
  //}
  //else if (frameCount > 4 * 60 * 60)
  //{
  //  exit();
  //}
}
