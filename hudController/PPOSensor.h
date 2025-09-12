/*
  PPOSensor.h -  Lib for PPO sensor values read.
  Created 17.07.2022.
  
*/
#ifndef PPOSensor_h
#define PPOSensor_h

#include <Adafruit_ADS1X15.h>
#include <EEPROM.h>

#define VOLTPERBITE 0.0078125
#define CALIBRATION 0.98

class PPOSensor 
{
  public:
    PPOSensor();
    boolean init();
    void calibrate();
    float read();
    int getBatLevel();
  private:
    float cal0, cal1, cal2;
    float ppo0, ppo1, ppo2;
    Adafruit_ADS1115 *ads;  /* Use this for the 16-bit version */
    
    void readCalibration();
    void writeCalibration();
    float vote(float ppo0, float ppo1, float ppo2);
};

#endif
