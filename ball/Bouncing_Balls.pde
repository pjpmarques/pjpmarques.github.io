
ArrayList<Ball> balls = new ArrayList<Ball>();

void setup() {
  size(500, 500);
  
  balls.add(new Ball());
}

void draw() { 
  background(255);

  stroke(200);
  noFill();
  rect(0, 0, width-1, height-1);

  for (Ball b: balls) {
    b.draw();
  }
}

void keyPressed() {
  if (key=='r' || key=='R') {
    balls.clear();
    balls.add(new Ball());
  }
}

void mouseClicked() {
  Ball b = new Ball(mouseX, mouseY);
  balls.add(b);
}

///////////////

  
class Ball {
  final static int BALL_SIZE = 20;
  
  PVector pos;
  PVector dir;
  
  public Ball() {
    this(random(width - 2*BALL_SIZE) + BALL_SIZE, random(height - 2*BALL_SIZE) + BALL_SIZE);
  }
  
  public Ball(float x, float y) {
    pos = new PVector(x, y);  
    dir = PVector.random2D();
    dir.mult(4);
  }

  public void reset() {
    pos = new PVector(random(width - 2*BALL_SIZE) + BALL_SIZE, random(height - 2*BALL_SIZE) + BALL_SIZE);  
    dir = PVector.random2D();
    dir.mult(4);
  }
  
  public void draw() {
    noStroke();
    fill(color(255, 0, 0));     
    ellipse(pos.x, pos.y, 2*BALL_SIZE, 2*BALL_SIZE);
    
    if (pos.x <= BALL_SIZE || pos.x >= width - BALL_SIZE) {
      dir.x = -dir.x;
    }

    if (pos.y <= BALL_SIZE || pos.y >= height - BALL_SIZE) {
      dir.y = -dir.y;
    }

    pos.add(dir);
  }
}
