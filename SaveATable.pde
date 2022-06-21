import java.io.BufferedWriter;
import java.io.FileWriter;

// Fonts
PFont PoppinsRegular;
PFont PoppinsSemibold;

// Images
PImage loadingBackground;
PImage logo;
PImage previousButton;

PImage fineItalianImage;
PImage niceChineseImage;
PImage greatIndianImage;

// PARAMETERS (PLEASE PLEASE DO NOT TOUCH)
int i = 0;
boolean clicked = false;

String usernameInputted;
String passwordInputted;

String loginMessage = "";
boolean loggedIn = false;

String signupUserInputted;
String signupPassInputted;
String signupPassConfirm;

String toBeAdded;

String currentUser;

// Creating Button Objects

Button loginButton;
Button signupButton;
Button returnButton;

Button loginButtonOn73;
Button signupButtonOn74;

Button reserveButton1;
Button reserveButton2;
Button reserveButton3;

// Creating Arraylists of boxes
ArrayList<Textbox> loginBoxes = new ArrayList<Textbox>();
ArrayList<Textbox> signupBoxes = new ArrayList<Textbox>();

// Creating restaurant objects
Restaurant fineItalian;
Restaurant niceChinese;
Restaurant greatIndian;


// -----------------------  
// -------- SETUP -------- 
// -----------------------

void setup(){
  size(450, 800);
  
  // loading the fonts
  PoppinsRegular = createFont("fonts/Poppins-Regular.ttf", 20);
  PoppinsSemibold = createFont("fonts/Poppins-SemiBold.ttf", 28);
  
  // loading the images
  loadingBackground = loadImage("images/background1.png");
  logo = loadImage("images/logo.png");
  fineItalianImage = loadImage("images/fineItalian.png");
  niceChineseImage = loadImage("images/niceChinese.png");
  greatIndianImage = loadImage("images/greatIndian.png");

  background(loadingBackground);
  
  // BUTTONS
  strokeWeight(0);
  fill(255);
  
  loginButton = new Button(99, 615, 252, 57, "Login", 23,151,191);
  signupButton = new Button(99, 700, 252, 57, "SIGNUP", 23,151,191);
  returnButton = new Button(64, 44, 150, 39, "Return", 255,255,255);
  
  loginButtonOn73 = new Button(99, 355, 252, 57, "Login", 23,151,191);
  signupButtonOn74 = new Button(99, 466, 252, 57, "Sign Up", 23,151,191);
  
  reserveButton1 = new Button(220, 250, 145, 38, "Reserve", 23,151,191);
  reserveButton2 = new Button(220, 430, 145, 38, "Reserve", 23,151,191);
  reserveButton3 = new Button(220, 610, 145, 38, "Reserve", 23,151,191);
  
  // Restaurants
  fineItalian = new Restaurant(32, 150, "Fine Italian", "123 Fictional Dr, Waterloo, ON", fineItalianImage);
  niceChinese = new Restaurant(32, 330, "Nice Chinese", "600 Laurelwood Dr, Waterloo, ON", niceChineseImage);
  greatIndian = new Restaurant(32, 510, "Great Indian", "69A 420th Ave, Waterloo, ON", greatIndianImage);
  
  // ACTUAL PROGRAM
  initLoginBoxes();
  initSignupBoxes();
  
  drawLoadingPage();
  
}

// ----------------------
// -------- DRAW -------- 
// ----------------------

void draw(){
  
  // the main screen
  
  if (i == 0){
    background(loadingBackground);
    delay(3000);
  }
  
  if (i < 72){
    background(loadingBackground);
    image(logo, 175, 300 - i, 100, 96);
    i += 3;
  }
  
  // the main page
  
  if (i == 72){
    
    background(loadingBackground);
    
    // writes the text
    textSize(20);
    textFont(PoppinsRegular);
    fill(255);
    textAlign(CENTER);
    text("Reservations Made Easy", 225, 370);
    
    // logo
    image(logo, 175, 300 - 72, 100, 96);
    
    // this is where the button goes
    
    loginButton.render();
    signupButton.render();
    
    if (loginButton.isClicked()){
      i = 73;
    }
    
    loginButton.update();
    
    if (signupButton.isClicked()){
      i = 74;
    }
    
    signupButton.update();
    
  }
  
  // the login page
  
  if (i==73){
    background(loadingBackground);
    
    for (Textbox t: loginBoxes){
      t.DRAW();
    }
    
    textFont(PoppinsRegular);
    fill(255);
    textSize(20);
    
    textAlign(LEFT);
    text("Full Name", 64, 115);
    text("Password", 64, 225);
    
    returnButton.render();
    textAlign(LEFT);
    
    loginButtonOn73.render();
    textAlign(LEFT);
    
    if (returnButton.isClicked()){
      loginBoxes.get(0).text = "";
      loginBoxes.get(1).text = "";
      
      signupBoxes.get(0).text = "";
      signupBoxes.get(1).text = "";
      signupBoxes.get(2).text = "";
      
      loginMessage = "";
      
      i = 72;
    }
    
    textAlign(LEFT);
    returnButton.update();
    
    if (loginButtonOn73.isClicked()){
      // take the data from the two boxes
      usernameInputted = loginBoxes.get(0).text;
      passwordInputted = loginBoxes.get(1).text;
      
      loginUserCheck(usernameInputted, passwordInputted);
      
      if (loggedIn == true){
        currentUser = usernameInputted;
        i = 100;
      }
    }
    
    // returns the message
    fill(253,0,0);
    textAlign(CENTER);
    text(loginMessage, 225,478);
    textAlign(LEFT);
    
    loginButtonOn73.update();
  }
  
  // the signup page
  
  if (i==74){
    background(loadingBackground);
    
    for (Textbox t: signupBoxes){
      t.DRAW();
    }
    
    textFont(PoppinsRegular);
    fill(255);
    textSize(20);
    
    textAlign(LEFT);
    text("Full Name", 64, 115);
    text("Password", 64, 225);
    text("Confirm Password", 64, 335);
    
    returnButton.render();
    textAlign(LEFT);
    
    signupButtonOn74.render();
    textAlign(LEFT);
    
    if (returnButton.isClicked()){
      loginBoxes.get(0).text = "";
      loginBoxes.get(1).text = "";
      
      signupBoxes.get(0).text = "";
      signupBoxes.get(1).text = "";
      signupBoxes.get(2).text = "";
      
      
      loginMessage = "";
      
      i = 72;
    }
    
    returnButton.update();
    
    if (signupButtonOn74.isClicked()){
      signupUserInputted = signupBoxes.get(0).text;
      signupPassInputted = signupBoxes.get(1).text;
      signupPassConfirm = signupBoxes.get(2).text;
      
      
      // verify the passwords
      if (registerPassCheck(signupPassInputted, signupPassConfirm) == true){
        // verify that another user with the same name doesn't exist
        if (usernameRepeatCheck(signupUserInputted) == true){
          
          loginMessage = "Successfully Signed Up";
          toBeAdded = signupUserInputted + "|" + signupPassInputted;
          appendTextToFile(outFilename, toBeAdded);
          
          currentUser = signupUserInputted;
          
          i = 100;
        
        }
        else{
          loginMessage = "Username already exists";
        }    
      }     
      else{
        loginMessage = "Passwords Are Not Matching";
      }
    }
    
    signupButtonOn74.update();
    
    // returns the message
    fill(253,0,0);
    textAlign(CENTER);
    text(loginMessage, 225,600);
    textAlign(LEFT);
    
  }
  
  
  // ------------------------
  // ----- THE MAIN APP -----
  // ------------------------
  
  // THE MAIN PAGE
  if (i==100){
    background(17,36,74);
    
    fill(255);
    textFont(PoppinsRegular);
    textSize(20);
    text("Welcome back,", 31,79);
    
    textFont(PoppinsSemibold);
    textSize(28);
    text(currentUser.toUpperCase(), 31,109);
    
    fill(217,217,217);
    ellipse(350,86,60,60);
    
    
    // THIS IS FOR THE RESTAURANT DISPLAY THINGS
    fineItalian.render();
    reserveButton1.render();
    reserveButton1.update();
    
    niceChinese.render();
    reserveButton2.render();
    reserveButton2.update();
    
    greatIndian.render();
    reserveButton3.render();
    reserveButton3.update();
    
    textAlign(LEFT);
    
    if (reserveButton1.isClicked()){
      i=101;
    }
    if (reserveButton2.isClicked()){
      i=102;
    }
    if (reserveButton3.isClicked()){
      i=103;
    }
    
  }
  
  
  // FINE ITALIAN
  if (i==101){
    background(17,36,74);
    fineItalian.renderPage();
  }
  
  //  NICE CHINESE
  if (i==102){
    background(17,36,74);
    niceChinese.renderPage();
  }
  
  //  GREAT INDIAN
  if (i==103){
    background(17,36,74);
    greatIndian.renderPage();
  }
  
  
}

// -------------------------
// ----- OTHER METHODS -----
// -------------------------


void mousePressed(){
  for (Textbox t: loginBoxes){
    t.pressed(mouseX, mouseY);
  }
  
  for (Textbox t: signupBoxes){
    t.pressed(mouseX, mouseY);
  }
}

void keyPressed(){
  textAlign(LEFT);
  for (Textbox t: loginBoxes){
    t.KEYPRESSED(key, keyCode);
  }
  
  for (Textbox t: signupBoxes){
    t.KEYPRESSED(key, keyCode);
  }
}
