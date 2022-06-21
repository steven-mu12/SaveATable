

// VARAIBLES
String checkedUser;
String checkedPass;
int indexOfLine;
String outFilename = "users.txt";


void drawLoadingPage(){
  
  // DRAW THE ORIGINALLY STARTING SCREEN
  
  image(loadingBackground, 0, 0);
  image(logo, 150, 300, 150, 144);
  
  textSize(20);
  textFont(PoppinsRegular);
  text("Reservations Made Easy", 105, 775);
  fill(255);
}

// INITIALIZING THE TEXTBOXES

void initLoginBoxes(){
  Textbox loginName = new Textbox();
  Textbox loginPass = new Textbox();
  
  loginName.W = 322;
  loginName.H = 58;
  loginName.X = 64;
  loginName.Y = 135;
  
  loginPass.W = 322;
  loginPass.H = 58;
  loginPass.X = 64;
  loginPass.Y = 245;
 
  loginBoxes.add(loginName);
  loginBoxes.add(loginPass);
}

void initSignupBoxes(){
  Textbox signupName = new Textbox();
  Textbox signupPass = new Textbox();
  Textbox confirmPass = new Textbox();
  
  signupName.W = 322;
  signupName.H = 58;
  signupName.X = 64;
  signupName.Y = 135;
  
  signupPass.W = 322;
  signupPass.H = 58;
  signupPass.X = 64;
  signupPass.Y = 245;
  
  confirmPass.W = 322;
  confirmPass.H = 58;
  confirmPass.X = 64;
  confirmPass.Y = 356;

  signupBoxes.add(signupName);
  signupBoxes.add(signupPass);
  signupBoxes.add(confirmPass); 
  
}

// LOGIN FUNCTION

void loginUserCheck(String usernameInputted, String passwordInputted){
  String[] existingUsers = loadStrings("data/users.txt");
  
  for (int i = 0 ; i < existingUsers.length; i++) {
    indexOfLine = existingUsers[i].indexOf("|");
    checkedUser = existingUsers[i].substring(0, indexOfLine);
    checkedPass = existingUsers[i].substring(indexOfLine+1);
    
    if (checkedUser.equals(usernameInputted) == true){
      if (checkedPass.equals(passwordInputted) == true){
        println("Good User");
        loginMessage = "";
        
        loggedIn = true;
      }
      else{
        println("Wrong Password");
        loginMessage = "User Exists, Password Wrong";
      }
    
    }
    
    else{
      loginMessage = "No Such User Found";
    }
    
  }
}

// REGISTRATION PASSWORD CHECKER

boolean registerPassCheck(String password, String confirmPassword){
  if (password.equals(confirmPassword) == true){
    return true;
  }
  else{
    return false;
  }
}

// REGISTRATION USER REPEAT CHECKER

boolean usernameRepeatCheck(String usernameInputted){
  String[] existingUsers = loadStrings("data/users.txt");
    
  for (int i = 0 ; i < existingUsers.length; i++) {
    indexOfLine = existingUsers[i].indexOf("|");
    checkedUser = existingUsers[i].substring(0, indexOfLine);
    
    if (checkedUser.equals(usernameInputted) == true){
      return false;
    }
  }
  return true;
}

// FUNCTION TO WRITE TO FILE

void appendTextToFile(String filename, String text){
  File f = new File(dataPath(filename));
  
  try {
    PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));
    out.println(text);
    out.close();
  }
  catch (IOException e){
    e.printStackTrace();
  }
}


// DRAW MAIN PAGE
