public PVector holePos = new PVector();

Walker[] walkerArray = new Walker[100];

int spawnTime;
int resetInterval = 3000;

void setup()
{
  size(1080,720,P3D);
  camera(0,0,Window.eyeZ, 0,0,0,0, -1, 0);
  
  //Spawns initial objects
  initWalkers();
  spawnObjects();
}

void draw()
{
  //Kept spawning bg so colors don't overlap and it seems that the objects are "moving"
  background(0);
  
  //Spawns the walkers
   for (int i = 0; i < walkerArray.length; i++) 
   {
     walkerArray[i].swarm();  // Move toward the black hole
     walkerArray[i].render(); // Draw the walker
   }
   
   //Kept drawing the black hole so it stays on top
  noStroke();
  fill(255,255,255,255);
  circle(holePos.x,holePos.y,50);
  
  //After 3 seconds, it redraws the objects
  if(millis() - spawnTime > resetInterval)
    {
      spawnObjects();
    }
}


//randomizes the position of the black hole
void randomizeBlackHole()
{
  //Gave leeway due to black hole scale
  holePos.x = random(-490,490);
  holePos.y = random(-300,300);
}

//randomizes the position of the walkers
void randomizeWalkers()
{
  for (int i = 0; i < walkerArray.length; i++) 
  {
    walkerArray[i].randomizePosition();
  }
}

//Spawns objects after resetting 
void spawnObjects()
{
  background(0);
  randomizeBlackHole();
  randomizeWalkers();
  spawnTime = millis();
}

//Initializes the walkers in the array
void initWalkers()
{
  for(int i =0; i < walkerArray.length; i++)
  {
    walkerArray[i] = new Walker();
  }
}
