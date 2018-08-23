int num;
void setup() {
    size(500,500);
}
void draw() {
    int r = fact(num);
    num++;
    ellipse(width/2, height/2, r, r);
    println(r);
    if (num > 5)
        noLoop();  //화면을 다시 그리는 것을 멈추게 한다.
    delay(500);    //delay(millisecond)
}

int fact(int n) {
    if (n <=1)
        return 1;
    else
        return n*fact(n-1);
}
