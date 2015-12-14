class Raindrop {
  PVector loc, vel;
  float diam;


  Raindrop (float x, float y) {
    loc = new PVector (x, y);
    vel = new PVector (random (1, 10), random (1, 10));
    diam = random (10, 150);
  }
  void fall () {
    loc.y += vel.y;
  }
  void display () {
    fill (0, 0, 255);
    ellipse (loc.x, loc.y, diam, diam);
  }
  boolean isInContactWith (PVector m) {
    if (m.dist(loc)<diam/2){
    return true;
    }
    else {
      return false;
    }
  }
  void reset () {
    loc.y = 0;
   }
}