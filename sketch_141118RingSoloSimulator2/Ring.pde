float dt = 0.25;
float T = 3;//if siteswap = 5, it takes 5T = 50 (time unit) to drop down
float g = -10;

class Ring {
  //property
  float x, y, vy, r, w, y0, v0, t;
  int siteswap, seqflag;
  //constructa
  Ring(float _x, float _y0, float _r, float _w) {
    x = _x;
    y0 = _y0;
    r = _r;
    w = _w;
  }

  //calculate method
  void calculate() {
    vy = v0 + g * t;
    y = y0 + v0 * t + 0.5 * g * t * t;
    if (t >= T * (float)siteswap) {
      seqflag = newseqflag(siteswap, seqflag, lengthofsequence);
      siteswap = sequence[seqflag];
      vy = v0 = siteswaptov0(siteswap);
      y = y0; 
      t = 0;
    }
  }  

  //display method
  void display() {
    fill(255);
    drawRing(x, height-y*0.8-50, r, (r-w));
    noFill();
  }
}


float siteswaptov0(int number) {//return proper v0 of the number of siteswap
  return - (float)number * g * T / 2;
}

int newseqflag(int postsiteswap, int postseqflag, int lengthofsequence) {
  int newseqflag = postseqflag + postsiteswap % lengthofsequence;
  if (newseqflag >= lengthofsequence) newseqflag %= lengthofsequence;
  return newseqflag;
}

void drawRing(float x, float y, float w1, float w2)
{
  int segments = 32;
  // w1 == outer radius, w2 == inner radius.
  float deltaA=(1.0/(float)segments)*TWO_PI;
  beginShape(QUADS);
  for (int i=0; i<segments; i++)
  {
    vertex(x+w1*cos(i*deltaA), y+w1*sin(i*deltaA));
    vertex(x+w2*cos(i*deltaA), y+w2*sin(i*deltaA));
    vertex(x+w2*cos((i+1)*deltaA), y+w2*sin((i+1)*deltaA));
    vertex(x+w1*cos((i+1)*deltaA), y+w1*sin((i+1)*deltaA));
  }
  endShape();
} 

