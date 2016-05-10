//import gifAnimation.*;
//GifMaker gifMaker;

int sequence[]= {
  7, 7, 7, 7, 7, 7, 7, 13, 11, 9, 7, 5, 3, 1, 7, 8, 6, 7, 8, 6, 7, 13, 6, 6, 6, 6, 6, 6//7ring
};
Ring[] ring = new Ring[7];

float numberofring;
int lengthofsequence;
int startcounta[] = {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
  size(400, 600); 
  frameRate(20);
  noStroke();
  for (int i = 0; i < ring.length; i++) {
    ring[i] = new Ring(200, 0, 30, 5);
  }
  //first siteswap
  for (int i = 0; i < ring.length; i++) {
    ring[i].seqflag = i % sequence.length;
    ring[i].siteswap = sequence[ring[i].seqflag];
    ring[i].vy = ring[i].v0 = siteswaptov0(ring[i].siteswap);
    ring[i].handflag = (i%2==0) ? -1 : 1;
    ring[i].x = ring[i].x0 + ring[i].handflag * 0.5 * distance;  
    ring[i].vx = -1 * ring[i].handflag * siteswaptovx(ring[i].siteswap);
  }

  //gif save
  //gifMaker = new GifMaker(this, "RingTossSimmlatorFlat2.gif");
  //gifMaker.setRepeat(0);
  //gifMaker.setDelay(30);
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
    text(""+ring[i].siteswap+"", 30+5, height-ring[i].y*0.8-50+15);
  }
  //display smaller for help
  for (int i = 0; i < ring.length; i++) {
    fill(255);
    ellipse(325+ring[i].x*0.25, height - ring[i].y* 0.25 -50, 5, 5);
  }

  //gif save
  //gifMaker.addFrame();
  //if (frameCount >= 390) {
   // gifMaker.finish();
   // //exit();
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

