class Render {
  public void menu() { // menu section 
    //diplay
    image(underworld, 0, 0, width, height);
    fill(0);
    rect(width/1.5, 550, 250, 100);
    rect(width/2.5, 550, 250, 100);
    rect(width/7.5, 550, 250, 100);
    fill(100);
    textSize(75);
    text("Menu", width/2-75, 200);
    textSize(55+10);
    text("Upgrade", width/1.5, 550, 250, 100);
    if (resume == false) {
      text("Start", width/2.5+48, 550, 250, 100);
    }
    if (resume) {
      text("Resume", width/2.5+20, 550, 250, 100);
    }
    text("Players", width/7.5+25, 550, 250, 100);
    //functions
    if (mousePressed && mouseX < width/1.5+250 && mouseX > width/1.5 && mouseY < 550+100 && mouseY > 550 && playerSelect == false) {//upgrade
    upgrade = true; 
    }
    if (mousePressed && mouseX < width/2.5+250 && mouseX > width/2.5 && mouseY < 550+100 && mouseY > 550 && playerSelect == false) {//Start
      resume = true;
      inGame = true;
    }
    if (mousePressed && mouseX < width/7.5+250 && mouseX > width/7.5 && mouseY < 550+100 && mouseY > 550 && playerSelect == false) {//Players
      playerSelect = true;
    }
    if (playerSelect) {
      this.playerSelection();
    }
    if (upgrade) {
      upgrades(); 
    }
  }
  public void playerSelection() {// player section 
    // display
    image(underworld, 0, 0, width, height);
    fill(0);
    rect(width/1.5, 550, 250, 100);
    rect(width/7.5, 550, 250, 100);
    rect(width/7.5, 50, 250, 100);
    fill(100);
    textSize(100);
    text(">", width/1.5+100, 550+85);
    text("<", width/7.5+100, 550+85);
    textSize(75);
    text("Back", width/7.5+50, 50, 250, 100);
    // functions
    if (mousePressed && mouseX < width/1.5+250 && mouseX > width/1.5 && mouseY < 550+100 && mouseY > 550 && selectReleased) {//left
      slider += 1;
      selectReleased = false;
    }
    if (mousePressed && mouseX < width/7.5+250 && mouseX > width/7.5 && mouseY < 550+100 && mouseY > 550 && selectReleased) {//right
      slider -= 1;
      selectReleased = false;
    }
    if (mousePressed && mouseX < width/7.5+250 && mouseX > width/7.5 && mouseY < 50+100 && mouseY > 50 && selectReleased) {//back
      selectReleased = false;
      playerSelect = false;
    }
    if (slider == 1) {
      image(odyseuss, width/2-71, 100, 71*2, 151*2);
      fill(0);
      textSize(20);
      text("Odysuess has a son named Telemachus and a wife named Penelope. He is an enemy of Poseidon.", width/2-100, 425, 300, 1000);
    player.name = "odyseuss";
    }
    if (mousePressed == false) {
      selectReleased = true;
    }
    if (slider == 2) {
        image(penLeft, width/2-71, 100, 71*2, 151*2);
      fill(0);
      textSize(20);
      text("Penelope is Odysuess's Wife. She has a son named Telemachus.", width/2-100, 425, 300, 1000);
      player.name = "pen";
    }
    if (slider > 2){
        slider = 1; 
    }
    if (slider < 1){
        slider = 2; 
    }
  }
  public void upgrades(){ // upgrade section 
 image(underworld, 0, 0, width, height); 
 fill(0); 
 rect(585,405,50,50); 
  rect(585,525,50,50); 
  rect(585,525+120,50,50); 
  fill(100); 
text("Damage",510,380);
  text("Protection",480,500); 
  text("Health",520,500+120); 
  textSize(80); 
  fill(255); 
  text("+",590,455); 
  text("+",590,575); 
  text("+",590,575+120); 
  }
  public void inGame() {
    image(underworld, 0, 0, width, height);
  }
  public void playerAnimation() { // normal player animation 
    if (player.name == "odyseuss") {// odysseus animation
      if (key == 'a' || key == 'A') {
        player.targetPlayerSprite = odyseussLeft;
        odyseussPosMemory = odyseussLeft;
      }
      if (key == 'd' || key == 'D') {
        player.targetPlayerSprite = odyseussRight;
        odyseussPosMemory = odyseussRight;
      }
      if (key == 'w' || key == 'W'|| key == 's' || key == 'S') {
        player.targetPlayerSprite = odyseussPosMemory;
      }
      player.sizeX = 71;
      player.sizeY = 151;
      player.placementX = 0;
      player.placementY = 0;
    } else if (player.name == "pen") {// penelopie animaton 
      if (key == 'a' || key == 'A') {
        player.targetPlayerSprite = penLeft;
        odyseussPosMemory = penLeft;
      }
      if (key == 'd' || key == 'D') {
        player.targetPlayerSprite = penRight;
        odyseussPosMemory = penRight;
      }
      if (key == 'w' || key == 'W'|| key == 's' || key == 'S') {
        player.targetPlayerSprite = odyseussPosMemory;
      }
      player.sizeX = 71;
      player.sizeY = 151;
      player.placementX = 0;
      player.placementY = 0;
    }
    //define new charecters here using "else if" command 
  

  if (mousePressed && keyPressed == false && hitTime) {// fighting player animation 
    if (player.name == "odyseuss") { // odysseus animation
      if (key == 'a' || key == 'A') {
        player.targetPlayerSprite =  odyseussFightAnimationL;
        fightAnimationMemory = odyseussFightAnimationL;
      }
      if (key == 'd' || key == 'D') {
        player.targetPlayerSprite =  odyseussFightAnimationR;
        fightAnimationMemory = odyseussFightAnimationR;
      }
      if (key == 'w' || key == 'W'|| key == 's' || key == 'S') {
        player.targetPlayerSprite =  fightAnimationMemory;
      }
      player.sizeX = 171;
      player.sizeY = 251;
      player.placementX = -50;
      player.placementY = -50;
    } else if (player.name == "pen") { // penelopie animaton 
      if (key == 'a' || key == 'A') {
        player.targetPlayerSprite =  odyseussFightAnimationL;
        fightAnimationMemory = odyseussFightAnimationL;
      }
      if (key == 'd' || key == 'D') {
        player.targetPlayerSprite =  odyseussFightAnimationR;
        fightAnimationMemory = odyseussFightAnimationR;
      }
      if (key == 'w' || key == 'W'|| key == 's' || key == 'S') {
        player.targetPlayerSprite =  fightAnimationMemory;
      }
      player.sizeX = 171;
      player.sizeY = 251;
      player.placementX = -50;
      player.placementY = -50;
    }
    //define new charecters here using "else if" command 
    hitTime = false;
  }
  if (mousePressed == false) {
    hitTime = true;
  }
  }
}
