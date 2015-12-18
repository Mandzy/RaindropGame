class Raindrop {
  PVector loc, vel, acc;
  float diam;


  Raindrop (float x, float y) {
    loc = new PVector (x, y);
    vel = new PVector (random (1, 10), 0);
    acc = new PVector (0, .1);
    diam = random (10, 100);
  }
  void fall () {
    vel.add(acc);
    loc.add(vel);
  }
  void display () {
    fill (0, 0, 255);
    ellipse (loc.x, loc.y, diam, diam);
  }
  boolean isInContactWith (Bucket b) {
    if (loc.dist(b.loc)< diam/2  + b.diam/2 ) {
      return true;
    } else {
      return false;
    }
  }
  void reset () {
    loc.y = 0;
    loc.x= random(width);
  }
  boolean isdead (){
    
  }
}