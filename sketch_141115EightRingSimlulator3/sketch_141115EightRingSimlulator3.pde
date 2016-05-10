int mode = 1;

Spot sp1, sp2;

void setup(){
  size(400,400); 
  frameRate(20);
  noStroke();
  sp1 = new Spot(145, 200, 30, 5,10,0,0,0);
  sp2 = new Spot(255, 200, 30, 5,10,0,0,0);
}

void draw(){
  background(0);
  if(mode == 1){
    sp1.moveA();
    sp2.moveA();
  }else if(mode == 2){
    sp1.moveB();
    sp2.moveB(); 
  }else if(mode == 3){
    sp1.moveC();
    sp2.moveC(); 
  }
  sp1.display();
  sp2.display();
  println(""+sp1.angle+","+sp2.angle+"");
}

void keyPressed(){
  switch(key){
    case '1': mode = 1; break;
    case '2': mode = 2; break;
    case '3': mode = 3; break;
    case '4': sp1.speed*=-1; break;
    case '5': sp2.speed*=-1; break;
    case '6': sp1.speed*=-1; sp2.speed*=-1; break;
    
    case 'a': sp1.dx-=10; break;
    case 'w': sp1.dy-=10; break;
    case 'd': sp1.dx+=10; break;
    case 'x': sp1.dy+=10; break;
    
    case 'h': sp2.dx-=10; break;
    case 'u': sp2.dy-=10; break;
    case 'k': sp2.dx+=10; break;
    case 'm': sp2.dy+=10; break;  
  }
}


