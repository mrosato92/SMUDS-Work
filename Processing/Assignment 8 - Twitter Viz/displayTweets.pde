//FUNCTION FOR OUR DISPLAY LISTS VIEW
//NEATLY ARRANGES FULL TWEETS IN THE WINDOW

class DisplayTweets extends FetchTweets {
  int red;
  int green;
  int blue;
  boolean favorite;
  boolean retweet;



  DisplayTweets(int r, int g, int b, boolean favorite, boolean retweet) {
    super();
    this.red = r;
    this.green = g;
    this.blue = b;
    this.retweet = retweet;
    this.favorite = favorite;
  }


  void listTweets() {
    super.fetchTweets();
    int i = 0;

    //give me all tweets nicely ordered
    fill(red, green, blue);
    textSize(12);
    if (favorite == true && retweet == true) {
      text(user + ": " + msg + ". Favorited " + fav + " time(s).  Retweeted " + ret + " time(s).", 
      20, 30+i*30+mouseY, width-20, 120);
    }
    if (favorite == true && retweet == false) {
      text(user + ": " + msg + ". Favorited " + fav + " time(s).", 
      20, 30+i*30+mouseY, width-20, 120);
    }
    if (favorite == false && retweet == true) {
      text(user + ": " + msg + ". Retweeted " + ret + " time(s).", 
      20, 30+i*30+mouseY, width-20, 120);
    } else text(user + ": " + msg, 
    20, 30+i*30+mouseY, width-20, 120);
  }
}

