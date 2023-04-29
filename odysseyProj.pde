boolean menu = true; 
boolean resume = false;
boolean inGame = false; 
boolean up = false;
boolean bottom = false;
boolean left = false;
boolean right = false;
Render render = new Render(); 
Player player;
Enemy enmy; 
String playerID = "o"; // Two possible values: o or p

// Define resources here
PImage odyseussLeft;
PImage odyseussRight;
PImage odyseuss; 
PImage pen; 
PImage underworld; 
PImage enemy; 
PImage odyseussFightAnimationL; 
PImage odyseussFightAnimationR; 
//======================

void loadResources(){
    odyseussLeft = loadImage("./resources/img/playerLeft.png");
    odyseussRight = loadImage("./resources/img/playerRight.png");
    pen = loadImage("./resources/img/download.jpeg");
    underworld = loadImage("./resources/img/Underworld.jpeg"); 
    enemy = loadImage("./resources/img/enemy.png"); 
    odyseussFightAnimationL = loadImage("./resources/img/OdysseusSwordLeft.png"); 
     odyseussFightAnimationR = loadImage("./resources/img/OdysseusSwordRight.png"); 
}

void setup(){
    size(1000,800); 
    // loadimage() will all be here
    loadResources();
    odyseuss = odyseussLeft; 
    player = new Player("odyseuss", odyseuss);
    enmy = new Enemy(enemy);
}

void draw(){ 
    if (menu){
        render.menu(); 
    }
    if (inGame){
        render.inGame();
        player.handleMoving();
        player.handleRender();
        render.odyseussAnimation(); 
        enmy.handleRender(); 
        enmy.EnemyAI(); 
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