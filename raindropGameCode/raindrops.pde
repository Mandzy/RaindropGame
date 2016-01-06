class Raindrop {
  PVector loc, vel, acc;
  float diam;
  

  Raindrop (float x, float y) {
    loc = new PVector (x, y);
    vel = new PVector (0,random (1, 10));
    acc = new PVector (0,.1);
    diam = random (5, 100);
  }
  void fall () {
    vel.add(acc);
    loc.add(vel);
  }
  void display () {
    fill (0, 0, 255);
    ellipse (loc.x, loc.y, diam, diam);
  }
  void reset () {
    loc.x= random(width);
    loc.y=0-diam;
    vel = new PVector (0,random (1, 10));
  }
  boolean isInContactWith (Bucket b) {
    if (loc.dist(b.loc)< diam/2  + b.diam/2 ) {
      return true;
    } else {
      return false;
    }
  }
}