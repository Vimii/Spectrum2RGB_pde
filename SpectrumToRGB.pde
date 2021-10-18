import java.util.Map;

Spectrum input;

Bar sp[];

static float k;

static int barItv = 26;

void setup() {
  size(1260, 720);
  
  input = new Spectrum();
  input.setSpectrum(D65_Data);
  
  //calc k
  k = 0.f;
  for(int i=0; i<sampleNum;i++){
    k+=cie1931_tbl[sampleNum+i];
  }
  println("k=" + k);
  
  sp = new Bar[sampleNum];
  for(int i=0; i<sampleNum;i++){
    sp[i] = new Bar(20 + barItv*i,100,getWavelength(i));
    sp[i].setValue(input.getValue(i));
  }
}

void draw(){
  //値更新
  if(mousePressed == true){
    int idx;
    for(idx = 0; idx<(mouseX - barItv/2.f - 20)/(float)barItv;idx++){}
    if(idx<sampleNum){
      sp[idx].value = MAXVALUE/barHeight*(100 + barHeight - mouseY);
      if(mouseY>100+barHeight) sp[idx].value = 0;
      input.setValue(idx,sp[idx].value);
    }
  }
  
  
  float xyz[] = input.spectram_xyz();
  float srgb[] = xyz2srgb(xyz);
  background(srgb[0],srgb[1],srgb[2]);
  push();
  textSize(30);
  text("xyz(" + xyz[0] +  "," + xyz[1] +  "," + xyz[2] + ")",10,height-30);
  text("rgb(" + srgb[0] +  "," + srgb[1] +  "," + srgb[2] + ")",width/2+10,height-30);
  pop();
  
  for(int i=0; i<sampleNum;i++){
    sp[i].drawBar();
  }
}
