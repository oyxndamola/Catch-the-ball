class GoodbyePage {
  void draw() {
    background(0);
    textAlign(CENTER);
    textSize(32);
    fill(#FFA500);
    text("Game Over", width/2, height/2 - 50);
    textSize(24);
    text("Your score: " + score, width/2, height/2);
    textSize(16);
    text("Press any key to play again", width/2, height/2 + 50);
    
    if (keyPressed) {
      gameState = 0;  // switch back to welcome screen
      score = 0;
      return;         // exit draw loop
    }
  }
}
