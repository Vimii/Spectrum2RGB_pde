float barHeight = 500;
final float MAXVALUE = 150.f;

class Bar{
  protected float value;
  protected float label;
  protected int x,y;
  Bar(int x, int y, float label){
    this.x = x; this.y = y; this.label = label;
    value = 0.f; 
  }
  
  public void setValue(float v){value = v;}
  
  public void drawBar(){
    push();
    fill(255);
    circle(x,y+barHeight - barHeight*value/MAXVALUE,10);
    textSize(13);
    text(int(label),x-12,y+barHeight + 20);
    pop();
  }
  
}
