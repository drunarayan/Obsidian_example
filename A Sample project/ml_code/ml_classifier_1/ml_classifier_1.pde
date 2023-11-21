int nwt = 3;
int npts = 100;
Perceptron pcp = new Perceptron(nwt);
Point [] pts = new Point [npts];
float slope = (float) (Math.random()) -0.5;
float off = (float) (Math.random()) -0.5;
void setup() {
  size(500,500);

  for (int i = 0; i < pts.length; i++) {
    pts[i] = new Point();
  }
  
  pcp.feedforward(pcp.weights);
}

float line_func(float x) {
  //y = slope * x + off
  return slope * x + off;
}

float px(float x) {
  return map(x, -0.5, 0.5, 0, width);
}

float py(float y) {
  return map(y, -0.5, 0.5, height, 0);
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(1);
  for (Point pt : pts) {
    ellipse(px(pt.x), py(pt.y), 16, 16);
  }
  stroke(255,0,0);
  strokeWeight(3);
  line(px(-1),py(line_func(-1)),px(1),py(line_func(1)));
}
