class Human{
    private String name;
    private int hp;
    private int attackValue;
    private int protection;
    private int speed;

    // constructors
    public Human(String name, int hp, int attackValue, int protection, int speed){
        this.name = name;
        this.hp = hp; 
        this.attackValue = attackValue;
        this.protection = protection;
        this.speed = speed;
    }

    public Human(String name){
        this.name = name;
        this.hp = 100; 
        this.attackValue = 5;
        this.protection = 100;
        this.speed = 5;
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
}