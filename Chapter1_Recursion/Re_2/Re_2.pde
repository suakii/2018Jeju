void setup()
{
    size(500,500);  
}

void draw() 
{
    background(255);
    for (int i = width; i > 0; i*= 0.75) 
    {
        ellipse(width/2,height/2,i,i);
    }
}
