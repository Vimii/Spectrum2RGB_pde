import java.util.Map;

Spectrum D65;

static float k;

void setup() {
  size(1260, 720);
  textSize(30);
  
  setD65();
  
  //calc k
  k = 0.f;
  for(int i=0; i<sampleNum;i++){
    k+=cie1931_tbl[sampleNum+i];
  }
  println("k=" + k);
  

}

void draw(){
  float xyz[] = D65.spectram_xyz();
  float rgb[] = xyz2rgb(xyz);
  background(rgb[0],rgb[1],rgb[2]);
  text("xyz(" + xyz[0] +  "," + xyz[1] +  "," + xyz[2] + ")",10,height-30);
  text("rgb(" + rgb[0] +  "," + rgb[1] +  "," + rgb[2] + ")",width/2+10,height-30);
}
