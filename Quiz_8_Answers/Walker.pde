public class Walker
{
  public PVector position = new PVector(-500,200);
  public PVector velocity = new PVector();
  public PVector accel = new PVector();
  public float velocityLimit = 10;
  public float scale = 15;
  public float mass;
  
  public PVector circleColor = new PVector();

  public Walker()
  {
    randomizeColor();
  }
  
  public void update()
  {
    this.velocity.add(this.accel);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.accel.mult(0);
  }
  public void render()
  {
    fill(circleColor.x,circleColor.y,circleColor.z);
    circle(position.x,position.y,scale);
  }

  public void randomizePosition()
  {
    position.x = random(-Window.windowWidth,Window.windowWidth);
    position.y = random(-Window.windowHeight,Window.windowHeight);
  }
  
  public void checkEdges()
  {
    if(position.y <= Window.bottom)
    {
      velocity.y *= -1;
    }
    else if(position.x >= Window.right)
    {
      velocity.x *= -1;
    }
    else if(position.x <= Window.left)
    {
      velocity.x *= 1;
    }
    else if(position.y >= Window.top)
      velocity.y *= 1;
    }
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force,this.mass);
    this.accel.add(f);
  }
  
  public void randomizeColor()
  {
    circleColor.x = random(50,256);
    circleColor.y = random(50,256);
    circleColor.z = random(50,256);
  }
}
