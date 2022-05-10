Pendulum pen;
float initialAngle, gravity, friction;

void setup() {
  size(displayWidth, displayHeight);
  
  // settings
  initialAngle = PI - 0.1;
  gravity = 0.01;
  friction = 0.99;
  
  pen = new Pendulum();
}
void draw() {
  background(0);
  pen.update();
  pen.render();
}
class Pendulum {
  float len = height / 2;
  float angle = initialAngle;
  float vel = 0;
  PVector origin = new PVector(width / 2, 0);
  void render() {
    stroke(255);
    pushMatrix();
    translate(origin.x, origin.y);
    rotate(-angle);
    line(0, 0, 0, len);
    popMatrix();
    
    PVector bob = new PVector(origin.x + len * sin(angle), origin.y + len * cos(angle));
    ellipse(bob.x, bob.y, 100, 100);
  }
  void update() {
    angle += vel;
    vel += -gravity * sin(angle);
    vel *= friction;
  }
}