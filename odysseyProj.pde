boolean menu = true; 
boolean resume = false;
boolean inGame = false; 
 boolean up = false;
    boolean bottom = false;
    boolean left = false;
     boolean right = false;
Render render = new Render(); 
Player player;

// Define resources here
PImage playerSprite;
//======================

void loadResources(){
    playerSprite = loadImage("./resources/img/playerLeft.png");
}

void setup(){
    size(1000,800); 
    // loadimage() will all be here
    loadResources();
    player = new Player("Hello", playerSprite);
}

void draw(){
    background(255); 
    if (menu){
        render.menu(); 
    }
    if (inGame){
        render.inGame();
        player.handleMoving();
        player.handleRender();
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