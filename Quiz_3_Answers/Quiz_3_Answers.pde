void setup()
{
  size(1020,720,P3D);
  camera(0,0,-(height/2.0) / tan(PI*30.0 / 180.0), 0,0,0,0, -1,0);
  background(255);
}

void draw()
{
  //Gaussian random for circle location
  float gaussian = randomGaussian();
  float standardDeviation = 510;
  float mean = 0;
  float x = standardDeviation * gaussian + mean;
  float y = random(-360,360);
  
  //Gaussian randoms and random numbers for circle
  float zGaussian = randomGaussian();
  float zDeviation = 70;
  float zMean = 5;
  float z = zDeviation * zGaussian + zMean;
  
  //Random number for color and thickness
  float red = random(0,256);
  float green = random(0,256);
  float blue = random(0,256);
  float alpha = random(10,101);
  color randomColor = color(red,green,blue,alpha);
   
  //Draws the circle
  noStroke();
  fill(randomColor,alpha);
  circle(x,y,z);
  
  //Flushes screen after 300 Frames
  if(frameCount%300 == 0)
  {
    background(255);
  }
}
