class Enemy{
    private int health;
    private int healthMemory;
    private int originalHealth;
    private int attack;
    private int loot = 5; 
    public int deathCount = 0; 
    private float speed;
    private float easing; 
    public float x;
    public float y;
    public PImage sprite; 
    public boolean isVisible = true; 

    public Enemy(int health, int attack, float speed, PImage sprite, float x, float y){
        this.health = health;
        this.attack = attack;
        this.speed = speed;
        this.sprite = sprite;
        this.x = x;
        this.y = y;
    }
    public Enemy(PImage sprite){
   this.sprite = sprite;
}
public void enemyMemory(){
    this.healthMemory = this.health; 
}

    // Enemy AI Class
    /*public void AutoControl(float playerX, float playerY, Player targetPlayer){
        // Get distance
        float currentDistance = dist(this.x, this.y, targetPlayer.x, targetPlayer.y);
        float verticalDistance = this.y - targetPlayer.y;
        float horizontalDistance = this.x - targetPlayer.x;
        // Calculate Speed
        
    }*/ 
    //here is how I would do the enemy AI 
    public void enemyAI(){
        easing = this.speed/100; 
float targetX = player.playerX;
  float dx = targetX - this.x;
  this.x += dx * easing;
  
  float targetY = player.playerY;
  float dy = targetY - this.y;
  this.y += dy * this.easing;
    }
     public void handleRender(){
         image(this.sprite, this.x, this.y,308/3,475/3); 
     }

     public void enemyFight(){
        if (dist(this.x,0,player.playerX,0)<71 && dist(this.y,0,player.playerY,0)<151){
           if (player.protection > 1){
            player.protection -= this.attack; 
           }
            if (player.protection < 1){
            player.hp -= this.attack; 
        }
        }
        if (this.health < 1){
            this.isVisible = false; 
        }
     }
     public void enemyRespawn(){
        if (this.isVisible == false){
            currency += this.loot; 
            this.loot += 5; 
            this.health = this.healthMemory + 50; 
            this.x = 0; 
            this.y = 0; 
            this.enemyMemory(); 
            this.deathCount += 1; 
            isVisible = true; 
        }
     }
}
