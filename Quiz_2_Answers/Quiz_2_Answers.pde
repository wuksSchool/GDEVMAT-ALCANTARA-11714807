void setup()
{
  size(1280,720,P3D); //window size
  camera(0,0, -(height/2.0) / tan(PI*30.0 / 180.0), 0,0,0,0,-1,0); // centers the origin point
}

Walker myWalker = new Walker();
Walker secondWalker = new Walker();

void draw()
{
 myWalker.randomWalk();
 myWalker.render();
 
 secondWalker.randomWalkBiased();
 secondWalker.render();
}
