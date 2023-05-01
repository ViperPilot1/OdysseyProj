boolean menu = true; 
boolean resume = false;
boolean inGame = false; 
boolean up = false;
boolean bottom = false;
boolean left = false;
boolean right = false;
boolean playerSelect = false;
boolean selectReleased = false; 
boolean upgrade = false; 
int slider = 1; 
int currency = 0; 
int damCost = 7; 
int proCost = 5; 
int hpCost = 10; 
Render render = new Render(); 
Player player;
Enemy enmy; 
boolean hitTime = true; 
ArrayList<Enemy> enmyList = new ArrayList<Enemy>();

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
    player = new Player("odyseuss", 100, 20, 50, 10, width/2, height/2, odyseuss);
    player.originalHealth = player.hp; 
    enmy = new Enemy(100, 5, 4, enemy, 0, 0);
    enmy.originalHealth = enmy.health; 
    enmy.enemyMemory(); 
    fightAnimationMemory = odyseussFightAnimationL;//prevent null pointer 
    odyseussPosMemory = odyseussRight;//prevent null pointer 
    initializeEnemy();
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
        if (enmyList.size() > 0){
            enemyFunctions(); 
        }
    }
        restart(); 
        walls(); 
        if (inGame){
        display(); //put functions above Game Over and display
        }
        gameOver();
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
     text("Protection: ",25,75); 
    text(player.protection, 140,75); 
}
void playerFunctions(){
    player.handleMoving();
    player.handleRender();
    render.playerAnimation(); 
    player.playerAttack(); 
}
void initializeEnemy(){
    Enemy tempEnmy = new Enemy(100, 5, 4, enemy, int(random(1, width)), random(1, height));
    enmyList.add(tempEnmy);
    if (enmy.deathCount > 20){
    enmyList.add(tempEnmy);
    }
    if (enmy.deathCount > 35){
    enmyList.add(tempEnmy);
    }
    if (enmy.deathCount > 50){
    enmyList.add(tempEnmy);
    }
}
void enemyFunctions(){
    // enmy.handleRender(); 
    // enmy.enemyAI(); 
    // enmy.enemyFight(); 
    // enmy.enemyRespawn(); 

    // Multi-Enemy Here
    for (int i = 0; i < enmyList.size(); i++){
        // If this enemy has already died then delete this item and create new ones
        if (enmyList.get(i).health <= 0){
            enmyList.remove(i);//respawn function will not work so this will temp fix it 
            currency += enmy.loot; 
            enmy.loot += 5; 
            enmy.health = enmy.healthMemory + 50; 
            enmy.healthMemory = enmy.health; 
            enmy.deathCount += 1; 
            for (int j = 0; j < 1; j++){
                Enemy tempEnmy = new Enemy(100, 5, 4, enemy, int(random(1, width)), random(1, height));
                enmyList.add(tempEnmy);
            }
        }
        enmyList.get(i).handleRender();
        enmyList.get(i).enemyAI();
        enmyList.get(i).enemyFight(); 
        enmyList.get(i).enemyRespawn(); 
    }
}
void restart(){
    if (player.isVisible == false){
        if (key == 'r' || key == 'R'){
        enmy.health = enmy.originalHealth; 
        enmy.healthMemory = enmy.originalHealth; 
        enmy.x = 0; 
        enmy.y = 0; 
        enmy.deathCount = 0; 
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
