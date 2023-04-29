class Render{
    public void menu(){
        //diplay
       image(underworld, 0,0,width,height);
        fill(0);
        rect(width/1.5,550,250,100); 
        rect(width/2.5,550,250,100); 
        rect(width/7.5,550,250,100); 
        fill(100);
        textSize(75); 
        text("Menu",width/2-75,200); 
        textSize(55+10); 
        text("Upgrade",width/1.5,550,250,100);
        if (resume == false){
        text("Start",width/2.5+48,550,250,100);
        }
        if (resume){
            text("Resume",width/2.5+20,550,250,100);
        }
        text("Players",width/7.5+25,550,250,100);
        //functions
        if (mousePressed && mouseX < width/1.5+250 && mouseX > width/1.5 && mouseY < 550+100 && mouseY > 550){//upgrade
            
        }
        if (mousePressed && mouseX < width/2.5+250 && mouseX > width/2.5 && mouseY < 550+100 && mouseY > 550){//Start
            resume = true;
            inGame = true;
        }
        if (mousePressed && mouseX < width/7.5+250 && mouseX > width/7.5 && mouseY < 550+100 && mouseY > 550){//Players
            
        }
        //if ()
    }
    public void inGame(){
       image(underworld, 0,0,width,height);
    }
    public void odyseussAnimation(){
        if (player.name == "odyseuss"){
        if (key == 'a' || key == 'A'){
                player.targetPlayerSprite = odyseussLeft;
        }
         if (key == 'd' || key == 'D'){
                player.targetPlayerSprite = odyseussRight;
         }
          player.sizeX = 71; 
                 player.sizeY = 151; 
                 player.placementX = 0; 
                 player.placementY = 0; 
        }
            else{
                player.targetPlayerSprite = pen;
            }
        
        if (mousePressed && keyPressed == false){
            if (player.name == "odyseuss"){
                 if (key == 'a' || key == 'A'){
                player.targetPlayerSprite =  odyseussFightAnimationL;
                 }
                 if (key == 'd' || key == 'D'){
                player.targetPlayerSprite =  odyseussFightAnimationR;
                 }
                 player.sizeX = 171; 
                 player.sizeY = 251; 
                 player.placementX = -50; 
                 player.placementY = -50; 
            }
            else{
               // player.targetPlayerSprite = penFightAnimation;
            }
        }
    }
}