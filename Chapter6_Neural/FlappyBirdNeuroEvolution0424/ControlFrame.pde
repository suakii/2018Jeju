
class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;
  ControlP5 cp5;
  StringBuffer s;

  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
    
    s = new StringBuffer();
  }

  public void settings() {
    //pixelDensity(displayDensity());

    size(w, h);
  }

  public void setup() {
    surface.setLocation(10, 10);
    cp5 = new ControlP5(this);
    
          
  }

  void draw() {
    background(0);
    //textFont(font, 30);
    textSize(25);
    text(s.toString(), 10,50);
  }
}
