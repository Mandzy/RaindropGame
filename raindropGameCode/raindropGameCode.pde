int count;
int gamestate;
int missed;
int s;
PVector mouse;   //declare a P
ArrayList <Raindrop> r;
//Raindrop [] r = new Raindrop [count] ;      //declare a new Raindrop called r
Bucket b; 

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);
  gamestate = 1;
  s= 0;
  missed = 0;
  count = 5;
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  b = new Bucket();
  r = new ArrayList <Raindrop>();
  for (int i=0; i<count; i++) {
    //r[i] = new Raindrop (random(width), 0);   //Initialize r. The parameters used are the initial x and y positions
    r.add(new Raindrop (random(width), 0));
  }
}

void draw() {
  if (gamestate==2) {
    background(0, 200, 255);
    textSize (20);
    text ("Current drops in bucket:", 50, 50); 
    text (s, 100, 75);
    rect (width/2, height +400 - (missed * 50), width, height);
    mouse.set(mouseX, mouseY);
    b.show();
    b.update();
    for (int i=0; i<count; i++) {
      r.get(i).fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
      r.get(i).display();      //display the raindrop
      if (r.get(i).isInContactWith(b)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
        r.get(i).reset();                         //if it is, reset the raindrop
        s++;
      }
      if (r.get(i).loc.y > (height) - (missed * 50) + r.get(i).diam/2) {     //check to see if the raindrop goes below the bottom of the screen
        r.get(i).reset();            //if it does, reset the raindrop
        if (missed < 16) {
          missed ++;
        }
      }
    }
  }
   else if (gamestate == 1) {
      background (230, 50, 70);
      textSize (72);
      text ("Rain Check", width/3, height/4);
      textSize (40);
      text ("Collect the rain drops as quickly as you can.", 200, 300);
      text ("Dump your bucket once it gets filled at 25 drops.", 200, 400);
      text ("Be careful though. Don't drown!!!", 300, 500);
      text ("fill your bucket 5 times, click your mouse to drop the water", 25, 600);
      text ("Press any key to START", 400, 700);
      if (keyPressed){
        gamestate = 2;
      }
    }
  }