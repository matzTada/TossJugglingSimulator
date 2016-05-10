import gifAnimation.*;
GifMaker gifMaker;

int mode = 1;
int sizex=300,sizey=300;

Spot[] sp = new Spot[30];

void setup(){
  size(sizex,sizey); 
  colorMode(HSB,100);
  frameRate(20);
  noStroke();
  smooth();
  for(int i = 0; i < sp.length; i++) sp[i] = new Spot(random(sizex), random(sizey), random(10,60), random(1,5),random(1,20),0,0,0, color(random(99)));
  //for(int i = 0; i < sp.length; i++) sp[i] = new Spot(random(360), random(360), random(10,60), random(1,5),random(1,20),0,0,0, color(random(99),100,100,100));
  //for(int i = 0; i < sp.length; i++) sp[i] = new Spot(i%10*60, i/10*60, 60, 5,10,0,0,0);

  gifMaker = new GifMaker(this, "EightRingSimulator4.gif");
  gifMaker.setRepeat(0);
  gifMaker.setDelay(60);
}

void draw(){
  background(99);
  for(int i = 0; i < sp.length; i++){
    if(mode == 1) sp[i].moveA();
    else if(mode == 2) sp[i].moveB();
    else if(mode == 3) sp[i].moveC();
  }
  for(int i = 0; i < sp.length; i++) sp[i].display();
  
  gifMaker.addFrame();
  if(frameCount >= 100){
    gifMaker.finish();
  //  exit();
  }
}

void keyPressed(){
  switch(key){
    case '1': mode = 1; break;
    case '2': mode = 2; break;
    case '3': mode = 3; break;
    case '6': for(int i = 0; i < sp.length; i++) sp[i].speed*=-1;break;
  }
}


