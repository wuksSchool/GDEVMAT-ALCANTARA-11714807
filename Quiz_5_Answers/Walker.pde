class Walker
{

  PVector scale = new PVector(0,10);
  PVector position = new PVector();
  PVector deviation = new PVector(0,10000);
  PVector col = new PVector();
  PVector perlinCol = new PVector();
  
  void render()
  {
    generatePerlin();
    fill(col.x, col.y, col.z);
    circle(position.x,position.y,scale.x);
  }
  
  void perlinWalk()
  {
    position.x = map(noise(deviation.x), 0, 1, Window.left,Window.right);
    position.y = map(noise(deviation.y), 0, 1, Window.bottom,Window.top);
    
    deviation.x += 0.01f;
    deviation.y += 0.01f;
  }
  
  void generatePerlin()
  {
    scale.x = map(noise(scale.y),0,1, 5, 150);
    col.x= map(noise(perlinCol.x), 0,1,0,255);
    col.y = map(noise(perlinCol.y), 0,1,0,255);
    col.z = map(noise(perlinCol.z), 0,1,0,255);
    
    perlinCol.x  += 0.09f;
    perlinCol.y += 0.5f;
    perlinCol.z += 0.0002f;
    scale.y += 0.05f;
  }  
}
