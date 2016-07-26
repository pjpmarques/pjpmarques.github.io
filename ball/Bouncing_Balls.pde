
// List of all balls currently in the screen
ArrayList<Ball> balls = new ArrayList<Ball>();

// Setup the sketch (500px by 500px) containing only one ball
void setup() {
  size(500, 500);
  
  balls.clear();
  balls.add(new Ball());
}

// Called for drawing the screen
void draw() { 
  // Clear anything currently there
  background(255);
  stroke(200);
  noFill();
  rect(0, 0, width-1, height-1);

  // Draw all balls
  for (Ball b: balls) {
    b.draw();
  }
}

// Check for key presses
void keyPressed() {
  // 'R' is for reset the sketch
  if (key=='r' || key=='R') {
    balls.clear();
    balls.add(new Ball());
  }
}

// Check for mouse clicks
void mouseClicked() {
  // When the mouse is clicked, add a new ball there
  Ball b = new Ball(mouseX, mouseY);
  balls.add(b);
}

///////////////

// The ball class
class Ball {
  // Ball size
  final static int BALL_SIZE = 20;
  
  // Position and velocity of the ball
  PVector pos;
  PVector dir;
  
  // Constructs a new ball at a random position and velocity
  public Ball() {
    this(random(width - 2*BALL_SIZE) + BALL_SIZE, random(height - 2*BALL_SIZE) + BALL_SIZE);
  }
  
  // Constructs a new ball a specified (x, y) position with a random valocity
  public Ball(float x, float y) {
    pos = new PVector(x, y);  
    dir = PVector.random2D();
    dir.mult(4);
  }

  // Reset the ball (position and velocity)
  public void reset() {
    pos = new PVector(random(width - 2*BALL_SIZE) + BALL_SIZE, random(height - 2*BALL_SIZE) + BALL_SIZE);  
    dir = PVector.random2D();
    dir.mult(4);
  }
  
  // Draw the ball using its current position and update its location
  public void draw() {
    // Draw the ball
    noStroke();
    fill(color(255, 0, 0));     
    ellipse(pos.x, pos.y, 2*BALL_SIZE, 2*BALL_SIZE);
    
    // If it collides with the wall, invert its velocity
    if (pos.x <= BALL_SIZE || pos.x >= width - BALL_SIZE) {
      dir.x = -dir.x;
    }

    if (pos.y <= BALL_SIZE || pos.y >= height - BALL_SIZE) {
      dir.y = -dir.y;
    }

    // Update its position using velocity (pos = pos + dir*time). Time is a unit vector
    pos.add(dir);
  }
}
