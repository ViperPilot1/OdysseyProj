class Enemy{
    private int health;
    private int attack;
    private int speed;
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

    // Enemy AI Class
    public void AutoControl(float playerX, float playerY, Player targetPlayer){
        // Get distance
        float currentDistance = dist(this.x, this.y, targetPlayer.x, targetPlayer.y);
        float verticalDistance = this.y - targetPlayer.y;
        float horizontalDistance = this.x - targetPlayer.x;
        // Calculate Speed
        
    }
}