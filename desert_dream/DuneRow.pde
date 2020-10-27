class DuneRow {
  float HORIZON = 20;
  float START_SPEED = 0.01;
  float ACCELERATION = 1.003;
  int AMOUNT = 60;
  float distance, speed, origin;
  boolean alive = true;
  Dune[] dunes;

  DuneRow()
  {
    speed = START_SPEED;
    distance = HORIZON;
    origin = width;
    dunes = new Dune[AMOUNT];
    for (int i = 0; i < dunes.length; i++)
      dunes[i] = new Dune(random(40, 120), random(0, 400));
  }

  void update() {
    origin = origin + x_offset * speed;
    speed = speed * ACCELERATION;
    distance = distance + speed;
    if (distance > height + 300) {
      alive = false;
    }
  }

  void draw() {
    if (alive) {
      for (int i = 0; i < dunes.length; i++) {
        if (i == 0)
          dunes[0].draw(origin, distance, HORIZON/height);
        else if (dunes[i-1].getDestination().x > -20)
          dunes[i].draw(dunes[i-1].getDestination().x, dunes[i-1].getDestination().y, dunes[i-1].getDestination().y/height);
        else break;
      }
    }
  }
}
