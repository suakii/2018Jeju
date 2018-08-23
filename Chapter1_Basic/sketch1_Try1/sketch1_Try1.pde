float x = 100, y = 100;
float xspeed = 3.5, yspeed = 2.5;

void setup() 
{
    size(500, 500);
    smooth();
}
void draw() 
{
    background(255);
    x = x + xspeed;
    y = y + yspeed;

    if ((x > width) || (x < 0))  //충돌 처리
    {  
        xspeed = xspeed * -1;
    }

    if ((y > height) || (y < 0))  //충돌 처리
    {
        yspeed = yspeed * -1;
    }

    strokeWeight(2);
    fill(127);
    ellipse(x, y, 48, 48);
}
