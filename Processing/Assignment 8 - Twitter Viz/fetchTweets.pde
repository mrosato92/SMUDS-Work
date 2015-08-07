//OUR SUPER CLASS
//TWO PRIMARY FUNCTIONS
//fetchTweets() GRABS FULL TWEETS INTO A STRING AND INDIVIDUAL WORDS INTO THEIR OWN STRING
//cleanUp() REMOVES TWITTER JUNK FOR FUTURE WORD ANALYSIS

class FetchTweets {
  String user = "";
  String msg = "";
  String[] input;
  String[] words_for_cloud;

  int fav;
  int ret;

  FetchTweets() {
    this.user = user;
    this.msg = msg;
    this.input = input;
    this.words_for_cloud = words_for_cloud;

  }

  void fetchTweets() {
    //GRAB FULL TWEETS
    for (int i=0; i<tweets.size(); i++) {
      Status t = (Status) tweets.get(i);
      user = t.getUser().getName();
      msg = t.getText();
      fav = t.getFavoriteCount();
      ret = t.getRetweetCount();

      //BREAK TWEETS INTO WORDS
      input = msg.split(" ");
      for (int j=0; j<input.length; j++) {
        words.add(input[j]);
      }
    }
  }
  
  void cleanUp() {
    words_for_cloud = msg.split(" ");
    //println(msg);
    //CLEAN UP WORDS
    for (int i=0; i<words_for_cloud.length; i++) {
      //REMOVE URLS FROM LIST
      if (words_for_cloud[i].contains("http") || words_for_cloud[i].contains("www") || words_for_cloud[i].contains(".com")) {
        words_for_cloud [i] = "";
      }

      //REMOVE ALL SPECIAL CHARACTERS
      words_for_cloud[i] = words_for_cloud[i].replaceAll("[^A-Za-z0-9]", "");
      words_for_cloud[i] = words_for_cloud[i].toLowerCase();
    }

    //SORT WORDS ALPHABETICALLY
    words_for_cloud = sort(words_for_cloud);
    //println(words_for_cloud);

    //REMOVE BLANK WORDS FROM STRING ARRAY
    for (int i=0; i<words_for_cloud.length; i++) {
      if (words_for_cloud[i].length()>0) {
        words_cloud.add(new Word(words_for_cloud[i]));
        break;
      }
    }
  }
}

