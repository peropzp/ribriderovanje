#include <avr/io.h>
#include <avr/interrupt.h>

#include "pid.h"
#include "PPOSensor.h"
#include "controller.h"
#include "blinks.h"

unsigned long lastSolenoidTime = 0;
unsigned long lastBlinkTime = 0;
unsigned long solenoidCloseTime = 0;

volatile int piezo_pressed = 0;
unsigned long lastPressTime = 0;
int pressCount = 0;

volatile int SetPointIdx = 0; 

boolean calibrate = false;

PID *pid;
PPOSensor *ppo;

ISR(PCINT0_vect) {
  if( digitalRead(INT_PIN) == LOW ) ++piezo_pressed;
}

void setup() {
    // enabling the interrupt 
    cli();                            // Disable interrupts during setup
    PCMSK |= (1 << INTERRUPT_PIN);    // Enable interrupt handler (ISR) for our chosen interrupt pin (PCINT1/PB1/pin 6)
    GIMSK |= (1 << PCIE);             // Enable PCINT interrupt in the general interrupt mask
    pinMode(INT_PIN, INPUT_PULLUP);   // Set our interrupt pin as input with a pullup to keep it stable
    sei();                            // Enable interrupts after setup

    //solenoid pin
    pinMode(SOLENOID, OUTPUT);        
    digitalWrite(SOLENOID, LOW);      

    //led init
    pinMode(LED_PIN, OUTPUT);         // Set our chosen LED visual feedback as an output pin (PB4 / Pin 3)
    digitalWrite(LED_PIN, LOW);      
    blinks::init();
    
    //initialize PID and set it to low setpoint
    pid = new PID(SetPoint[0]);

    //initialize ADC for reading PPO2 sensors
    ppo = new PPOSensor();
    if(!ppo->init()) blinks::blinkError();

    //battery blink
    blinks::blinkBatt(ppo->getBatLevel());
    
    //blink Ok
    blinks::blinkOk();
}

void piezo_response() {
  if(millis() <= (lastPressTime + PRESS_TIMEOUT) ) {
     pressCount += piezo_pressed;
     if(pressCount > 4) {
        calibrate = true;
      }
  }
  else {
    pressCount = 0;
    SetPointIdx ^=1;
    pid->setSetpoint( SetPoint[SetPointIdx] );
  }
        
  lastPressTime = millis();
  piezo_pressed = 0;
}

void fireSolenoid(int timeMillis) {
  delay(100);
  digitalWrite(SOLENOID, HIGH);
  delay(timeMillis);
  digitalWrite(SOLENOID, LOW);
  delay(100);
}

void loop() {
  float ppo2;

  if(piezo_pressed) piezo_response();
  
  if(calibrate) {
    ppo->calibrate();
    blinks::calibrateBlink();
    calibrate = false;
  }
  
  //blink ppo2
  if(millis() >= (lastBlinkTime + BLINK_TIMEOUT) ) { //blink ppo2
    lastBlinkTime = millis();
    ppo2 = ppo->read();
    blinks::blinkPPO2(ppo2, SetPointIdx);
  }
  else if(millis() < lastBlinkTime) 
    lastBlinkTime = millis(); //fix millis rollover

  blinks::setLed(SetPointIdx);

  //open solenoid
  if(millis() >= (lastSolenoidTime + SOLENOID_TIMEOUT) ) { 
    lastSolenoidTime = millis();
    pid->setSetpoint(SetPoint[SetPointIdx]);
    ppo2 = ppo->read();

    unsigned long solTime = pid->calculate(ppo2) * SOLENOID_CONSTANT;
    if(solTime > 100) {
      solenoidCloseTime = lastSolenoidTime + solTime;
      digitalWrite(SOLENOID, HIGH);
    }
  }
  else if(millis() < lastSolenoidTime) {
    lastSolenoidTime = millis(); //fix millis rollover
    solenoidCloseTime = 0;
  }

  //shut solenoid
  if(millis() >= solenoidCloseTime) {
    digitalWrite(SOLENOID, LOW);   
  }  


  delay(10);
}
