void setup()
{
  size(1280,720,P3D);
  camera(0,0,Window.eyeZ, 0,0,0,0, -1, 0);
}

//For Question 4
PVector position = new PVector();
PVector speed = new PVector(5,8);

Walker perlinWalker = new Walker();

void draw()
{
  fill(0);
  noStroke();
  perlinWalker.perlinWalk();
  perlinWalker.render();
}

//Function for Question 4
void moveAndBounce()
{
   //flush screen with white BG
  background(255);

  //Add speed
  position.add(speed);
  
  //Conditions for bouncing
  if ((position.x > Window.right) || (position.x < Window.left))
  {
    speed.x *= -1;
  }
  if ((position.y > Window.top) || (position.y < Window.bottom))
  {
    speed.y *= -1;
  }
  
  //Renders circle
  fill(182,52,100);
  circle(position.x,position.y,50);
}
