// Console print a simple test of PMatrix class
void test() {
  TestPMatrix test = new TestPMatrix();
  test.run();
}
//

NeuralNetwork nn;

int count = 0 ;

final int step = 100 ; // number of trainings by draw()

void setup() {
  size(400, 400);
  nn = new NeuralNetwork(2, 4, 1, "sigmoid");
  nn.setLearningRate(0.5);
  textAlign(CENTER, CENTER);
  textSize(12);
}

void draw() {
  background(127);
  
  Double[] in = new Double[2];
  Double[] out = new Double[1];
  int t;
  if (!mousePressed) {
    for (t = 0; t < step; t++) {
      in[0] = (double)((random(0, 1)<.5)?0:1);
      in[1] = (double)((random(0, 1)<.5)?0:1);
      out[0] = (double) (  ( Math.round(in[0])-Math.round(in[1]) == 0 ) ? 0 : 1.0 );
      nn.train(in, out);
    }
    count+=step;
  }
  int resolution = 200;
  int cols = 2;
  int rows = 2;
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i * resolution;
      int y = j * resolution;
      Double[] input = {(double)i, (double)j };
      Double[] output = nn.predict(input);
      //println(frameRate);
      //println(input[0] + ":" + input[1] + " = " + output[0]);
      fill((int)(output[0] * 255));
      noStroke();
      rect(x, y, resolution, resolution);
      fill(255, 0, 0);
      text(String.valueOf(output[0])+"\n"+((int)(output[0] * 255)), x+resolution/2, y+resolution/2-2);
    }
  }
  fill(127);
  rect(width/2-50, height/2-10, 100, 22);
  fill(0, 1270, 0);
  text(count, width/2, height/2);
  
  //println(frameRate);
}
