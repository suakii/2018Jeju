
class Population {

  Bird[] birds ;
  ArrayList<Pipe>pipes = new ArrayList<Pipe>();
  ControlFrame cf;
  int count ;
  int generation = 1 ;
  int highScore = 0 ;
  int score = 0;
  Genetic g;
  Population(int totalPopulation, ControlFrame cf) {
    this.cf = cf;
    birds = new Bird[totalPopulation] ; 
    
    pipes.add(new Pipe());//add one Pipe;

    
    for (int i = 0; i < birds.length; i++) 
      birds[i] = new Bird();

    g = new Genetic(this);
  }
  void addPipe() {
      pipes.add(new Pipe());
  }
  
  void showPipes() {
    for (int i = pipes.size()-1; i >= 0; i--) {
        pipes.get(i).update();
        if (pipes.get(i).offscreen())
          pipes.remove(i);
      }
    
    /// Draw Pipes!
    for (int i = 0; i < pipes.size(); i++) {
      pipes.get(i).show();
    }
    
    if (frameCount % 75 == 0) {
      pipes.add(new Pipe());
    }
    
  }
  
  void showBirds() {
    count = birds.length;
     score = 0;
     for (Bird bird : birds) {
        if (bird.alive) {
          bird.think(pipes);
          bird.update();
          bird.show();
          score = max(score, bird.score);
          
          //hits
          for (int i = 0; i < pipes.size(); i++) {
            if (pipes.get(i).hits(bird)) {
              bird.alive = false ;
              count--;
            }
          }
           
        }
        else 
        count--;
     }
  }
  
  
  void drawData() {
    fill(255);
    stroke(255);
    //line(0, bHeight, width, bHeight);
    //textSize(30);
    //cf.s.setLength(0);
    cf.s = new StringBuffer();
    cf.s.append("Generation #"+generation+"\n");
    cf.s.append("Total Birds #"+totalPopulation+"\n");
    
    if (count > 1) {
      cf.s.append("Current "+count+" birds\n");
    } else {
      cf.s.append("The LAST Bird !\n");
    }
    cf.s.append("Current Score "+score+"\n");
    cf.s.append("HighScore "+highScore);
    
    
    //text("Generation #"+generation+"\n"+(count>1?("Current "+count+" birds"):"The LAST Bird")+" !\nCurrent Score "+score+"\nHighScore "+highScore,10,30+500);
    
    
    if (count == 0) {// || (score>2*highScore && score>1000)) {
      if (score>highScore) 
          highScore=score;
      
      g.nextGeneration();
    }
  }
  
  
}
