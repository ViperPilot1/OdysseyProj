class Enemy{
    private int health;
    private int attack;
    private int speed;
    private float easing = 0.05; 
    public float x;
    public float y;
    public PImage sprite;

    public Enemy(int health, int attack, int speed, PImage sprite, float x, float y){
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

    // Enemy AI Class
    /*public void AutoControl(float playerX, float playerY, Player targetPlayer){
        // Get distance
        float currentDistance = dist(this.x, this.y, targetPlayer.x, targetPlayer.y);
        float verticalDistance = this.y - targetPlayer.y;
        float horizontalDistance = this.x - targetPlayer.x;
        // Calculate Speed
        
    }*/ 
    //here is how I would do the enemy AI 
    public void EnemyAI(){
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
}
