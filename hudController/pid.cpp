/*
  pid.cpp -  Lib for PID controller.
  Created 17.07.2022.
*/

#include "pid.h"

PID::PID(float _setpoint) {
    setpoint = _setpoint;
    lastPPO2 = 0;
    lastSetpoint = 0;
    integralError = 0;
    sumError = 0;
    calcPerBar = 1;
}

void PID::setSetpoint(float _setpoint) {
    lastSetpoint = setpoint;
    setpoint = _setpoint;
}

float PID::calculate(float ppo2) {
  float calc = 0;
  
  sumError += (setpoint-ppo2)*(setpoint-ppo2);


  if(lastCycleAdd) {      
    float error = setpoint - ppo2;
    float lastError = lastSetpoint - lastPPO2;
    float correction = 1;

    integralError = (integralError + error)/2 ;// lastSetPPO2 - lastPPO2;
    float diffError = error - lastError;

    if(error > histeresis) {
      correction = limitCorrection;
    }
    else if(error < (-1*histeresis)) {
      correction = 1.0/limitCorrection;
    }

    if(integralError > histeresis) {
      correction += limitCorrection*integralCorrection;
    }
    else if(integralError < (-1*histeresis)) {
      correction -= limitCorrection*integralCorrection;
    }
    
    if(diffError > histeresis) {
      correction += limitCorrection*diffCorrection;
    }

    else if(diffError < (-1*histeresis)) {
      correction -= limitCorrection*diffCorrection;
    }
    
    calcPerBar *= correction;
    lastCycleAdd = 0;
  }
  
  if(ppo2 < (setpoint - histeresis)) {
    calc = (setpoint - ppo2) * (calcPerBar);
    lastPPO2 = ppo2;
    lastSetpoint = setpoint;
    if(calc > limitCalc) calc = limitCalc;
    lastCycleAdd = 1;
  }
  else if(ppo2 < setpoint) {
    calc = (setpoint - ppo2) * (calcPerBar);
    lastPPO2 = ppo2;
    lastSetpoint = setpoint;
    if(calc > limitCalc) calc = limitCalc;
    lastCycleAdd = 1;
  }
  else if(ppo2 < (setpoint + histeresis)) {
    calc = (ppo2 - setpoint) * (calcPerBar);
    lastPPO2 = ppo2;
    lastSetpoint = setpoint;
    if(calc > limitCalc) calc = limitCalc;
    lastCycleAdd = 1;
  }

  return calc;
}
