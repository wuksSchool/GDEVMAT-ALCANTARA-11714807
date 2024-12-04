Walker[] walkerArray = new Walker[10];

PVector wind = new PVector(0.15,0);
PVector gravity = new PVector(0,-0.4);

void setup()
{
  size(1280,720,P3D);
  camera(0,0,Window.eyeZ, 0,0,0,0, -1, 0);
  initWalkers();
}


void draw()
{
  background(80);
  spawnWalkers();
  walkerLogic();
  //walker.render();
  //walker.update();
  //walker.applyForce(wind);
  //walker.applyForce(gravity);
  
  //heavyWalker.render();
  //heavyWalker.update();
  //heavyWalker.applyForce(wind);
  //if(walker.position.y <= Window.bottom)
  //{
  //  walker.velocity.y *= -1;
  //}
}
void initWalkers()
{
    for(int i =0; i < walkerArray.length; i++)
  {
    walkerArray[i] = new Walker();
    walkerArray[i].mass = i +1;
    walkerArray[i].scale *= walkerArray[i].mass;
  }
}
void spawnWalkers()
{
  for (int i = 0; i < walkerArray.length; i++) 
  {
    walkerArray[i].render();
  }
}

void walkerLogic()
{
   for (int i = 0; i < walkerArray.length; i++) 
  {
    walkerArray[i].update();
    walkerArray[i].applyForce(wind);
    walkerArray[i].applyForce(gravity);
    walkerArray[i].checkEdges();
  }
}
