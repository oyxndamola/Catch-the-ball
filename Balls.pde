class Ball {
  PVector position;
  float diameter;
  float speed;
  
  Ball(float x, float y, float speed) {
    position = new PVector(x, y);
    diameter = 20.0f; 
    this.speed = speed; 
  }
  
  void move() {
    position.y += 6; 
  }
  
  void bounce() {
    if (position.y + diameter/4 >= height) { 
      position.y = -diameter/4; 
    }
  }
  
  void draw() {
    fill(255, 0, 0); 
    ellipse(position.x, position.y, diameter, diameter); 
  }
  
  float getDiameter() {
    return diameter;
  }
  
  void reset() {
    position.y = -diameter/2; 
  }
}
