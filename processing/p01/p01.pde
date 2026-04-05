/* Processing 01
2026-04-05

Sketch on the idea of projections and topological maps. Uses combinations
of sin/cos functions with a period affected by noise. z(height) is represented
by the brightness of a dot in the plane.

esmoore */

void setup() {
  size(900, 900);
  background(#1b1b1b);
  strokeWeight(3);
  strokeCap(PROJECT);
  noLoop();
  noFill();
}

void draw() {
  translate(width/2, height/2);

  int step1 = 8;
  int step2 = step1;

  int rad1 = 400;
  int rad2 = 380;

  for(float x = -1*rad1; x <= rad1; x += step1){
    for(float y = -1*rad1; y <= rad1; y += step1){
      float p = noise(y + x)*3 + 8; 
      float z = sin(x/p) + cos(y/p)*sin(x);
      stroke(map(z, -2, 2, 50, 255));
      point(x,y);
    }
  }
  
  for(float x = -1*rad2; x <= rad2; x += step2){
    for(float y = -1*rad2; y <= rad2; y += step2){
      float p = noise(y + x)*3 + 8; 
      float z = sin(x/p)*cos(y) + cos(y/p);
      float brightness = map(z, -2, 2, 50, 255);
      stroke(brightness*.8, (brightness/255)*80, 0);
      point(x,y);
    }
  }
  // saveFrame();
}
