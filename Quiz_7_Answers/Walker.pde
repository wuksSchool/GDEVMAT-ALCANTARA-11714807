public class Walker
{
  
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector accel = new PVector(0.001,0.1);
  public float velocityLimit = 10;
  public float scale;

  public Walker()
  {
    randomizePosition();
    scale = random(10,45);
  }
  
  public void render()
  {
    fill(255,255,255);
    circle(position.x,position.y,scale);
    swarm();
  }

  public void randomizePosition()
  {
    position.x = random(-Window.windowWidth,Window.windowWidth);
    position.y = random(-Window.windowHeight,Window.windowHeight);
  }
  public void swarm()
  {
    PVector dir = PVector.sub(mousePos(),position);
    dir.normalize();
    accel = dir.mult(0.2);
    velocity.add(accel);
    position.add(velocity);
    this.velocity.limit(velocityLimit);
  }
}
