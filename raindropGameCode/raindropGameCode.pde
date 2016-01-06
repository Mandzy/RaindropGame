//declared all variables
int count;
int gamestate;
int missed;
int s;
int fb;
int score;
PVector mouse;   //declare a P
//created arraylist
ArrayList <Raindrop> r;
Bucket b; 





void setup() {
  //initialize variables
  size(1200, 800);
  gamestate = 1;
  s= 0;
  missed = 0;
  score = 0;
  fb=0;
  count = 5;
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  b = new Bucket();
  r = new ArrayList <Raindrop>();      //initialize the ArrayList
  for (int i=0; i<count; i++) {
    r.add(new Raindrop (random(width), 0));
  }
}

void draw() {
  //gamestat 2 is the actual game where the raindrops fall
  if (gamestate==2) {
    background(0, 200, 255);
    textSize (20);
    //counters at the top of the screen 
    text ("Current drops in bucket:", 50, 50); 
    text (s, 100, 75);
    text ("Number of buckets", 1000, 50);
    text (fb, 1050, 75);
    text ("Score", 500, 50);
    text (score, 550, 75);
    rect (width/2, height +400 - (missed * 5), width, height);
    mouse.set(mouseX, mouseY);
    b.show();      //make bucket show
    b.update();    //keep updating the bucket so it continues to show
    for (int i=0; i<count; i++) {
      r.get(i).fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
      r.get(i).display();      //display the raindrop
      if (r.get(i).isInContactWith(b)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse

        if (s < 25) {
          r.get(i).reset();                         //if it is, reset the raindrop
          s++;
        }
      }
      if (r.get(i).loc.y > (height) - (missed * 5) + r.get(i).diam/2) {     //check to see if the raindrop goes below the bottom of the screen
        r.get(i).reset();            //if it does, reset the raindrop
        if (missed < 300) {          //if less then 500 are missed keep droping water 
          missed ++;
        }
        if (missed ==300) {         // if more then 500 are droped then go to the game over screen
          gamestate = 3;
        }
      }
    }
    //mousePressded to get rid of the 25 drops in the bucket
    if (mousePressed && s==25) { 
      s=0;
      fb++;
    }
    // after 5 buckets are droped score increases by 100
    if (fb==5) {
      missed -= 20;
      fb=0;
      score += 100;
    }
    //if score is 300 then you go to the win screen
    if (score==300) {
      gamestate=4;
    }
  }
  //gamestate one is the opening screen
  //explains the game
  else if (gamestate == 1) {
    background (230, 50, 70);
    textSize (72);
    text ("Rain Check", width/3, 100);
    textSize (40);
    text ("Collect the rain drops as quickly as you can.", 200, 200);
    text ("Click the mouse to dump your bucket once it gets filled at 25 drops.", 10, 300);
    text ("Be careful though. Don't drown!!!", 300, 400);
    text ("fill your bucket 5 times to drop the water level", 150, 500);
    text ("See if you can beat my high score of 300", 200, 600);
    text ("Press any key to START", 350, 700);
    if (keyPressed) {
      gamestate = 2;
    }
  }
  //this screen happens if the person drowns
  else if (gamestate == 3) {
    background (255, 0, 0);
    textSize (72);
    fill(255);
    text ("GAME OVER", 400, 300);
    fill(random(255), random (255), random(255));
    text("YOU DROWNED!!!", 300, 400);
    fill(255);
    text("Final Score", 400, 600);
    text(score, 500, 700);
    text ("Press any key to play again", 200, 500);
    if (keyPressed) {
      setup();
    }
    }
    //this screen happpens if the person beats the high score of 500
    else if (gamestate ==4) {
      background (0, 255, 0);
      fill (255);
      textSize (72);
      text ("YOU WIN!!!!", 400, 300);
      text ("Press any key to play again", 200, 500);
      if (keyPressed) {
        setup ();
      }
    }
  }