color[] PALETTE = {#9C6867, #725E5E, #C76361, #473A3A, #332121, #331918};
int MARGIN = 80;
int STRIPE_WIDTH = 20;
int NUM_STROKES_V = 12;
int NUM_STROKES_H = 6;

void setup() {
  size(1600, 600);
  background(#1b1b1b);
  pixelDensity(1);
  noStroke();
  noLoop();

  // for(int i = MARGIN; i < height - MARGIN; i+= STRIPE_WIDTH){
  //   fill(PALETTE[int(random(0,6))]); 
  //   rect(MARGIN, i, width-2*MARGIN, STRIPE_WIDTH);
  // }
  
  for(int i = 0; i < 12; i++){
    fill(PALETTE[int(random(0,PALETTE.length))]);
    int corner = MARGIN + i*STRIPE_WIDTH;
    rect(corner, corner, width - 2*corner, height - 2*corner);
  }  
}

void draw() {
  loadPixels();
  PImage out = createImage(width, height, RGB);
  arrayCopy(pixels, out.pixels);

  for(int s = 0; s < NUM_STROKES_V; s++){
    float s_pos = MARGIN + ((width - 2*MARGIN) * (s + 0.5)) / NUM_STROKES_V;
    float Z = random(10, 40);
    float MEW = random(0.82, 0.95);
    
    for(int x = 0; x < width; x++){
      float x_disp = abs(x - s_pos);
      float offset = Z * pow(MEW, x_disp);

      for(int y = 0; y < height; y++){
        int source = int(y - offset);
        source = constrain(source, 0, height-1);

        if(s % 2 != 0){
          out.pixels[y*width + x] = pixels[source*width + x];
        }
        else{
          out.pixels[source*width + x] = pixels[y*width + x];
        }
      }
    }
    arrayCopy(out.pixels, pixels);
  }
  for(int s = 0; s < NUM_STROKES_H; s++){
    float s_pos = MARGIN + ((height - 2*MARGIN) * (s + 0.5)) / NUM_STROKES_H;
    float Z = random(10, 40);
    float MEW = random(0.82, 0.95);
   
    for(int y = 0; y < height; y++){
      float y_disp = abs(y - s_pos);
      float offset = Z * pow(MEW, y_disp);

      for(int x = 0; x < width; x++){
        int source = int(x - offset);
        source = constrain(source, 0, width-1);

        if(s % 2 != 0){
          out.pixels[y*width + x] = pixels[y*width + source];
        }
        else{
          out.pixels[y*width + source] = pixels[y*width + x];
        }
      }
    }
    arrayCopy(out.pixels, pixels);
  }
  
  out.updatePixels();
  image(out, 0, 0);
  saveFrame();
}
