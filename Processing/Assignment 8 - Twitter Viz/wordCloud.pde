//TWO PRIMARY FUNCTIONS
//buildCloud() REDUCES OUR LIST TO UNIQUE WORDS WITH FREQUENCIES, TO PLOT BY SIZE IN A WORD CLOUD
//drawCloud() DRAWS OUR WORD CLOUD AND ITS MOTION CHARACTERISTICS

class Cloud extends FetchTweets {
  int min_size;
  int max_size;
  int red;
  int green;
  int blue;
  AlignType x;

  Cloud(int r, int g, int b, int min_size, int max_size, AlignType x) {
    super();
    this.min_size = min_size;
    this.max_size = max_size;
    this.red = r;
    this.green = g;
    this.blue = b;
    this.x = x;
  }

  void buildCloud() {
    super.fetchTweets();
    super.cleanUp();

    //CHECK FOR NUMBER OF WORD OCCURRENCES AND SAVE EACH WORD INTO ARRAY LIST SO THAT IT ONLY APPEARS ONCE
    for (int i=1; i<words_for_cloud.length; i++) {
      Word last_word = words_cloud.get(words_cloud.size()-1);
      String current_word = words_for_cloud[i];
      //INCREASE APPEARENCE COUNTER IF REPEAT, OTHERWISE ADD WORD TO ARRAY LIST
      if (current_word.equals(last_word.word_)) {
        last_word.appearance++;
      } else {
        words_cloud.add(new Word(words_for_cloud[i]));
        //println(current_word + " " + last_word + " ");
        //println(words_cloud);
      }
    }

    //FIND THE MIN AND MAX WORD OCCURRENCE FOR SIZE MAPPING
    int appearancemax = 0;                   // INITIALIZE AT 0, MAXIMUM CAN BE WORD CLOUD SIZE
    int appearancemin = words_cloud.size();   // INITIALIZE AT WORD CLOUD SIZE, MINIMUM CAN BE 1

    for (int i=0; i<words_cloud.size(); i++) {
      Word word = words_cloud.get(i);
      if (word.appearance > appearancemax)  appearancemax = word.appearance;
      if (word.appearance < appearancemin)  appearancemin = word.appearance;
    }

    //println("appearancemax = "+appearancemax);
    //println("appearancemin = "+appearancemin);

    //MAP WORD TEXT SIZE TO FIT ON SCREEN
    for (int i=0; i<words_cloud.size(); i++) {
      switch (x) {
      case LEFT:
        textAlign(LEFT, CENTER);
        break;
      case CENTER:
        textAlign(CENTER, CENTER);
        break;
      case RIGHT:
        textAlign(RIGHT, CENTER);
        break;
      }
      Word word = words_cloud.get(i);
      word.text_size = map(word.appearance, appearancemin, appearancemax, min_size, max_size);
    }

    //SET INITIAL RANDOM POSITION FOR EACH WORD
    for (int i=0; i<words_cloud.size(); i++) {
      words_cloud.get(i).initRandomPosition();
    }
}

  void drawCloud() {

    background(150);
    menu.display();
    //UPDATE WORD POSITION
    for (int i=0; i<words_cloud.size(); i++) {
      words_cloud.get(i).updatePosition(words_cloud);
    }

    //ALLOW MOUSE POSITION TO MOVE WORD CLOUD
    if (mousePressed) {
      PVector m = new PVector(mouseX, mouseY);
      for (int i=0; i<words_cloud.size(); i++) {
        words_cloud.get(i).updateMouse(m);
      }
    }

    //POPULATE WORDS ONTO SCREEN
    for (int i=0; i<words_cloud.size(); i++) {
      Word w = words_cloud.get(i);
      fill(red, green, blue);
      textSize(w.height_);
      text(w.word_, w.center_.x, w.center_.y);
    }
  }
}

