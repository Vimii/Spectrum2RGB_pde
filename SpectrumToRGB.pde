import java.util.Map;

Spectrum input;

Bar sp[];

static double k;

static int barItv = 26;

void setup() {
  size(1260, 720);

  input = new Spectrum();
  input.setSpectrum(D65_Data);
  //input.setIntensity(1.5);
  //input.multSpectrum(red_refrection);

  //calc k
  k = 0.f;
  //for (int i=0; i<sampleNum; i++) {
  //  double rambda = getWavelength(i);
  //  k+=0.821*gaussFunc(rambda, 568.8, 46.9, 40.5) + 0.286*gaussFunc(rambda, 530.9, 16.3, 31.1);
  //}
  for (int i=0; i<sampleNum; i++) {
    k+=cie1931_tbl_d[i+sampleNum];
  }
  println("k=" + k);

  sp = new Bar[sampleNum];
  for (int i=0; i<sampleNum; i++) {
    sp[i] = new Bar(20 + barItv*i, 100, getWavelength(i));
    sp[i].setValue(input.getValue(i));
  }

  //double xyz[] = {255.0/255.0, 255/255.0, 255.0/255.0};

  //println(xyz2srgb(srgb2xyz(xyz)));
}

void draw() {
  //値更新
  if (mousePressed == true) {
    int idx;
    for (idx = 0; idx<(mouseX - barItv/2.f - 20)/(double)barItv; idx++) {
    }
    if (idx<sampleNum) {
      sp[idx].value = MAXVALUE/barHeight*(100 + barHeight - mouseY);
      if (mouseY>100+barHeight) sp[idx].value = 0;
      input.setValue(idx, sp[idx].value);
    }
  }


  double xyz[] = input.spectram_xyz();
  double srgb[] = xyz2srgb(xyz);
  background((float)(srgb[0]*srgb[3]), (float)(srgb[1]*srgb[3]), (float)(srgb[2]*srgb[3]));
  push();
  textSize(20);
  fill(255 - (float)(srgb[0]*srgb[3]), 255-(float)(srgb[1]*srgb[3]), 255-(float)(srgb[2]*srgb[3]));
  text("xyz(" + xyz[0] +  "," + xyz[1] +  "," + xyz[2] + ")", 10, height-50);
  text("rgb(" + srgb[0] +  "," + srgb[1]+  "," + srgb[2] + ")", 10, height-30);
  pop();

  for (int i=0; i<sampleNum; i++) {
    sp[i].drawBar();
  }
}
