class Pipe {
  float x;
  float top;
  float bottom;
  float w = 40;
  float speed;
  boolean hit;

  Pipe() {
    x = width;
    speed = 2;
    top = random(height/2);
    bottom = random(height/2);
  }

  boolean hits(Bird b) {
    if (b.y-b.r<0 || b.y+b.r>height) 
      return true ;
    
    
    if (b.x > x && b.x < x + w) {
      if ((b.y < top+b.r) || (b.y > (height-bottom-b.r))) {
        hit = true;
        return true;
      }
    }
    hit = false;
    return false;
  }

  void update() {
    x = x - speed;
  }

  void show() {
    stroke(255);
    if (hit) {      
      fill(255, 0, 0);
    } else {
      fill(255);
    }
    rect(x, 0, w, top); 
    rect(x, height-bottom, w, bottom);
  }
  
    // Has it moved offscreen?
  boolean  offscreen() {
    if (this.x < -this.w) {
      return true;
    } else {
      return false;
    }
  }
  
}
