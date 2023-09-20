PImage img;
int startX = 350;
int startY = 640;
int endX = 1150;
int endY = 780;

void setup() {
  size(1200, 900);
  img = loadImage("palpatineImage.jpg");
  background(img); 
}

void draw() {
  background(img);
  lightning(startX, startY, endX, endY, 7); 
  frameRate(2);
}

void lightning(float x1, float y1, float x2, float y2, int branches) {
  if (branches == 0) {
    //Draw line
    int r = 80 + (int)(Math.random()*50);
    int g = 0 + (int)(Math.random()*50);
    int b = 130 + (int)(Math.random()*50);
    stroke(r,g,b);
    strokeWeight(15);
    line(x1, y1, x2, y2);
    stroke(255,255,255);
    strokeWeight(7);
    line(x1, y1, x2, y2);
  } else {
    //Make branches
    float midPointX = (x1 + x2) / 2;
    float midPointY = (y1 + y2) / 2;
    
    midPointX += (Math.random()*100) - 50; 
    midPointY += (Math.random()*100) - 50;
    
    lightning(x1, y1, midPointX, midPointY, branches - 1);
    lightning(midPointX, midPointY, x2, y2, branches - 1);
  }
}

void mousePressed() {
  background(img);
  loop();
}
