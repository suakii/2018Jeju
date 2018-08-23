
import controlP5.*;

//population

Population population;
int totalPopulation = 300;

//int speed = 30;
ControlFrame cf;

void settings() {
  size(800,600);
  //pixelDensity(displayDensity());
  
}

void setup() {
  //size(800, 600);
  cf = new ControlFrame(this, 400, 600, "Controls");
  surface.setLocation(420, 10);
  
  
  //pixelDensity(2);
  
  smooth();
  population = new Population(totalPopulation, cf);
  population.addPipe();
  //frameRate(speed);
  noLoop();
 
}

void mousePressed() {
  loop();
}

void draw() {
  background(0);
  population.showPipes();
  population.showBirds();
  population.drawData();
}
