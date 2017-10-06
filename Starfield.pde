int b = 12;
float a = 0;
int n = 0;

Particle[] norms = new Particle[255];

void setup()
{
  frameRate(60);
	size(500, 500);

  for(int i = 0; i < norms.length; i++)
  {
    norms[i] = new Normal();
  }
    for(int j = 0; j < 10; j++)
  {
    norms[j] = new Oddball();
  }
    for(int k = 10; k < 20; k++)
  {
    norms[k] = new Jumbo();
  }
}

void draw()
{
  background(0);
  for(int i = 0; i < norms.length; i++)
  {
    norms[i].move();
    norms[i].show();
  }	
}

class Normal implements Particle
{
	int myColorR, myColorG, myColorB;
  double myAngle, mySpeed, myX, myY;

  Normal()
  {
    myX = 250;
    myY = 250;
    myColorR = (int)(Math.random()*196) + 60;
    myColorG = (int)(Math.random()*196) + 60;
    myColorB = (int)(Math.random()*196) + 60;
    myAngle = (Math.random()*6.28);
    mySpeed = (Math.random()*5) + 0.5;
  }
  
  public void move()
  {
    myX = (mySpeed*Math.cos(myAngle)) + myX;
    myY = (mySpeed*Math.sin(myAngle)) + myY;
    if((myX > 530 || myX < - 30)||(myY > 530 || myY < -30))
    {
      myX = 250;
      myY = 250;
      myColorR = (int)(Math.random()*196) + 60;
      myColorG = (int)(Math.random()*196) + 60;
      myColorB = (int)(Math.random()*196) + 60;
      myAngle = (Math.random()*6.28);
      mySpeed = (Math.random()*5) + 0.5;
    }
  }
  
  public void show()
  {
    noStroke();
    fill(myColorR, myColorG, myColorB);
    ellipse((int)myX, (int)myY, 5, 5);
  }
}

interface Particle
{
	public void show();
  public void move();
}

class Oddball extends Normal
{
  double e = Math.random()*PI/4;
  public void show()
  {
    noStroke();
    fill(myColorR, myColorG, myColorB);
    
    beginShape();
    vertex((int)(b*1.41*Math.cos(a+e+(0.75*PI)) + myX), (int)(b*1.41*Math.sin(a+e+(0.75*PI)) + myY));
    vertex((int)(b*1.41*Math.cos(a+e+(0.25*PI)) + myX), (int)(b*1.41*Math.sin(a+e+(0.25*PI)) + myY));
    vertex((int)(b*1.41*Math.cos(e+a-(0.25*PI)) + myX), (int)(b*1.41*Math.sin(e+a-(0.25*PI)) + myY));
    vertex((int)(b*1.41*Math.cos(e+a-(0.75*PI)) + myX), (int)(b*1.41*Math.sin(e+a-(0.75*PI)) + myY));
    vertex((int)(b*1.41*Math.cos(a+e+(0.75*PI)) + myX), (int)(b*1.41*Math.sin(a+e+(0.75*PI)) + myY));
    endShape(CLOSE);
    
    a = a + 0.01;
  }
}

class Jumbo extends Normal
{
	  public void show()
  {
    noStroke();
    fill(myColorR, myColorG, myColorB);
    ellipse((int)myX, (int)myY, 45, 45);
  }
}