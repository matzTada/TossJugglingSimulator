Ring[] ring = new Ring[16];

void setup() {
  size(600, 600); 
  frameRate(20);
  noStroke();
  for (int i = 0; i < ring.length; i++) {
    ring[i] = new Ring(200, 50, 30, 5);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < ring.length; i++) {
    ring[i].siteswap = i+1;
    ring[i].v0 = siteswaptov0(ring[i].siteswap);
  }
  for (int i = 0; i < ring.length; i++) {
    ring[i].t += dt; 
    ring[i].calculate();
  }
  for (int i = 0; i < ring.length; i++) {
    ring[i].x = i*35+30;
    fill(100);
    ring[i].display();
    noFill();
  }
  for (int i = 0; i < ring.length; i++) {
    PFont font = createFont("Calisto MT Bold Italic", 50);
    textFont(font);
    textAlign(CENTER);
    text(""+(i+1)+"", i*35+30+5, height-ring[i].y+15);
  }
  println("y="+ring[1].y+",vy="+ring[1].vy+",t="+ring[1].t+"");
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

