void setup() {
  size(400,400);
  background(192,64,0);
  noLoop();
}

void draw() {
  for(int i = 0; i < 100; i++){
    float x1 = random(20,width - 20);
    float x2 = random(20,width - 20);
    float y1 = random(20,width - 20);
    float y2 = random(20,width - 20);
    stroke(random(150,255));
    line(x1, y1, x2, y2);
  }

  // saveFrame();

  /* background(192,64,0);
  for(int n = 0; n < 4; n++){
    float r = 50 + n*50;
  
    for(int i = 0; i < 20; i++){
      float theta = random(TWO_PI);
      float x = width/2 + r*cos(theta);
      float y = width/2 + r*sin(theta);
      stroke(random(150,255));
      line(x, y, width/2, width/2);
    }
  } */
}
