class TestPMatrix {

  PMatrix m1, m2, m3 ;
  Double d;

  TestPMatrix() {
  }
  void run() {
    doInit();
    doClone();
    doTranspose();
    doAdd();
    doSub();
    doMult();
    doProduct();
    doMap();
  }
  void doInit() {
    println("\n***** Testing init() **************");
    m1 = new PMatrix(7, 8);
    m1.debug("m1", true);
    d = (double) (floor(random(1, 20))/2-10);
    m1.init(d);
    m1.debug("init("+d+")", true);
    println("*************************************\n");
  }
  void doTranspose() {
    println("\n***** Testing transpose() 3x3 ***********");
    m1 = new PMatrix(3, 3);
    m1.randomize(0, 20);
    m1.debug("m1", true);
    m1.transpose();
    m1.debug("tr(m1)", true);
    println("\n***** Testing transpose() 5x4 ***********");
    m1 = new PMatrix(5, 4);
    m1.randomize(0, 20);
    m1.debug("m1", true);
    m1.transpose();
    m1.debug("tr(m1)", true); 
    println("******************************************\n");
  }
  void doAdd() {
    println("\n***** Testing add(n) ***********");
    m1 = new PMatrix(3, 3);
    m1.randomize(0, 20);
    m1.debug("m1");
    d = (double) (floor(random(1, 20))/2);
    m1.add(d);
    m1.debug("m1+"+d);
    println("\n***** Testing add(matrix) ******");
    m1 = new PMatrix(3, 3);
    m1.randomize(0, 20);
    m1.debug("m1");
    m2 = new PMatrix(3, 3);
    m2.randomize(0, 20);
    m2.debug("m2");
    m1.add(m2);
    m1.debug("m1+m2");    
    println("********************************\n");
  }
  void doSub() {
    println("\n***** Testing sub(n) ***********");
    m1 = new PMatrix(3, 3);
    m1.randomize(0, 20);
    m1.debug("m1");
    d = (double) (floor(random(1, 20))/2);
    m1.sub(d);
    m1.debug("m1-"+d);
    println("\n***** Testing sub(matrix) ******");
    m1 = new PMatrix(3, 3);
    m1.randomize(0, 20);
    m1.debug("m1");
    m2 = new PMatrix(3, 3);
    m2.randomize(0, 20);
    m2.debug("m2");
    m1.sub(m2);
    m1.debug("m1-m2");    
    println("********************************\n");
  }
  void doMult() {
    println("\n***** Testing mult(n) ***********");
    m1 = new PMatrix(3, 3);
    m1.randomize(0, 20);
    m1.debug("m1");
    d = (double) floor(random(2, 9));
    m1.mult(d);
    m1.debug("m1*"+d);
    println("\n***** Testing mult(matrix) ******");
    m1 = new PMatrix(3, 3);
    m1.randomize(0, 20);
    m1.debug("m1");
    m2 = new PMatrix(3, 3);
    m2.randomize(0, 20);
    m2.debug("m2");
    m1.mult(m2);
    m1.debug("m1*m2");    
    println("*********************************\n");
  }
  void doProduct() {
    println("\n***** Testing product(matrix) ******");
    m1 = new PMatrix(3, 4);
    m1.randomize(0, 20);
    m1.debug("m1", true);
    m2 = new PMatrix(4, 3);
    m2.randomize(0, 20);
    m2.debug("m2", true);
    m1.product(m2);
    m1.debug("m1 . m2", true);    
    println("*********************************\n");
  }
  void doClone() {
    println("\n***** Testing clone(matrix) ******");
    m1 = new PMatrix(3, 4);
    m1.randomize(0, 20);
    m1.debug("m1");
    m2 = m1.clone();
    m2.debug("clone(m1)");
    m1 = new PMatrix(2, 7);
    m1.randomize(0, 20);
    m1.debug("new m1");
    m2.debug("clone(m1) ?");    
    println("*********************************\n");
  }  
  void doMap() {
    println("\n***** Testing map(fn) ******");
    m1 = new PMatrix(3, 4);
    m1.randomize();
    m1.debug("m1");
    m1.map("sigmoid");
    m1.debug("map(sigmoid)");
    m1.map("dsigmoid");
    m1.debug("map(dsigmoid)");
    println("*******************************\n");
  }
}
