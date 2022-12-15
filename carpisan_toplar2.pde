int xPos = 400;
int yPos = 300;

int speedX = 9;
int speedY = 9;

int xPos1 = 0;
int yPos1 = 0;

int speedX1 = 10;
int speedY1 = 10;
int restartTime = 0;
boolean gameStarted = true;
boolean gameover = false;
int radius = 50;

int score = 0;
int maxScore=0;
int hit=0;


float theta = 0f;

float theta_ = 0f;


int paddle = 5500/(hit+10);

boolean mouseClick = false;

void setup()
{
  size( 800, 600 ); 
}

void draw()
{
  
    int time = frameCount / 60;
      background( 255 );

  if (gameStarted) {
    fill(123, 0, 100);
    textSize(64);
    text("Time: " + time, 540, 80);
  background( 0, 0, 0, 0 );
  
  fill(255, 0, 0);
  textSize(44);
  text("Max Score: " + maxScore,40,150); 
  
  

  
  fill(255, 0, 0);
  textSize(64);
  text("Time: " + time, 540, 80); 
  
   
  
 
  noStroke();
  fill( 100, 200, 0 );
  ellipse( xPos, yPos, radius * 2, radius * 2 );
  fill( 0, 155, 400 ); 
  ellipse( xPos1, yPos1, radius * 2, radius * 2 );
  
  xPos += speedX * cos( theta );
  yPos += speedY * sin( theta );
  
  xPos1 += speedX1 * cos( -theta_ );
  yPos1 += speedY1 * sin( -theta_ );
  
  xPos += speedX;
  yPos += speedY;
  
  xPos1 += speedX1;
  yPos1 += speedY1;
  
  if( xPos - radius < 0 )
  {
    xPos = radius;
    speedX *= -1;
  }
  
  if( xPos + radius >= width )
  {
    xPos = width - radius;
    speedX *= -1;
  }
  
  if( yPos - radius < 0 )
  {
    yPos = radius;
    speedY *= -1;
  }
  
  if( yPos + radius >= height )
  {
    yPos = height - radius;
    speedY *= -1;
  }
  
  if( xPos1 - radius < 0 )
  {
    xPos1 = radius;
    speedX1 *= -1;
  }
  
  if( xPos1 + radius >= width )
  {
    xPos1 = width - radius;
    speedX1 *= -1;
  }
  
  if( yPos1 - radius < 0 )
  {
    yPos1 = radius;
    speedY1 *= -1;
  }
  
  if( yPos1 + radius >= height )
  {
    yPos1 = height - radius;
    speedY1 *= -1;
  }
  
  if( mouseClick == true )
  {
  if( ( mouseX > xPos - radius && mouseX < xPos + radius
    && paddle > yPos - radius && paddle < yPos + radius )
    || 
    ( mouseX > xPos1 - radius && mouseX < xPos1 + radius
    && paddle > yPos1 - radius && paddle < yPos1 + radius ))
    {
      score += 10;
    }
  
    
    mouseClick = false;
  }
   
  fill(0, 0, 255);
  textSize(64);
  text("Puan: " + score, 40, 80); 
  
  if( time == 30 )
  {
    
frameCount = 1;
    score = 0;
      gameStarted = false;
    gameover = true;
    
  }
   
  int d = (int) ( sq( xPos - xPos1 ) + sq( yPos - yPos1 ) );
  
  if( d <= 4 * radius * radius )
  {
    speedX *= -1;
    speedY *= 1;
    
    speedX1 *= -1;
    speedY1 *= 1;
  }
  
  rect( mouseX-150, paddle, paddle-300, 50 );
  
  if( xPos > mouseX - 150 && xPos < mouseX + 200 )
  {
    if( yPos + radius > paddle )
    {
      yPos = paddle - radius;
      
      //speedX *= -1;
      speedY *= -1;
      score += 10;
    }
  }
  
  if( xPos1 > mouseX - 150 && xPos1 < mouseX  + 200 )
  {
    if( yPos1 + radius > paddle )
    {
      yPos1 = paddle - radius;
      
      //speedX *= -1;
      speedY1 *= -1;
      score += 10;
    }
  }
  
}
  
  if(score>maxScore){
  maxScore=score;
  
  }
  

  if (gameover) {
    fill(100,300,10,255);
    textSize(64);
    text("GAME OVER!!",185, 300);
  
  }

  if (!gameStarted && restartTime == time) {
    gameStarted = true;
    gameover = false;
    restartTime = 0;
    frameCount = 0;
    delay(4500);
    score = 0;
  }}

void mousePressed()
{
  mouseClick = true;
}
