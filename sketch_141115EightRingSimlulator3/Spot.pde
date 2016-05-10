class Spot{
  //property
  float cx, cy, x1, y1, x2, y2,r,w, speed, angle, dx, dy;
  
  //constructa
  Spot(float _cx, float _cy, float _r, float _w, float _speed, float _angle, float _dx, float _dy){
    cx = _cx;
    cy = _cy;
    r = _r;
    w = _w;
    speed = _speed;
    angle = _angle;
    dx = _dx;
    dy = _dy;
  }
  
  //move method
  void moveA(){
    angle += speed;
    x1 = cx + (r-w/2) * cos(radians(angle));
    y1 = cy + (r-w/2) * sin(radians(angle));
    x2 = cx + (r-w/2) * cos(radians(angle+180));
    y2 = cy + (r-w/2) * sin(radians(angle+180));
    }
  void moveB(){
    angle += speed;
    cx = x1 + (r-w/2) * cos(radians(angle+180));
    cy = y1 + (r-w/2) * sin(radians(angle+180));   
    x2 = x1 + 2 * (r-w/2) * cos(radians(angle+180));
    y2 = y1 + 2 * (r-w/2) * sin(radians(angle+180));
  }
  void moveC(){
    angle += speed;
    cx = x2 + (r-w/2) * cos(radians(angle));
    cy = y2 + (r-w/2) * sin(radians(angle));   
    x1 = x2 + 2 * (r-w/2) * cos(radians(angle));
    y1 = y2 + 2 * (r-w/2) * sin(radians(angle));
  }
  
  //display method
  void display(){
    fill(255);
    drawRing(x1+dx,y1+dy,r,(r-w));
    drawRing(x2+dx,y2+dy,r,(r-w));
    noFill();
  }
}

void drawRing(float x, float y, float w1, float w2)
{
  int segments = 32;
  // w1 == outer radius, w2 == inner radius.
  float deltaA=(1.0/(float)segments)*TWO_PI;
  beginShape(QUADS);
  for(int i=0;i<segments;i++)
  {
    vertex(x+w1*cos(i*deltaA),y+w1*sin(i*deltaA));
    vertex(x+w2*cos(i*deltaA),y+w2*sin(i*deltaA));
    vertex(x+w2*cos((i+1)*deltaA),y+w2*sin((i+1)*deltaA));
    vertex(x+w1*cos((i+1)*deltaA),y+w1*sin((i+1)*deltaA));
  }
  endShape();
} 

