class Human{
    private String name;
    private int hp;
    private int attackValue;
    private int protection;
    private int speed;
    public float x;
    public float y;
    public PVector position;
    public PImage sprite;

    // constructors
    public Human(String name, int hp, int attackValue, int protection, int speed, float x, float y, PImage sprite){
        this.name = name;
        this.hp = hp; 
        this.attackValue = attackValue;
        this.protection = protection;
        this.speed = speed;
        this.x = x;
        this.y = y;
        this.sprite = sprite;
    //    this.position = new PVector(this.x, this.y)
    }

    public Human(String name, PImage sprite){
        this.name = name;
        this.hp = 100; 
        this.attackValue = 5;
        this.protection = 100;
        this.speed = 5;
        this.x = 0;
        this.y = 0;
        this.sprite = sprite;
     //   this.position = new PVector(this.x, this.y)
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
    }

    public void handleRending(){
        image(this.sprite, this.x, this.y); 
    }
}
