float dt = 0.25;
float T = 3;//if siteswap = 5, it takes 5T = 50 (time unit) to drop down
float g = -10;
float distance = 600;

class Ring {
  //property
  float x, y, vx, vy, r, w, x0, y0, v0, t, theta, dtheta;
  int segment, siteswap, seqflag, handflag;//LEFT handflag = -1, RIGHT 1 
  //constructa
  Ring(float _x0, float _y0, float _r, float _w, int _segment, float _dtheta) {
    x0 = _x0;
    y0 = _y0;
    r = _r;
    w = _w;
    segment = _segment;
    dtheta = _dtheta;
  }

  //calculate method
  void calculate() {
    x = x0 + handflag * 0.5 * distance + vx * t;//uniform linear motion
    vy = v0 + g * t;
    y = y0 + v0 * t + 0.5 * g * t * t;
    if (t >= T * (float)siteswap) {
      if (siteswap%2!=0) {
        handflag*=-1;
        dtheta*=-1;
      }
      seqflag = newseqflag(siteswap, seqflag, lengthofsequence);
      siteswap = sequence[seqflag];
      vx = - handflag * siteswaptovx(siteswap);
      x = x0 + handflag * 0.5 * distance;
      vy = v0 = siteswaptov0(siteswap);
      y = y0; 
      t = 0;
    }
  }  
  //display method
  void display() {
    fill(255);
    drawRing(x, height-y*0.125-50, r, (r-w), segment, theta);
    noFill();
  }
}


float siteswaptov0(int number) {//return proper v0 of the number of siteswap
  return - (float)number * g * T / 2;
}
float siteswaptovx(int number) {
  if (number%2==0) return 0;
  else return distance / ((float)number * T);
}

int newseqflag(int postsiteswap, int postseqflag, int lengthofsequence) {
  int newseqflag = postseqflag + postsiteswap % lengthofsequence;
  if (newseqflag >= lengthofsequence) newseqflag %= lengthofsequence;
  return newseqflag;
}

void drawRing(float x, float y, float w1, float w2, int segments, float theta)
{
  // w1 == outer radius, w2 == inner radius.
  float deltaA = (1.0/(float)segments)*TWO_PI;
  beginShape(QUADS);
  for (int i=0; i<segments; i++)
  {
    vertex(x+w1*cos(i*deltaA + theta/segments), y+w1*sin(i*deltaA + theta/segments));
    vertex(x+w2*cos(i*deltaA + theta/segments), y+w2*sin(i*deltaA + theta/segments));
    vertex(x+w2*cos((i+1)*deltaA + theta/segments), y+w2*sin((i+1)*deltaA + theta/segments));
    vertex(x+w1*cos((i+1)*deltaA + theta/segments), y+w1*sin((i+1)*deltaA + theta/segments));
  }
  endShape();
} 

