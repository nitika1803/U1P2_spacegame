// These are the variables to code with
PImage background;
PImage startscreen;
PImage alien;
PImage comet;
PImage enemy;
PImage enemy2; 
int enemyH = 50;
int enemyW = 50; 
int Health = 50;
int alienH = 50;
int alienW = 50;
int stage;
int [] cometX = new int [5];
int [] cometY = new int [5]; 
float[] enemyX = new float [3];
float[] enemyY = new float [3];
float[] enemy2X = new float [3];
float[] enemy2Y = new float [3];


void setup()
{
imageMode(CENTER);
  stage = 1;
 size (1000,800);
 
// These codes load the images for the game
startscreen = loadImage("startscreen.png");
startscreen.resize (1000,800);
background = loadImage ("background.png");
alien = loadImage ("alien.png"); 
comet = loadImage ("comet.png");
enemy = loadImage ("enemy.png");
enemy2 = loadImage ("enemy2.png");
background.resize (1000,800);

// This codes enables the same image load multiple times without having to code each individual one
   for(int i=0; i<3; i++)
 {
   cometX[i] = (int) random (0,1000);
   cometY[i] = (int) random (0,800);
   enemyX[i] = (float) random (600,1000);
   enemyY[i] = (float) random (0,800);
   enemy2X[i] = (float) random (600,1000);
   enemy2Y[i] = (float) random (0,800);
 }


}
void draw()
 {
// This is the setup for the title screen 
  if (stage ==1 ) 
  {
    background(startscreen);
    textSize(40);
// This loads the text on the screen
    text("SPACE AVOIDERS", 360, 350);
    textSize(15);
    text("Avoid the enemy aliens by moving your cursor to make sure your health does not reach 0", 210, 440);
    text("... or else you lose!", 450, 460);
    textSize(20);
    text("PRESS ANY KEY TO BEGIN", 400, 550);
// This command enables the game to move onto the next stage if any key is pressed
    if (keyPressed == true)
    {
     stage = 2;
    }
    
  }
  
  
// This is the setup for the game
  if (stage ==2)
{
  background(background);
  text("Health:" + Health, 850, 90);
  for(int i=0; i<5; i++)
  {
    image(comet, cometX[i], cometY[i], 100, 100);
 // This moves the comets across the screen 
    cometX[i] += 2;
    if (cometX[i] >1000)
    {
      cometX[i] = 0; 
    }
  }
  // This makes the charcater you're playing as follow your mouse
   image(alien, mouseX, mouseY, alienW, alienH);
     for(int i=0; i<3; i++)
     {
   image(enemy, enemyX[i], enemyY[i], enemyW, enemyH);
// This moves the enemies across the screen in waves 
   enemyX[i] -=2;
   enemyY[i] = 20+sin(enemyX[i]/100)*500;
    if (enemyX[i] <0)
    {
      enemyX[i] = 1000;
    }
   image(enemy2, enemy2X[i], enemy2Y[i], enemyW, enemyH);
// This moves the second set of enemies across the screen in waves
   enemy2X[i] -=5;
   enemy2Y[i] = 200+sin(enemyX[i]/50)*300;
     if (enemy2X[i] <0)
    {
       enemy2X[i] = 1000;
    }
// This makes the health go down if the alien collides with the enemy
    float d= dist(mouseX, mouseY, enemy2X[i], enemy2Y[i]);
      if (d < 30 +30) 
      {
          Health = Health - 1;
      }
// This makes the game move to the end screen if the health is zero
      if (Health == 0)
      {
       stage = 3; 
     }
      }
      
      
// This loads the end screen 
     if (stage == 3) 
     {
       background(startscreen);
       textSize(40);
       text("YOU LOSE", 450, 350);
   //textSize(20);
  //text("PRESS ANY KEY TO RESTART", 380, 550); 
  // if (keyPressed == true) 
  //  {   
  //   stage = 2;
    }

     }
  }
    
}
