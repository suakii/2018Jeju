
void setup()
{
    size(500,500);  
}

void draw() 
{
    background(255);
    f(width/2,height/2,width); 
    noLoop();
}

void f(int x, int y, float r) 
{
    ellipse(x, y, r, r);
    if(r > 2) {
        r *= 0.75f;
        f(x, y, r);   
    }        
}
