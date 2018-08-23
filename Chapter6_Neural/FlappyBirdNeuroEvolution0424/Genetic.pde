
class Genetic {
  Population p;
  Genetic(Population p) {
    this.p = p;
  }
  void nextGeneration() {
    
    //
    background(0);
    p.pipes.clear();
    p.addPipe();
    //
    
    
    // Normalize the fitness values 0-1
    normalizeFitness();
    // Generate a new set of birds
    p.birds = generate();
    p.generation++ ;
  }
  
  Bird[] generate() {
    Bird[] newBirds = new Bird[p.birds.length];
    for (int i = 0; i < p.birds.length; i++) {
      newBirds[i] = poolSelection();
    }
    return newBirds;
  }
  void normalizeFitness() {
    float sum = 0. ; 
    for (int i = 0; i < p.birds.length; i++) {
      p.birds[i].score*= p.birds[i].score;
      sum += p.birds[i].score;
    }
    // Divide by the sum
    for (int i = 0; i < p.birds.length; i++) {
      p.birds[i].fitness = p.birds[i].score / sum;
    }
  }
  
  Bird poolSelection() {
    int index = 0;
    Float r = random(1);
    while (r > 0) {
      r -= p.birds[index].fitness;
      index += 1;
      if (index == p.birds.length)
        return new Bird(p.birds[p.birds.length-1]);
    }
    index -= 1;
    return new Bird(p.birds[index]) ;
  }
}
