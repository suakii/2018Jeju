PVector v = new PVector(0,5);
PVector loc = new PVector(200,0);
PVector acc = new PVector(0,1);
void setup(){
  size(400,1000);
  background(0);
}

void update(){
  v.add(acc);  // v = v + a
  loc.add(v);  // loc = loc + v
}

void draw(){
  ellipse(loc.x, loc.y, 20, 20);
  update();
}
