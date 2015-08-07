//MARK ROSATO
//MID-TERM PROGRAMMING ASSIGNMENT
//TWITTER MENU

//REFERENCES
//https://www.youtube.com/watch?v=gwS6irtGK-c
//http://blog.blprnt.com/blog/blprnt/updated-quick-tutorial-processing-twitter
//Verlet World Demo for Menu
//http://www.openprocessing.org/sketch/48077

ConfigurationBuilder cb = new ConfigurationBuilder();
Twitter twitterInstance;
Query queryForTwitter;
QueryResult result;
FetchTweets theTweets;
DisplayTweets theTweetsList;
DisplayWords wordsList;
Cloud thisCloud;
WordLengths wl;
ArrayList tweets;
ArrayList<String> words = new ArrayList();
ArrayList<Word> words_cloud = new ArrayList<Word>();
Menu menu;

//ENTER TWITTER SEARCH STRING
String search = "#life";

//ENTER MENU HEIGHT
int menuHeight = 23;

void setup() {
  //CONNECT TO TWITTER
  cb.setOAuthConsumerKey("lqM0i79Uwy8xSnFKv3428q7yC"); 
  cb.setOAuthConsumerSecret("LagenoOdfMXNnj1LahxFWtSu0e05kdzyXmFKGlvm4rcAK8k99V"); 
  cb.setOAuthAccessToken("385546971-IsN1RjrdP1CzHoEXKjyhdrR7oo1hQp5DCeRiNCeP");  
  cb.setOAuthAccessTokenSecret("04764mSWLRgTYhipTg6bzUyFhThS0H1m6JBaJFjznOv3i"); 

  twitterInstance = new TwitterFactory(cb.build()).getInstance();

  //WINDOW SIZE
  size(640, 440);

  //MENU LABELS
  String[] labels = {
    "display_tweets", "display_words", "word_cloud", "length_chart"
  };

  //MENU STATES
  color[] states = {
    //offState, onState, overState, pressState
    #eebfbb, 0, #eeffef, #ffaa66
  };

  //INITIALIZE MENU
  menu = new Menu(Layout.TOP, new Dimension(width, menuHeight), labels, states, ButtonType.RECT);

  //GRAB TWEETS
  try {
    queryForTwitter = new Query(search); 
    result = twitterInstance.search(queryForTwitter);
    tweets = (ArrayList) result.getTweets();
  }
  catch(TwitterException te) {
    println("Couldn't Connect: " + te);
  }

  //FETCH TWEETS AND TWEETS BROKEN INTO SINGLE WORDS
  theTweets = new FetchTweets();
  theTweets.fetchTweets();

  //BUILD LIST OF FULL TWEETS IN ONE COLOR.  INCLUDE FAVORITE AND RETWEET INFORMATION IF DESIRED
  //(RED, BLUE, GREEN, RETWEET INFO, FAVORITE INFO)
  theTweetsList = new DisplayTweets(50, 255, 50, true, true);

  //BUILD LIST OF WORDS IN ONE COLOR AND VARIOUS SIZES
  //(RED, BLUE, GREEN)
  wordsList = new DisplayWords(50, 255, 50);

  //(RED, BLUE, GREEN, MIN SIZE, MAX SIZE, TEXT ALIGN TYPE)
  thisCloud = new Cloud(50, 255, 50, 20, 40, AlignType.LEFT);
  thisCloud.buildCloud();

  wl = new WordLengths();
  wl.lengthCheck();
}

void draw() {
  background(150);
  menu.display();

  if (menu.getSelected() == "word_cloud") {
    thisCloud.drawCloud();
  } else if (menu.getSelected() == "length_chart") {
    wl.lengthDisplay();
  } else if (menu.getSelected() == "display_tweets") {
    theTweetsList.listTweets();
  } else if (menu.getSelected() == "display_words") {
    wordsList.displayWords();
  }
}

