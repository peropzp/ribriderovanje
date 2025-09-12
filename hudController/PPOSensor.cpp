
#include "PPOSensor.h"


PPOSensor::PPOSensor() {
  ads = new Adafruit_ADS1115();
}

boolean PPOSensor::init() {
  ads->setGain(GAIN_SIXTEEN); // 16x gain  +/- 0.256V  1 bit = 0.125mV/16 = 0.0078125mV
  readCalibration();
  return ads->begin();
}

void PPOSensor::readCalibration() {
  EEPROM.get(0 * sizeof(float), cal0);
  EEPROM.get(1 * sizeof(float), cal1);
  EEPROM.get(2 * sizeof(float), cal2);
}

void PPOSensor::writeCalibration() {
  EEPROM.put(0 * sizeof(float), cal0);
  EEPROM.put(1 * sizeof(float), cal1);
  EEPROM.put(2 * sizeof(float), cal2);
}

void PPOSensor::calibrate() {
  int16_t adc0, adc1, adc2;

  adc0 = ads->readADC_SingleEnded(0);
  adc1 = ads->readADC_SingleEnded(1);
  adc2 = ads->readADC_SingleEnded(2);
  cal0 = CALIBRATION / (float)adc0;
  cal1 = CALIBRATION / (float)adc1;
  cal2 = CALIBRATION / (float)adc2;

  writeCalibration();
}

float PPOSensor::vote(float ppo0, float ppo1, float ppo2) {
  float diff0, diff1, diff2;

  diff0 = (ppo0-ppo1)*(ppo0-ppo1);
  diff1 = (ppo1-ppo2)*(ppo1-ppo2);
  diff2 = (ppo2-ppo0)*(ppo2-ppo0);

  if( (diff0 <= diff1) && (diff0 <= diff2) ) return (ppo0 + ppo1)/2.0;
  else if(  (diff1 <= diff0) && (diff1 <= diff2) ) return (ppo1 + ppo2)/2.0;
  else if(  (diff2 <= diff0) && (diff2 <= diff1) ) return (ppo0 + ppo2)/2.0;
  else return (ppo0 + ppo1 + ppo2) /3.0;
}

float PPOSensor::read() {
  float adc0 = 0, adc1 = 0, adc2 = 0;

  adc0 = ads->readADC_SingleEnded(1);
  adc1 = ads->readADC_SingleEnded(2);
  adc2 = ads->readADC_SingleEnded(3);
  
  ppo0 = (float)adc0 * cal0;
  ppo1 = (float)adc1 * cal1;
  ppo2 = (float)adc2 * cal2;
   
  float ppov = vote(ppo0, ppo1, ppo2);
  /////////////////////////////////////////
  //ppov = 0.9;
  /////////////////////////////////////////
  return ppov;
} 

int PPOSensor::getBatLevel() {
  float adc = 0;
  adc = ads->readADC_SingleEnded(0)*0.0078125;
  float U = adc * 11.0 / 150.0;
  if(U>8.0) return 5;
  else if(U>7.5) return 4;
  else if(U>7.0) return 3;
  else if(U>6.5) return 2;
  else return 1;
}
