class Walker
{
  float x;
  float y;
  
  void render()
  {
    fill(int(random(256)),int(random(256)),int(random(256)),int(random(50,101)));
    noStroke();
    circle(x,y,30);
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0)
    {
      y+=10;
    }
    else if (rng == 1)
    {
      y-=10;
    }
    else if (rng == 2)
    {
      x+=10;
    }
    else if (rng == 3)
    {
      x-=10;
    }
    else if (rng == 4)
    {
      x-=5;
      y-=5;
    }
    else if (rng == 5)
    {
      x+=5;
      y+=5;
    }
    else if (rng == 6)
    {
      x-=5;
      y+=5;
    }
    else if (rng == 7)
    {
      x+=5;
      y-=5;
    }
  }
  
  void randomWalkBiased()
  {
    int rng = int(random(10));
    if (rng <= 3)
    {
      x+=4;
    }
    else if(rng == 4 || rng == 5)
    {
      x-=4;
    }
    else if(rng == 6 || rng == 7)
    {
      y+=4;
    }
    else if(rng == 8 || rng == 9)
    {
      y-=4;
    }
  
  }
}
