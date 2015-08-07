//TWO PRIMARY FUNCTIONS
//lengthCheck() CREATES A TABLE OF EACH CLEANED UP WORD, ITS ALPHABETICAL POSITION, AND ITS LENGTH IN CHARACTERS
//lengthDisplay() CREATES A LINE CHART PLOTTING THE WORDS ALPHABETICALLY AGAINST THEIR CHARACTER LENGTH

class WordLengths extends FetchTweets {
  StringList words_for_length;
  Table lengthTable;
  int minLength;
  int maxLength;

  WordLengths() {
    super();
    this.words_for_length = words_for_length;
    this.lengthTable = lengthTable;
    this.minLength = minLength;
    this.maxLength = maxLength;
  };


  void lengthCheck() {
    super.fetchTweets();
    super.cleanUp();

    words_for_length = new StringList();
    lengthTable = new Table();
    lengthTable.addColumn("word_name");
    lengthTable.addColumn("word_length");
    lengthTable.addColumn("word_pos");

    //REMOVE BLANK WORDS FROM STRING ARRAY
    for (int i=0; i<words_for_cloud.length; i++) {
      if (words_for_cloud[i].length()>0) {
        words_for_length.append(words_for_cloud[i]);
      }
    }

    String[] shortenedList = words_for_length.array();

    for (int i=0; i<shortenedList.length; i++) {
      String current_word = shortenedList[i];
      int wordLength = shortenedList[i].length();
      int wordPos = i+1;
      //println(current_word +" "+ wordLength +" "+wordPos);
      TableRow newRow = lengthTable.addRow();
      newRow.setString("word_name", current_word);
      newRow.setInt("word_length", wordLength);
      newRow.setInt("word_pos", wordPos);

      TableRow row = lengthTable.getRow(i);
      println(row.getString("word_name") +" "+ row.getString("word_length") +" "+ row.getString("word_pos"));
    }
  }


  void lengthDisplay() {

    beginShape();
    strokeWeight(3);
    stroke(0);
    noFill();
    for (int i=0; i<lengthTable.getRowCount(); i++) {
      float x = map(lengthTable.getInt(i, "word_pos"), 1, lengthTable.getRowCount(), 20, width-20);
      float y = map(lengthTable.getInt(i, "word_length"), 1, 20, height-30, 30);
      vertex(x, y);
      String wordName = lengthTable.getString(i, "word_name");
      textAlign(CENTER);
      textSize(16);
      text(wordName, x, y-50);
    }
    endShape();
    
    textSize(10);
    text("X = Alphabetical Word Sequence.  Y = Word Length", width/2,height-10);

    strokeWeight(0);
    fill(255);
    
    //DRAW X LABELS
    for (int i=1; i <lengthTable.getRowCount ()+1; i++) {
      float xx = map(i, 1, lengthTable.getRowCount(), 20, width-20);
      textSize(10);
      text(i, xx-2, height-20);
      line(xx, 30, xx, height-30);
    }

    //DRAW Y LABELS
    for (int i=1; i<=20; i++) {
      float yy = map(i, 1, 20, height-30, 30);
      textAlign(RIGHT);
      textSize(10);
      text(i, 15, yy+3);
      line(20, yy, width-20, yy);
    }
  }
}

