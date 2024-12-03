class Walker
{
  public float x;
  public float y;
  public float tx = 0;
  public float ty = 10000;
  public float scale;
  public float perlinScale = 10;
  public float col1, col2, col3;
  public float perlinCol1, perlinCol2, perlinCol3;
  
  void render()
  {
    generatePerlin();
    fill(col1, col2, col3);
    circle(x,y,scale);
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640,640);
    y = map(noise(ty), 0, 1, -360,360);
    
    tx += 0.01f;
    ty += 0.01f;
  }
  
  void generatePerlin()
  {
    scale = map(noise(perlinScale),0,1, 5, 150);
    col1= map(noise(perlinCol1), 0,1,0,255);
    col2 = map(noise(perlinCol2), 0,1,0,255);
    col3 = map(noise(perlinCol3), 0,1,0,255);
    
    perlinCol1  += 0.09f;
    perlinCol2 += 0.5f;
    perlinCol3 += 0.0002f;
    perlinScale += 0.05f;
  }  
}
