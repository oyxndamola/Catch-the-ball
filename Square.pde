class Square {
  float x;
  float y;
  float speed; 
  float size;
  color squareColor;

  Square(float x, float y, float speed, float size) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.size = size;
    squareColor = color(0, 255, 0);
  }

  void update() {
    // Movement logic handled in keyPressed()
  }

  void draw() {
    fill(squareColor);
    rectMode(CENTER);
    rect(x, y, size, size);
  }

  boolean catchBall(Ball ball, float radius) {
    float distance = dist(x, y, ball.position.x, ball.position.y);
    return distance < (size / 2 + radius);
  }

  void moveLeft() {
    x -= 50;
    x = constrain(x, size / 2, width - size / 2);
  }

  void moveRight() {
    x += 50;
    x = constrain(x, size / 2, width - size / 2);
  }
}
