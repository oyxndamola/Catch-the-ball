import processing.core.PApplet;
import processing.core.PConstants;

class WelcomePage {
  PApplet sketch;
  
  WelcomePage(PApplet sketch) {
    this.sketch = sketch;
  }
  
  void draw() {
    sketch.background(255);
    sketch.textAlign(PConstants.CENTER);
    sketch.textSize(32);
    sketch.fill(sketch.color(#FFA500));
    sketch.text("Welcome to Ball Catcher!", sketch.width/2, sketch.height/2 - 50);
    sketch.textSize(24);
    sketch.text("Created by Oyindamola Bade-Ojo", sketch.width/2, sketch.height/2);
    sketch.textSize(16);
    sketch.text("Press any key to start", sketch.width/2, sketch.height/2 + 50);

    if (sketch.keyPressed) {
      gameState = STATE_PLAYING;  // switch to playing mode
      return;                    // exit draw loop
    }
  }
}
