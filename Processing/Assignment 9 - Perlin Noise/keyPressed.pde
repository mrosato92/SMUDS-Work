//Actions for when we press keys
//Pressing keys will change us between stuck mode and noise mode or display a new letter in the window
void keyPressed() {
  //CODED means that the key is a recognizable one
  if (key != CODED) {
    //Switch works like an if else, but is better when selecting between many alternatives
    switch(key) {
      //Toggle for noise mode - adjusts the Z axis
    case ENTER:
      noiseOn = !noiseOn;
      break;
      //Toggle for stuck mode 
    case TAB:
      stuckMode = !stuckMode;
      if (!stuckMode)
        for (Particle p : particles) {
          p.speed.mult(-1);
        }
      break;
      //Do not ocnsider any of the characters below
    case ' ':
    case ESC:
    case DELETE:
    case BACKSPACE:
      break;
      //Default action upon key switch -> display key pressed
    default:
      tx.process("" + key);
      break;
    }
  }
}

