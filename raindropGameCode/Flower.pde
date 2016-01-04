class Flower {
  PVector loc;
  float diam;


  Flower () {
    loc = new PVector (mouseX, mouseY);
    diam = 200;
  }
  
  void show (){
    fill (255, 0, 0);
    ellipse (loc.x, loc.y, diam, diam); 
  }
  
  void update (){
    loc.set(mouseX,mouseY);
    
  }

 
  
  
  
  
  
  
  
  
}