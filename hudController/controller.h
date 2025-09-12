#define INTERRUPT_PIN PCINT1  // This is PB1 per the schematic
#define INT_PIN PB1           // Interrupt pin of choice: PB1 (same as PCINT1) - Pin 6
#define LED_PIN PB4           // PB4 - Pin 3
#define SOLENOID PB3


#define SOLENOID_CONSTANT 1000
#define SOLENOID_TIMEOUT 7000 //solenoid reaction timeout
#define LED_TIMEOUT 10000

#define PRESS_TIMEOUT 500

static float SetPoint[] = {0.7, 1.3};
