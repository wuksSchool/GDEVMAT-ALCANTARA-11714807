public PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x,y);
}

Walker[] walkerArray = new Walker[100];

void setup()
{
  size(1280,720,P3D);
  camera(0,0,Window.eyeZ, 0,0,0,0, -1, 0);
  initWalkers();
}

void draw()
{
  background(0);
  spawnWalkers();
}

//Initializes the walkers in the array
void initWalkers()
{
  for(int i =0; i < walkerArray.length; i++)
  {
    walkerArray[i] = new Walker();
  }
}

void spawnWalkers()
{
   for (int i = 0; i < walkerArray.length; i++) 
   {
     walkerArray[i].render(); 
   }
}
