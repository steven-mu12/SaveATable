class Textbox {
  
   // variables
  
   int X = 0, Y = 0, H = 35, W = 200;
   int textSize = 26;
   
   // COLORS
   color background = color(140, 140, 140);
   color foreground = color(0, 0, 0);
   color backgroundSelected = color(160, 160, 160);
   color border = color(30, 30, 30);
   
   boolean borderEnable = false;
   int borderWeight = 1;
   
   String text = "";
   int textLength = 0;

   boolean selected = false;
   
   Textbox() {
      // CREATE OBJECT DEFAULT TEXTBOX
   }
   
   Textbox(int x, int y, int w, int h) {
      X = x; Y = y; W = w; H = h;
   }
   
   void DRAW() {

      if (selected) {
         fill(backgroundSelected);
      } 
      else {
         fill(background);
      }
      
      if (borderEnable) {
         strokeWeight(borderWeight);
         stroke(border);
      } 
      else {
         noStroke();
      }
      
      rect(X, Y, W, H);
      
      // DRAWING THE TEXT ITSELF
      fill(foreground);
      textSize(textSize);
      text(text, X + (textWidth("a") / 2), Y + textSize);
   }
   
   // IF THE KEYCODE IS ENTER RETURN 1
   // ELSE RETURN 0
   
   boolean KEYPRESSED(char KEY, int KEYCODE) {
      if (selected) {
         if (KEYCODE == (int)BACKSPACE) {
            backspace();
         } 
         else if (KEYCODE == 32) {
            // SPACE
            addText(' ');
         } 
         else if (KEYCODE == (int)ENTER) {
            return true;
         } 
         else {
            // CHECK IF THE KEY IS A LETTER OR A NUMBER
            boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
            boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
            boolean isKeyNumber = (KEY >= '0' && KEY <= '9');
      
            if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
               addText(KEY);
            }
         }
      }
      
      return false;
   }
   
   void addText(char t) {
      // IF THE TEXT WIDHT IS IN BOUNDARIES OF THE TEXTBOX
      if (textWidth(text + t) < W) {
         text += t;
         textLength++;
      }
   }
   
   void backspace() {
      if (textLength - 1 >= 0) {
         text = text.substring(0, textLength - 1);
         textLength--;
      }
   }
   
   // FUNCTION FOR TESTING IF THE POINT
   // OVER THE TEXTBOX
   
   boolean overBox(int x, int y) {
      if (x >= X && x <= X + W) {
         if (y >= Y && y <= Y + H) {
            return true;
         }
      }
      
      return false;
   }
   
   void pressed(int x, int y) {
      if (overBox(x, y)) {
         selected = true;
      } 
      else {
         selected = false;
      }
   }
}
