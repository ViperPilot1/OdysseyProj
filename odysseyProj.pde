// test
void setup(){
    size(1000,800);
}

void draw(){
    background(255); 
    menu(); 
}

void menu(){
    background(200); 
    fill(0);
    rect(width/1.5,550,250,100); 
    rect(width/2.5,550,250,100); 
    rect(width/7.5,550,250,100); 
    fill(100);
    textSize(75); 
    text("Menu",width/2-75,200); 
    textSize(55+10); 
    text("Upgrade",width/1.5,550,250,100);
     text("Start",width/2.5+50,550,250,100);
      text("Players",width/7.5+25,550,250,100);
}