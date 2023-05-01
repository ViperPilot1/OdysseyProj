boolean menu = true; 
boolean resume = false;
boolean inGame = false; 
boolean up = false;
boolean bottom = false;
boolean left = false;
boolean right = false;
boolean playerSelect = false;
boolean selectReleased = false; 
int slider = 1; 
Render render = new Render(); 
Player player;
Enemy enmy; 
boolean hitTime = true; 

// Define resources here
PImage odyseussLeft;
PImage odyseussRight;
PImage odyseuss; 
PImage penLeft; 
PImage penRight;  
PImage underworld; 
PImage enemy; 
PImage odyseussFightAnimationL; 
PImage odyseussFightAnimationR; 
PImage fightAnimationMemory; 
PImage odyseussPosMemory; 
PImage enemyDamaged; 
//======================

void loadResources(){
    odyseussLeft = loadImage("./resources/img/playerLeft.png");
    odyseussRight = loadImage("./resources/img/playerRight.png");
    penLeft = loadImage("./resources/img/penelopeLeft.png");
    penRight = loadImage("./resources/img/penelopeRight.png");
    underworld = loadImage("./resources/img/Underworld.jpeg"); 
    enemy = loadImage("./resources/img/enemy.png"); 
    odyseussFightAnimationL = loadImage("./resources/img/OdysseusSwordLeft.png"); 
     odyseussFightAnimationR = loadImage("./resources/img/OdysseusSwordRight.png"); 
     enemyDamaged = loadImage("./resources/img/enemyDamaged.png"); 
}

void setup(){
    size(1000,800); 
    // loadimage() will all be here
    loadResources();
    odyseuss = odyseussLeft; 
    player = new Player("odyseuss", 100, 20, 100, 10, width/2, height/2, odyseuss);
    player.originalHealth = player.hp; 
    enmy = new Enemy(100, 5, 4, enemy, 0, 0);
    enmy.originalHealth = enmy.health; 
    enmy.enemyMemory(); 
    fightAnimationMemory = odyseussFightAnimationL;//prevent null pointer 
    odyseussPosMemory = odyseussRight;//prevent null pointer 
}

void draw(){ 
    if (menu){
        render.menu(); 
    }
    if (inGame){
        render.inGame();
        if (player.isVisible){
        playerFunctions(); 
        }
        if (enmy.isVisible)
        enemyFunctions(); 
        restart(); 
        walls(); 
        display(); //put functions above Game Over and display
        gameOver();
    }
}
void keyPressed(){
    if (key == 'm'){
        menu = true; 
        inGame = false;
    }
    if (( key == 'w') || ( key == 'W')){
        up = true; 
    }

    if (( key == 's') || ( key == 'S')){
        bottom = true; 
    }

    if (( key == 'a') || ( key == 'A')){
        left = true; 
    }

    if ((key == 'd') || (key == 'D')){
        right = true; 
    }
}
void keyReleased(){
    if (( key == 'w') || ( key == 'W')){
    up = false; 
    }
    
    if (( key == 's') || ( key == 'S')){
    bottom = false; 
    }
    
    if (( key == 'a') || ( key == 'A')){
    left = false; 
    }
    
    if ((key == 'd') || (key == 'D')){
    right = false; 
    }    
}
void gameOver(){
if (player.hp < 1){
    textSize(75); 
    fill(255,0,0); 
text("Game Over",width/2-175,height/2); 
player.isVisible = false; 
}
if (player.hp < 0){
    player.hp = 0; 
}
     }  
     void display(){
    textSize(25); 
    fill(255,0,0); 
    text("Health: ",25,50); 
    text(player.hp, 100,50); 
}
void playerFunctions(){
    player.handleMoving();
        player.handleRender();
        render.playerAnimation(); 
         player.playerAttack(); 
}
void enemyFunctions(){
    enmy.handleRender(); 
        enmy.enemyAI(); 
        enmy.enemyFight(); 
        enmy.enemyRespawn(); 
}
void restart(){
if (player.isVisible == false){
    if (key == 'r' || key == 'R'){
enmy.health = enmy.originalHealth; 
enmy.healthMemory = enmy.originalHealth; 
enmy.x = 0; 
enmy.y = 0; 
player.hp = player.originalHealth; 
player.playerX = width/2; 
player.playerY = height/2; 
player.isVisible = true;
inGame = false;
resume = false;
 
    }
}
}
void walls(){
    if (player.playerX < 0){
        player.playerX = 0; 
    }
    if (player.playerX > width-player.sizeX){
        player.playerX = width-player.sizeX; 
    }
    if (player.playerY < 0){
        player.playerY = 0; 
    }
    if (player.playerY > height-player.sizeY){
        player.playerY = height-player.sizeY; 
    }
}