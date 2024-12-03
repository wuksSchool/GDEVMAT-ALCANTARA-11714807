public class Walker
{
  public PVector position = new PVector();
  public PVector gaussianValue = new PVector();
  public PVector deviation = new PVector(490,45);
  public PVector circleColor = new PVector();
  public float scale;
  public float speed = 10;
  
  public Walker()
  {
    randomizePosition(); // Initialize position
    randomizeColor();    // Initialize color
    scale = random(10, 45); // Initialize scale
  }
  
  public void render()
  {
    fill(circleColor.x,circleColor.y,circleColor.z,150);
    circle(position.x,position.y,scale);
  }
  
  //Randomizes color
  public void randomizeColor()
  {
    circleColor.x = random(50,256);
    circleColor.y = random(50,256);
    circleColor.z = random(50,256);
  }
  
  //Randomizes position
  public void randomizePosition()
  {
    gaussianValue.x = randomGaussian();
    gaussianValue.y = randomGaussian();
    
    float mean = 0;
    position.x = deviation.x * gaussianValue.x + mean;
    position.y = random(-300,300);
  }
  
  //moves the walkers to the black hole
  public void swarm()
  {
    PVector dir = PVector.sub(holePos,position);
    dir.normalize();
    dir.mult(speed);
    position.add(dir);
    if(dir.mag()<1)
    {
      speed = 0;
    }
  }
}
