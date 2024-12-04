Walker[] walkerArray = new Walker[8];

float mew;
int posY = 0;
PVector gravity = new PVector(0.2, 0);

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
    posY = 2 * (Window.windowHeight/ 8) * (i-4);
    walkerArray[i] = new Walker();
    walkerArray[i].position = new PVector(-500, posY);
    walkerArray[i].mass = 8 - i;
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
    mew = 0.1f;
    float normal = 1;
    float frictionMag = mew * normal;
    PVector friction = walkerArray[i].velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMag);
    
    if(walkerArray[i].position.x > 0)
    {
      mew = 0.4f;
      frictionMag = mew * normal;
      friction = walkerArray[i].velocity.copy();
      friction.mult(-1);
      friction.normalize();
      friction.mult(frictionMag);
    }
    
    walkerArray[i].update();
    //walkerArray[i].applyForce(wind);
    walkerArray[i].applyForce(gravity);
    walkerArray[i].applyForce(friction);
    //walkerArray[i].checkEdges();
  }
}
void mouseClicked()
{
  for(int i =0; i < walkerArray.length; i++)
  {
    posY = 2 * (Window.windowHeight/ 8) * (i-4);
    walkerArray[i].position = new PVector(-500, posY);
    walkerArray[i].velocity.mult(0);
    walkerArray[i].accel.mult(0);
  }
  mew = 0.1f;
}
