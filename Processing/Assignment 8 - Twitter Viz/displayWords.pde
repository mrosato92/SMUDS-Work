//FUNCTION FOR OUR DISPLAY WORDS VIEW
//RANDOMLY PLOTS WORDS ONTO THE WINDOW

class DisplayWords extends FetchTweets {
  int red;
  int green;
  int blue;
  DisplayWords(int r, int g, int b) {
    super();
    this.red = r;
    this.green = g;
    this.blue = b;
  }

  void displayWords() {
    frameRate(10);
    super.fetchTweets(); 

    //PLOT WORDS
    int i = (frameCount % words.size());
    String word = words.get(i);
    //PUT WORD IN RANDOM SPOT
    fill(red, green, blue, random(50, 150));
    //textSize(30);
    text(word, random(width), random(menuHeight, height));
  }
}

