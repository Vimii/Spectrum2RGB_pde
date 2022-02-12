double barHeight = 500;
final double MAXVALUE = 150.f;

class Bar{
  protected double value;
  protected double label;
  protected int x,y;
  Bar(int x, int y, double label){
    this.x = x; this.y = y; this.label = label;
    value = 0.f; 
  }
  
  public void setValue(double v){value = v;}
  
  public void drawBar(){
    push();
    fill(255);
    circle((float)x,(float)(y+barHeight - barHeight*value/MAXVALUE),10);
    textSize(13);
    text((int)(label),(float)(x-12),(float)(y+barHeight + 20));
    pop();
  }
  
}
