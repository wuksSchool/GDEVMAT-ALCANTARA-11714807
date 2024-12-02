float offset = 0.5f;
float speed = 0.02f;

void setup()
{
  size(1280,720,P3D); //window size
  camera(0,0, -(height/2.0) / tan(PI*30.0 / 180.0), 0,0,0,0,-1,0); // centers the origin point
}

void draw()
{
  background(0);

drawCartesianPlane();
drawQuestion1();
drawQuestion2();
drawQuestion3();

offset += speed; // sin animation
}

void drawCartesianPlane()
{
strokeWeight(1);
color white = color(255,255,255);
fill(white);
stroke(white);

line(300,0,-300,0);
line(0,300,0,-300);

for(int i =  -300; i<=300; i+=10)
  {
  line(i,-2,i,2);
  line(-2,i,2,i);
  }
}

void drawQuestion2()
{
  color purple = color(160 ,32,240);
  fill(purple);
  noStroke();
  for (int x = -200; x <= 200; x++)
  {
    circle(x,(x * -5) + 30,5);
  }
}

void drawQuestion1()
{
  color yellow = color(255,255,0);
  fill(yellow);
  stroke(yellow);
  for(float x = -300; x<= 300; x+= 0.1f)
  {
    circle(x, ((float)Math.pow(x,2) - (x * 15) - 5), 3);
  }
}

void drawQuestion3()
{
  
  color green = color(0,255,0);
  fill(green);
  stroke(green);
  for(float x = -300; x <= 300; x+=1)
  {
    float y = 50 * sin(0.05 * x + offset); // calculates y position; y = height * sin(length + offset)
    circle(x,y,5);
  }
}
