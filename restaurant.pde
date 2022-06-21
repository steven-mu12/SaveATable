
class Restaurant{
  // variables
  int pageDisplayX;
  int pageDisplayY;
  int pageDisplayW = 377;
  int pageDisplayH = 161;
  
  String name;
  String address;
  
  PImage image;
  
  // constructor
  Restaurant(int x, int y, String n, String a, PImage picture){
    pageDisplayX = x;
    pageDisplayY = y;
    name = n;
    address = a;
    image = picture;
  }
  
  
  // methods
  
  void render(){
    textAlign(LEFT);
    
    fill(255);
    rect(pageDisplayX, pageDisplayY, pageDisplayW, pageDisplayH, 20);
    
    // print out the title
    fill(0);
    textFont(PoppinsSemibold);
    textSize(20);
    text(name, pageDisplayX+160, pageDisplayY+30);
    
    // print out the address
    fill(0);
    textFont(PoppinsRegular);
    textSize(13);
    text(address, pageDisplayX+160, pageDisplayY+50);
    
    // put the image where it's supposed to be
    image(image, pageDisplayX+15, pageDisplayY+15, 125, 125);
  }
  
  void renderPage(){
    textAlign(LEFT);
    
    fill(255);
    textFont(PoppinsSemibold);
    textSize(30);
    text(name, 36, 73);
  }
  
}
