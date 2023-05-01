class Player{
    private String name;
    private int hp;
    private int attackValue;
    private int protection;
    private int speed;
    private int playerX;
    private int playerY;
    private int sizeX; 
    private int sizeY; 
    private int placementX; 
    private int placementY; 
    public int originalHealth; 
    public boolean isVisible = true; 
   
    public PImage targetPlayerSprite;

    // constructors
    public Player(String name, int hp, int attackValue, int protection, int speed, int playerX, int playerY, PImage targetPlayerSprite){
        this.name = name;
        this.hp = hp; 
        this.attackValue = attackValue;
        this.protection = protection;
        this.speed = speed;
        this.targetPlayerSprite = targetPlayerSprite;
        this.playerX = playerX;
        this.playerY = playerY;
    }

    public Player(String name, PImage targetPlayerSprite){
        this.name = name;
        this.hp = 100; 
        this.attackValue = 5;
        this.protection = 100;
        this.speed = 10;
        this.targetPlayerSprite = targetPlayerSprite;
        this.playerX = width / 2;
        this.playerY = height / 2;
    }

    // Getters and Setters
    public String getName(){
        return this.name;
    }

    public int getHp(){
        return this.hp;
    }

    public int getAttackValue(){
        return this.attackValue;
    }

    public int getProtection(){
        return this.protection;
    }

    public int getSpeed(){
        return this.speed;
    }

    public void setName(String name){
        this.name = name;
    }

    public void setHp(int hp){
        this.hp = hp;
    }

    public void setAttackValue(int attackValue){
        this.attackValue = attackValue;
    }

    public void setProtection(int protection){
        this.protection = protection;
    }

    public void setSpeed(int speed){
        this.speed = speed;
    }

    // methods



    public void handleMoving(){
        // TODO: Finishing Moving Function
        if (up) this.playerY -= this.speed; 
        if (bottom) this.playerY += this.speed; 
        if (left) this.playerX -= this.speed; 
        if (right) this.playerX += this.speed; 
        }

    public void handleRender(){
        image(this.targetPlayerSprite, this.playerX + this.placementX, this.playerY + this.placementY,this.sizeX,this.sizeY); 

    }
    public void playerAttack(){
        for (int i = 0; i < enmyList.size(); i++){
            if (mousePressed && keyPressed == false){
                if (dist(this.playerX,0,enmyList.get(i).x,0)<player.sizeX && dist(this.playerY,0,enmyList.get(i).y,0)<player.sizeY){
                    enmyList.get(i).health -= this.attackValue; 
                    enmyList.get(i).sprite = enemyDamaged; 
                }
            }
            else{
                enmyList.get(i).sprite = enemy; 
            }
        }
    }
}
