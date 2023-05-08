class Ball {
  PVector position;
  float diameter;
  float speed;
  
  Ball(float x, float y, float speed) {
    position = new PVector(x, y);
    diameter = 20.0f; // Set the initial diameter of the ball
    this.speed = speed; // Set the speed of the ball
  }
  
  void move() {
    position.y += 6; // Adjust the vertical position of the ball with the specified speed
  }
  
  void bounce() {
    if (position.y + diameter/4 >= height) { // Check if the ball has reached the bottom of the screen
      position.y = -diameter/4; // Reset the position of the ball to the top of the screen
    }
  }
  
  void draw() {
    fill(255, 0, 0); // Set the fill color of the ball
    ellipse(position.x, position.y, diameter, diameter); // Draw the ball as an ellipse
  }
  
  float getDiameter() {
    return diameter;
  }
  
  void reset() {
    position.y = -diameter/2; // Reset the position of the ball to the top of the screen
  }
}
