#include <avr/io.h>
#include <avr/interrupt.h>
#include <Arduino.h>

#include "blinks.h"
#include "controller.h"

static void blinks::init() {
  // Configure counter/timer1 for fast PWM on PB4
    GTCCR = 1<<PWM1B | 3<<COM1B0;
    TCCR1 = 3<<COM1A0 | 7<<CS10;
    OCR1B = LED_OFF;
}

static void blinks::setLedIntensity(int intensity) { 
  OCR1B = intensity; 
}
 
static void blinks::setLed(int SetPointIdx) {
  if(SetPointIdx) {
    blinks::setLedIntensity(LED_LOW);
  }
  else {
    blinks::setLedIntensity(LED_OFF);
  }
}
 
static void blinks::blinkError() {
  while(1) {
    setLedIntensity(LED_OFF);
    delay(LONG_BLINK);
    setLedIntensity(LED_LOW);
    delay(LONG_BLINK);
  }
}

static void blinks::calibrateBlink() {
  for(int i=0; i<10; ++i ) {
    setLedIntensity(LED_OFF);
    delay(SHORT_BLINK);
    setLedIntensity(LED_HIGH);
    delay(SHORT_BLINK);
  }
  setLedIntensity(LED_OFF);
}

static void blinks::blinkBatt(int level) {
  for(int i=0; i<level; ++i) {
    setLedIntensity(LED_OFF);
    delay(LONG_BLINK);
    setLedIntensity(LED_HIGH);
    delay(LONG_BLINK);
  }
  setLedIntensity(LED_OFF);
  delay(2*LONG_BLINK);
}

static void blinks::blinkOk() {
  setLedIntensity(LED_OFF);
  for(int i=0; i<2; ++i) {
    delay(LONG_BLINK);
    setLedIntensity(LED_HIGH);
    delay(LONG_BLINK);
    setLedIntensity(LED_LOW);
  }
  delay(LONG_BLINK);
  setLedIntensity(LED_OFF);
}

static void blinks::blinkPPO2(float ppo2Level, int SetPointIdx) {
  int bl = round(ppo2Level*10 - SetPoint[SetPointIdx]*10);
  int speed = SHORT_BLINK;
  byte intensity = LED_LOW;
  
  if(bl < -1) speed = SHORT_BLINK;
  else speed = LONG_BLINK;
  
  if((ppo2Level < 0.6) || (ppo2Level > 1.6)) intensity = LED_HIGH;

  bl = abs(bl);
  if(bl == 0) bl = 1;

  setLedIntensity(LED_OFF);
  delay(2*LONG_BLINK);

  for(int i=0; i<bl; ++i) {
    setLedIntensity(intensity);
    delay(speed);
    setLedIntensity(LED_OFF);
    delay(SHORT_BLINK);
  }
  delay(2*LONG_BLINK);
}
