ArrayList<DuneRow> dunes;
int DUNE_ROWS = 20;
color front = color(0, 16, 0);
color back = color(0, 128, 0);
int x_offset = 20;

boolean Recording = false;
int RecordingFrame = -1;

int SECONDS_TO_RECORD = 5;
// Press 'r' to record

void setup() {
  //size(1080, 1920);
  size(960, 540);
  background(front);
  frameRate(60);

  dunes = new ArrayList<DuneRow>();
  dunes.add(new DuneRow());
}

void draw() {
  noStroke();
  fill(front, 75);
  rect(0, 0, width, height);

  stroke(0, 255, 0);
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
  
  if (Recording == true)
  {
    saveFrame();
    println("Saved frame: ", frameCount - RecordingFrame, " / ", SECONDS_TO_RECORD*60);
    if (frameCount >= RecordingFrame + SECONDS_TO_RECORD*60)
    {
      exit();
    }
  }
}

void keyReleased()
{
  if (key == 'r')
  {
    Recording = true;
    RecordingFrame = frameCount;
  }
}
