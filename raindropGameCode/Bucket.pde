class Bucket {
  PVector loc;
  float diam;


  Bucket () {
    loc = new PVector (mouseX, mouseY);
    diam = 200;
      rectMode(CENTER);
  }
  
  void show (){
    fill (255, 0, 0);
    rect (loc.x, loc.y, diam, diam); 
  }
  
  void update (){
    loc.set(mouseX,mouseY);
    
  }

 
  
  
  
  
  
  
  
  
}