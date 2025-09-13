#ifndef blinks_h
#define blinks_h

#define LONG_BLINK 700
#define SHORT_BLINK 100
#define BLINK_TIMEOUT 10000


#define LED_OFF 255
#define LED_LOW 224
#define LED_HIGH 0

class blinks {
  private :
    static void setLedIntensity(int intensity);

  public :
    static void init();
    static void blinkError();
    static void calibrateBlink();
    static void blinkBatt(int level);
    static void blinkOk();
    static void blinkPPO2(float ppo2Level, int SetPointIdx);
    static void setLed(int SetPointIdx);  
};

#endif
