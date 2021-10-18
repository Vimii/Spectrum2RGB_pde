final static int sampleNum = 48;
final static float WAVELENGTH_MIN = 360.f;
final static float WAVELENGTH_MAX = 830.f;
final static float sampleItv = 10.f;


class Spectrum{

  protected float values[];


  public Spectrum() {
    values = new float[sampleNum];
  }

  public void setSpectrum(float[] data) {
    values = data;
  }

  public float[] getSpectrum() {
    return values;
  }
  public void setValue(int idx, float value) {
    values[idx] = value;
  }

  public float getValue(int idx) {
    return values[idx];
  }
  
  
  public float[] spectram_xyz(){
    float xyz[] = {0.f,0.f,0.f};
    
    for(int i=0;i<sampleNum;i++){
      xyz[0] += values[i] * cie1931_tbl[i];
      xyz[1] += values[i] * cie1931_tbl[sampleNum + i];
      xyz[2] += values[i] * cie1931_tbl[sampleNum*2 + i];
    }
    
    xyz[0] = xyz[0]/k; xyz[1] = xyz[1]/k; xyz[2] = xyz[2]/k;
    
    //Y = 100に正規化
    float a = 100.f / xyz[1];
    xyz[0] = xyz[0]*a; xyz[1] = 100.f; xyz[2] = xyz[2]*a;
    
    return xyz;
  }
}

//util

static public int getIdx(float wavelength) {
  int idx=0;
  while (wavelength > WAVELENGTH_MIN + sampleItv*idx + sampleItv/2.f) {
    idx++;
  };
  return idx;
}

static public float getWavelength(int idx) {
  return WAVELENGTH_MIN + sampleItv*idx;
}

static public float[] xyz2rgb(float[] xyz){
  float rgb[] = {0.f,0.f,0.f};
  
  rgb[0] = 3.2404542 * xyz[0] - 1.5371385 * xyz[1] - 0.4985314 * xyz[2];
  rgb[1] = -0.9692660 * xyz[0] + 1.8760108 * xyz[1] + 0.0415560 * xyz[2];
  rgb[2] = 0.0556434 * xyz[0] - 0.2040259 * xyz[1] + 1.0572252 * xyz[2];
  
  return rgb;
}


//Data


final static float D65_Data[] = {
    46.6383, 
    52.0891, 
    49.9755, 
    54.6482, 
    82.7549, 
    91.486, 
    93.4318, 
    86.6823, 
    104.865, 
    117.008, 
    117.812, 
    114.861, 
    115.923, 
    108.811, 
    109.354, 
    107.802, 
    104.79, 
    107.689, 
    104.405, 
    104.046, 
    100, 
    96.3342, 
    95.788, 
    88.6856, 
    90.0062, 
    89.5991, 
    87.6987, 
    83.2886, 
    83.6992, 
    80.0268, 
    80.2146, 
    82.2778, 
    78.2842, 
    69.7213, 
    71.6091, 
    74.349, 
    61.604, 
    69.8856, 
    75.087, 
    63.5927, 
    46.4182, 
    66.8054, 
    63.3828, 
    64.304, 
    59.4519, 
    51.959, 
    57.4406, 
    60.3125
  };





final static float cie1931_tbl[] = {
  0.000129900000, 0.000414900000, 
  0.001368000000, 0.004243000000, 
  0.014310000000, 0.043510000000, 
  0.134380000000, 0.283900000000, 
  0.348280000000, 0.336200000000, 
  0.290800000000, 0.195360000000, 
  0.095640000000, 0.032010000000, 
  0.004900000000, 0.009300000000, 
  0.063270000000, 0.165500000000, 
  0.290400000000, 0.433449900000, 
  0.594500000000, 0.762100000000, 
  0.916300000000, 1.026300000000, 
  1.062200000000, 1.002600000000, 
  0.854449900000, 0.642400000000, 
  0.447900000000, 0.283500000000, 
  0.164900000000, 0.087400000000, 
  0.046770000000, 0.022700000000, 
  0.011359160000, 0.005790346000, 
  0.002899327000, 0.001439971000, 
  0.000690078600, 0.000332301100, 
  0.000166150500, 0.000083075270, 
  0.000041509940, 0.000020673830, 
  0.000010253980, 0.000005085868, 
  0.000002522525, 0.000001251141, 

  0.000003917000, 0.000012390000, 
  0.000039000000, 0.000120000000, 
  0.000396000000, 0.001210000000, 
  0.004000000000, 0.011600000000, 
  0.023000000000, 0.038000000000, 
  0.060000000000, 0.090980000000, 
  0.139020000000, 0.208020000000, 
  0.323000000000, 0.503000000000, 
  0.710000000000, 0.862000000000, 
  0.954000000000, 0.994950100000, 
  0.995000000000, 0.952000000000, 
  0.870000000000, 0.757000000000, 
  0.631000000000, 0.503000000000, 
  0.381000000000, 0.265000000000, 
  0.175000000000, 0.107000000000, 
  0.061000000000, 0.032000000000, 
  0.017000000000, 0.008210000000, 
  0.004102000000, 0.002091000000, 
  0.001047000000, 0.000520000000, 
  0.000249200000, 0.000120000000, 
  0.000060000000, 0.000030000000, 
  0.000014990000, 0.000007465700, 
  0.000003702900, 0.000001836600, 
  0.000000910930, 0.000000451810, 

  0.000606100000, 0.001946000000, 
  0.006450001000, 0.020050010000, 
  0.067850010000, 0.207400000000, 
  0.645600000000, 1.385600000000, 
  1.747060000000, 1.772110000000, 
  1.669200000000, 1.287640000000, 
  0.812950100000, 0.465180000000, 
  0.272000000000, 0.158200000000, 
  0.078249990000, 0.042160000000, 
  0.020300000000, 0.008749999000, 
  0.003900000000, 0.002100000000, 
  0.001650001000, 0.001100000000, 
  0.000800000000, 0.000340000000, 
  0.000190000000, 0.000049999990, 
  0.000020000000, 0.000000000000, 
  0.000000000000, 0.000000000000, 
  0.000000000000, 0.000000000000, 
  0.000000000000, 0.000000000000, 
  0.000000000000, 0.000000000000, 
  0.000000000000, 0.000000000000, 
  0.000000000000, 0.000000000000, 
  0.000000000000, 0.000000000000, 
  0.000000000000, 0.000000000000, 
  0.000000000000, 0.000000000000
};
