class Spot{
  //property
  float cx, cy, x1, y1, x2, y2,r,w, speed, angle;
  
  //constructa
  Spot(float _cx, float _cy, float _r, float _w, float _speed, float _angle){
    cx = _cx;
    cy = _cy;
    r = _r;
    w = _w;
    speed = _speed;
    angle = _angle;
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
    ellipse(x1,y1,r*2,r*2);
    ellipse(x2,y2,r*2,r*2);
    noFill();
    fill(0);
    ellipse(x1,y1,(r-w)*2,(r-w)*2);
    ellipse(x2,y2,(r-w)*2,(r-w)*2);
    noFill();
  }
}

