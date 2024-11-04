#include<SPI.h>

#define no_Arena 64
#define no_IC 8

// #define latchPin 48
#define latchPin 7

int dataReceived[no_Arena];
byte dataToSend[no_IC];

void setup()
{
  pinMode(latchPin, OUTPUT);
  digitalWrite(latchPin, HIGH);
  
  Serial.begin(115200);
  SPI.setBitOrder(LSBFIRST);
  SPI.begin();
  digitalWrite(latchPin,LOW);
    for(int i=no_IC-1;i>=0;i--)
    {
      SPI.transfer(0);
    }
    digitalWrite(latchPin,HIGH);
}
void loop()
{
  if(Serial.available())
  {
    String shockStr = Serial.readString();
    for(int i = 0; i < no_IC; i++)
    {
      String str = shockStr.substring(i*8,i*8+8);
      //Serial.println(str);
      float n = 0;
      int fact;
      for(int j = 0; j < 8; j++)
      {
        if(str.charAt(j)=='O') fact = 0;
        else if(str.charAt(j)=='X') fact =1;
        n = n + fact*pow(2,7-j);
      }
      //Serial.println(n);
      dataToSend[i] = int(round(n));
      //Serial.println(dataToSend[i]);
    }
    
    digitalWrite(latchPin,LOW);
    for(int i=no_IC-1;i>=0;i--)
    {
      SPI.transfer(dataToSend[i]);
    }
    digitalWrite(latchPin,HIGH);
  }
}
