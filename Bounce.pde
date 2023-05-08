import com.lowagie.text.html.simpleparser.Img;
import javax.sound.sampled.Port;
import javax.sound.sampled.Port;
import java.util.ArrayList;
import processing.core.PApplet;
import processing.core.PVector;
import processing.core.PImage;
import ddf.minim.*;
import ddf.minim.analysis.*;
import processing.serial.*;
import controlP5.*;

PImage imgWelcome;
PImage imgGoodbye;
Minim minim;
AudioPlayer backgroundMusic;

final int STATE_WELCOME = 0;
final int STATE_PLAYING = 1;
final int STATE_GAME_OVER = 2;
final int STATE_DELAY = 3;

final int GAME_DURATION = 8; // in seconds
final int NUM_BALLS_TO_WIN = 10;

ArrayList<Ball> balls = new ArrayList<Ball>();
Square square;
int gameState = STATE_WELCOME;
int numBalls = 0;
int timeElapsed = 0;
int score = 0;
int delayTimer = 0;

Serial port;
ControlP5 cp5;

void setup() {
  size(600, 600);
  imgWelcome = loadImage("clear.png");
  imgGoodbye = loadImage("soil.png");
  imgWelcome.resize(600, 600);
  imgGoodbye.resize(600, 600);
  minim = new Minim(this);
  backgroundMusic = minim.loadFile("songsong.mp3");
  gameState = STATE_WELCOME; // Set the initial state to welcome
  reset();
}

void draw() {
  background(0);

  if (gameState == STATE_WELCOME) {
    drawWelcomePage();
  } else if (gameState == STATE_PLAYING) {
    updatePlayingState();
    drawScore();
    square.draw();
  } else if (gameState == STATE_GAME_OVER) {
    drawGameOverPage();
  }

  if (!backgroundMusic.isPlaying()) {
    backgroundMusic.loop();
  }
}

void keyPressed() {
  if (gameState == STATE_WELCOME) {
    gameState = STATE_PLAYING;
  } else if (gameState == STATE_PLAYING) {
    if (keyCode == LEFT) {
      square.moveLeft();
    } else if (keyCode == RIGHT) {
      square.moveRight();
    }
  } else if (gameState == STATE_GAME_OVER) {
    if (keyCode == ENTER) {
      gameState = STATE_WELCOME;
      reset();
    }
  }
}

void updatePlayingState() {
  square.update();

  for (Ball ball : balls) {
    ball.move();  // Update the position of the ball
    ball.bounce();
    ball.draw();

    if (square.catchBall(ball, ball.getDiameter() / 2)) {
      incrementScore();
      ball.reset();
      numBalls++;
    }
  }

  timeElapsed = millis() / 1000;

  if (timeElapsed >= GAME_DURATION) {
    gameState = STATE_GAME_OVER;
  }
}

void drawScore() {
  textAlign(LEFT);
  textSize(16);
  fill(#FFA500);
  text("Score: " + score, 10, 20);
}

void drawWelcomePage() {
  background(255);
  image(imgWelcome, 0, 0, width, height);
  textAlign(CENTER);
  textSize(32);
  fill(#FFA500);
  text("Welcome to Ball Catcher!", width/2, height/2 - 50);
  textSize(24);
  text("Created by Oyindamola Bade-Ojo", width/2, height/2);
  textSize(16);
  text("Catch 10 balls under 8 seconds to win", width/2, height/2
+ 50);
  text("Press any key to start", width/2, height/2 + 100);
}

void drawGameOverPage() {
  background(255);
  image(imgGoodbye, 0, 0, width, height);
  textAlign(CENTER);
  textSize(32);
  fill(#FFA500);

  if (numBalls >= NUM_BALLS_TO_WIN && timeElapsed <= GAME_DURATION) {
    text("You won, That's it Goodbye", width/2, height/2 - 50);
  } else {
    text("You lost, That's it Goodbye", width/2, height/2 - 50);
  }

  textSize(24);
  text("Thank you for playing!", width/2, height/2 + 20);
}

void reset() {
  balls.clear();
  square = new Square(width / 2, height - 50, 5, 50);
  numBalls = 0;
  timeElapsed = 0;
  score = 0;
  gameState = STATE_WELCOME;

  for (int i = 0; i < NUM_BALLS_TO_WIN; i++) {
    balls.add(new Ball(random(width), -random(height), random(1, 5))); // Add random speed to the balls
  }
}

void incrementScore() {
  score++;
}
