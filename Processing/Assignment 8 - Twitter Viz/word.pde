//FOUR PRIMARY FUNCTIONS
//initRandomPosition() PLACES WORDS RANDOMLY ABOUT THE CENTER OF THE WINDOW
//updatePosition() PLACES THE WORDS IN THEIR IDEAL POSITION BASED ON THEIR SIZE TO ELIMINATE OVERLAPPING
//updateMouse() PROVIDES WORD MOVEMENT BASED ON MOUSE CLICKS
//move() EXECUTES THE MOVEMENT

class Word {
  String word_;
  int appearance = 0; 
  float text_size = 0;
  PVector center_ = new PVector();
  float height_;
  float width_;

  Word(String word) {
    word_ = word;
    appearance = 1;
  }

  //PLACE WORDS RANDOMLY ABOUT THE CENTER OF THE WINDOW
  void initRandomPosition() {
    textSize(text_size);
    width_ = textWidth(word_);
    //GIVES TOTAL HEIGHT OF LINE
    height_ = textAscent()+textDescent();
    center_.x = random(width*.25, width*.75);
    center_.y = random(height*.25, height*.75);
  }

  //THIS FUNCTION ALLOWS THE WORDS TO FIND THEIR BEST POSITION DEPENDING ON THEIR HEIGHT AND WIDTH, SO THAT THERE IS NO OVERLAPPING
  void updatePosition(ArrayList<Word> other_words) {

    for (Word w : other_words) { 

      if ( w == this ) 
        continue;
      //CALCULATE DISTINCE BETWEEN CENTER OF SPECIFIC WORD AND CENTER OF THE WORD CLOUD
      PVector dis_vec = PVector.sub(w.center_, center_);
      //GRAB LENGTH OF DISTANCE
      float dir_length = dis_vec.mag(); 

      //CALCULATE MIN DISTANCE BETWEEN WORDS SO THEY DONT OVERLAP
      float diff_w = width_/2  + w.width_/2;
      float diff_h = height_/2 + w.height_/2;

      //CALCULATE BOUNDARY BOX
      float d_min = (float)sqrt(diff_w*diff_w + diff_h*diff_h);

      //CALCULATE DIFFERENCE BETWEEN BOUNDARY BOX RADIUS AND CURRENT WORD DISTANCE FROM CENTER
      float rest_dif = d_min - dir_length;
      if (rest_dif < 0) 
        rest_dif = 0;

      //DIVIDE REST_DIF BY 10
      float f = rest_dif/10;

      //NORMALIZE VECTOR TO LENGTH 1
      dis_vec.normalize();
      //MULTIPLY THE TWO TOGETHER
      PVector dir = PVector.mult(dis_vec, f);

      //KEEP WORDS INSIDE WINDOW
      //MULT = MULTIPLY FOR PVECTORS
      if (width_ >= w.width_) {
        w.move(dir);
        dir.mult(-.01);
        move(dir);
      } else {
        dir.mult(-1);
        move(dir);
        dir.mult(-.01);
        w.move(dir);
      }
    }
  }



  //MOUSE CLICKS WILL MOVE WORDS
  //MAG = LENGTH OF VECTOR
  //SUB = SUBTRACT
  void updateMouse(PVector mouse) {
    PVector dis_vec = PVector.sub(mouse, center_);
    float dir_length = dis_vec.mag();
    float f = 30/((float)sqrt(dir_length*dir_length*dir_length));
    if (f<0) 
      f=0;

   //LEFT CLICK AWAY FROM CENTER, RIGHT CLICK TOWARDS CENTER
    if (mouseButton == LEFT) {f = -f;} else {f = f;};
    dis_vec.mult(f);
    move(dis_vec);
  }


  //MOVE FUNCTION
  void move(PVector dir) {
    PVector np = PVector.add(center_, dir);
    center_.add(dir);
    //OFFSET - PIXEL SIZE OF BORDER AROUND SCREEN
    int offset = 20;
    float x_min = width_/2 + offset;
    float x_max = width - width_/2 - offset;
    float y_min = height_/2 + offset + menuHeight;
    float y_max = height - height_/2 - offset;
    
    //HOLD WORDS WITHIN BORDER
    if (center_.x < x_min) center_.x = x_min;
    if (center_.x > x_max) center_.x = x_max;
    if (center_.y < y_min) center_.y = y_min;
    if (center_.y > y_max) center_.y = y_max;
  }
}

