
class Button{
  
  // variables
  PVector pos = new PVector(0,0);
  float wid = 0;
  float hei = 0;
  color colour;
  String text;
  boolean hover = false;
  boolean click = false;
  
  // constructor
  Button(int x, int y, int w, int h, String t, int r, int g, int b){
    pos.x = x;
    pos.y = y;
    wid = w;
    hei = h;
    colour = color(r,g,b);
    text = t;
  }
  
  // function for the class
  void update(){
    if (mousePressed == true && mouseButton == LEFT && hover == false){
      
      hover = true;
      
      if (mouseX >= pos.x && mouseX <= pos.x + wid && mouseY >= pos.y && mouseY <= pos.y + hei){
        clicked = true;
      }   
    
      else{
        clicked = false;
        hover = false;
      }

    }
    
    if (mousePressed != true){
      clicked = false;
      hover = false;
    }
  }
  
  void render(){
    fill(colour);
    rect(pos.x, pos.y, wid, hei, 20);
    
    fill(0);
    textAlign(CENTER, CENTER);
    text(text, pos.x+(wid/2), pos.y+(hei/2-5));
  }
  
  boolean isClicked(){
    return hover;
  }
}
