//import gifAnimation.*;
//GifMaker gifMaker;

int sequence[]= {
  //15ring
  15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 
  29, 27, 25, 23, 21, 19, 17, 15, 13, 11, 9, 7, 5, 3, 1, 29, 27, 25, 23, 21, 19, 17, 15, 13, 11, 9, 7, 5, 3, 1, 
  15, 16, 14, 15, 16, 14, 15, 16, 14, 15, 16, 14, 
  21, 19, 17, 15, 13, 11, 9, 21, 19, 17, 15, 13, 11, 9
    //11ring
  //11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 21, 19, 17, 15, 13, 11, 9, 7, 5, 3, 1, 11, 12, 10, 11, 12, 10, 11, 12, 10, 11, 12, 10, 13, 11, 9, 13, 11, 9, 13, 11, 9, 13, 11, 9, 15, 13, 11, 9, 7, 15, 13, 11, 9, 7, 15, 13, 11, 9, 7, 15, 13, 11, 9, 7
  //7ring
  //7, 7, 7, 7, 7, 7, 7, 13, 11, 9, 7, 5, 3, 1, 7, 8, 6, 7, 8, 6, 7, 13, 6, 6, 6, 6, 6, 6, 9, 6, 6, 9, 6, 6
  //6ring
  //6, 6, 6, 6, 6, 6, 12, 10, 8, 6, 4, 2, 0, 6, 7, 5, 6, 7, 5, 6, 12, 5, 5, 5, 5, 5, 5, 8, 5, 5, 8, 5, 5
};
Ring[] ring = new Ring[15];

float numberofring;
int lengthofsequence;
int startcounta[] = {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

float totaltime = 0;

void telljugglable() {
  int sequencesum = 0;
  lengthofsequence = sequence.length;
  for (int i=0; i<sequence.length; i++) sequencesum += sequence[i];
  if (sequencesum % lengthofsequence != 0) {
    println("Unjugglable!!!");
    exit();
  }
  numberofring = (float)sequencesum / lengthofsequence;
  println("numberofring="+numberofring+"");
}

void setup() {
  telljugglable();
  size(800, 600); 
  frameRate(100);
  noStroke();
  for (int i = 0; i < ring.length; i++) {
    ring[i] = new Ring(width/2, 0, random(20, 50), 5, (int)random(3, 9), 0.4);
  }
  //first siteswap
  for (int i = 0; i < ring.length; i++) {
    ring[i].seqflag = i % sequence.length;
    ring[i].siteswap = sequence[ring[i].seqflag];
    ring[i].vy = ring[i].v0 = siteswaptov0(ring[i].siteswap);
    ring[i].handflag = (i%2==0) ? -1 : 1;
    ring[i].dtheta *= (i%2==0) ? -1 : 1;
    ring[i].x = ring[i].x0 + ring[i].handflag * 0.5 * distance;  
    ring[i].vx = -1 * ring[i].handflag * siteswaptovx(ring[i].siteswap);
  }

  //gif save
  // gifMaker = new GifMaker(this, "RingTossSimmlatorFlat2.gif");
  // gifMaker.setRepeat(0);
  // gifMaker.setDelay(30);
}

void draw() {
  background(0);
  //for start
  totaltime+=dt;
  for (int i = 0; i  <ring.length; i++) {
    if (totaltime >= (i+1) * T) startcounta[i] = 1;
  } 
  //calculation
  for (int i = 0; i < ring.length; i++) {
    if (startcounta[i] == 1) {
      ring[i].t += dt; 
      ring[i].theta += ring[i].dtheta;
      ring[i].calculate();
    }
  }
  //display
  for (int i = 0; i < ring.length; i++) {
    fill(100);
    ring[i].display();
    noFill();
  }
  //display number for help
  for (int i = 0; i < ring.length; i++) {
    PFont font = createFont("Calisto MT Bold Italic", 50);
    textFont(font);
    textAlign(CENTER);
    text(""+ring[i].siteswap+"", 30+5, height-ring[i].y*0.25*0.5-50+15);
  }
  //display smaller for help
  for (int i = 0; i < ring.length; i++) {
    fill(255);
    ellipse(width*3/4+ring[i].x*0.25, height - ring[i].y* 0.125*0.5 -50, 5, 5);
  }

  //gif save
  //gifMaker.addFrame();
  //if (frameCount >= 390) {
  //  gifMaker.finish();
  //  //exit();
  //}
}

void keyPressed() {
  switch(key) {
  case '1':  
    break;
  case '2':  
    break;
  case '3':  
    break;
  }
}

