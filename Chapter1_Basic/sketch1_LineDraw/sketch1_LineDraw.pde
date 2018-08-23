void setup() {
  size(200,200);
  background(255);
}

void draw() {
  for (int i = 0; i < 200; i+= 10)
    line(0, i, 200, i);
}
