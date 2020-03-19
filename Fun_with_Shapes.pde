int spacing = 50;
int value = 0;
color rand;
PFont funFont;
boolean overStart = false;
boolean overButton = false;
String scoreVal = "0";

//timer to slow down animation background
//and regulate frameRate for the buttons
float backgroundTimer = 0;
float backgroundDelay = 1000/5f;//5 fps

void setup()
{
  size(1000,800);
  background(0);  
  
  funFont = loadFont("BookmanOldStyle-Bold-48.vlw");
  textFont(funFont);
}

void draw()
{
  if(value == 0)
  {
    fill(249,15,132);
    textSize(60);
    text("Fun With Shapes",220,295); 
    startScreen();
  }
  if(value == 1)
    instrScreen();
  if(value > 1)
    gameScreen();
}

void startScreen()
{
 
  //delays the fps of the background animation 
  //without effecting the buttons fps 
  if(millis() > backgroundTimer)
  { 
    //Creates Triangles whose color is constantly changing on the screen
    noStroke();
    for(int xPos =0; xPos < width; xPos+=200)
    {
      for(int yPos =0; yPos<height; yPos+=100)
      {
        rand = color(random(0,255),random(0,255),random(0,255));
        fill(color(rand));
        triangle(xPos,yPos,xPos,yPos+spacing, xPos+spacing, yPos+spacing);
      }
    }
    //Creates Circles whose color is constantly changing on the screen
    noStroke();
    for(int x = 130; x <width; x +=200)
    {
      for(int y = 25; y < height; y += 200)
      {
        fill(color(rand));
        ellipse(x,y,50,50);
      }
    }
    //Creates Squares whose color is constantly changing on the screen
    noStroke();
    for(int x = 100; x < width; x+=200)
    {
      for(int y = 100; y < height; y+=200)
      {
        rand = color(random(0,255),random(0,255),random(0,255));
        fill(color(rand));
        rect(x,y,50,50);
      }
    }
    backgroundTimer+=backgroundDelay;
  }
  
  //Creates Start Button and highlights button 
  //when user hovers over it
  if(overButton(350,350,250,100))
      fill(#808080); 
    else
      fill(0);
  
  stroke(#0A8FFF);
  strokeWeight(8);
  rect(350,350,250,100,7);
  
  //Text Properties
  textFont(funFont);
  fill(255,255,0);//color of words
  textSize(50);
  text("START",390,420);//text(word,x-location,y-location)
  
  //Creates a Exit/Quit Button that quits the game
  if(overButton(800,695,150,70)== true)
    fill(#F08080);
  else
    fill(0);
    
  stroke(255,0,0);
  rect(800,695,150,70);
  //Text Properties
  textFont(funFont);
  fill(255,0,0);
  textSize(40);
  text("EXIT",825,745);
  
}

void instrScreen()
{
  background(0);//maybe try seeing if we can create a custom background 
  //of the moving shapes to apply to each screen; background(funBackground)
  
  //Creates border for Instructions heading
  strokeWeight(5);
  stroke(#0A8FFF);
  fill(0);
  rect(50,50,900,100);
  
  //Labels heading
  textFont(funFont);
  fill(249,15,132);
  textSize(100);
  text("Instructions",180,135);
  
  //Creates Bordered Box for Instructions Text
  fill(0);
  rect(50,200,900,460);
  //Text of Instructions
  fill(255);
  textSize(28);
  text("Goal: Try to pop as many shapes as you\n"+
  "can within 30 seconds! You may only use your mouse\n"+
  "to pop each shape. The more shapes you pop,\n"+
  "the higher your score! If you score higher than 300 points,\n"+
  "You Win! If not, Try Again Next Time :) ",70,250);
  text("Note: Keyboard input will not effect the game in any way!",70,620);
  
  //"Begin" Button to start the game (game screen appears when pressed)
  //determines buttons background color
  if(overButton(400,695,200,70) == true)
    fill(#808080);
  else
    fill(0);
    
  rect(400,695,200,70);
  //Button Text Properties
  textFont(funFont);
  fill(255,255,0);
  textSize(30);
  text("Begin Game",410,740);
  
  //Back Button/Home Screen Button
  if(overButton(800,695,150,70)== true)
    fill(#F08080);
  else
    fill(0);
    
  stroke(255,0,0);
  rect(800,695,150,70);
  //Text Properties
  textFont(funFont);
  fill(255,0,0);
  textSize(40);
  text("BACK",815,745);
}

void gameScreen()
{
  background(0); 
  
  //Draws line seperating game and score area
  strokeWeight(5);
  stroke(#0A8FFF);
  line(750,0,750,800);
  
  //Creates Timer heading and Timer box
  fill(0);
  stroke(255,0,0);
  rect(775,150,200,100);
  //Text Properties
  fill(255,0,0);
  textSize(50);
  text("Time",808,140);
  
  //Creates Score heading and Score box
  fill(0);
  stroke(#0A8FFF);
  rect(775,400,200,100);
  //Text Properties
  fill(#0A8FFF);
  textSize(50);
  text("Score",808,390);
  
  //Score Tracker
  fill(255);
  //String scoreVal = "0";//score will increment by 10 or 20 depending on shape size
  text(scoreVal,860,470);
  
  //Creates Home Button
  //Creates Back Button
  
}
void scoreKeeper(String scoreVal)
{
  int num = 0;
  for(int i = 0; i < 300; i+=10)
  {
    num += i;
    scoreVal = String.valueOf(i);
  }
}

void mousePressed()
{
  if(overButton(800,695,150,70) && value == 0)
  {
   exit(); 
  }
  if(overButton(350,350,250,100) && value == 0)//start button pressed
  {
    value = 1;
  }
  if(overButton(800,695,150,70))
  //Back button pressed, returns to home screen
  {
    background(0);
    value=0;
  }
  if(overButton(400,695,200,70) && value == 1)
  //Begin Button pressed on Instr. Screen
  {
    value = 2;
  }
    
}  
boolean overButton(int x, int y, int width, int height)
{
  if(mouseX >= x && mouseX <= x+width &&
     mouseY >= y && mouseY <= y+height)
  {
    return true;
  }
  else
    return false;
}
