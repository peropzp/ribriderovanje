/*
  pid.h -  Lib for PID controller.
  Created 17.07.2022.
  
*/
#ifndef pid_h
#define pid_h

#define limitCorrection 1.1
#define integralCorrection 0.4
#define diffCorrection 0.4
#define histeresis 0.01
#define limitCalc 7

class PID
{
  public:
    PID(float _setpoint);
    void setSetpoint(float _setpoint);
    float calculate(float ppo2);
  private:
    float setpoint;
    float lastPPO2;
    float lastSetpoint;
    float integralError;
    float sumError;
    float calcPerBar;
    int lastCycleAdd = 0;
};

#endif
