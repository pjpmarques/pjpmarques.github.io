
final int BALL_SIZE = 20;

PVector pos;
PVector dir; 

void initBall() {
  pos = new PVector(random(width - 2*BALL_SIZE) + BALL_SIZE, random(height - 2*BALL_SIZE) + BALL_SIZE);  
  dir = PVector.random2D().mult(4);
}

void setup() {
  size(800, 600);
  initBall();
    
  PFont f = createFont("Helvetica", 16, true);
  textFont(f, 16);
}

void draw() {
  background(255);
  fill(color(0, 0, 255));
  text("Press 'r' to reset", 10, 50);

  stroke(255);
  noFill();
  rect(0, 0, width-1, height-1);
  
  noStroke();
  fill(color(255, 0, 0));     
  ellipse(pos.x, pos.y, 2*BALL_SIZE, 2*BALL_SIZE);

  if (pos.x <= BALL_SIZE || pos.x >= width - BALL_SIZE)
    dir.x = -dir.x;

  if (pos.y <= BALL_SIZE || pos.y >= height - BALL_SIZE)
    dir.y = -dir.y;
    
  pos = pos.add(dir);
}

void keyPressed() {
  if (key=='r' || key=='R') {
    initBall();
  }    
}