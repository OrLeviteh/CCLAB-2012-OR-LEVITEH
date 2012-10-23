#include "pitches.h"


int LDR = 0;                                //analog pin to which LDR is connected, here we set it to 0 so it means A0
float LDRValue = 0;                    //that’s a variable to store LDR values
int light_sensitivity = 700;  //This is the approx value of light surrounding your LDR
int ledred = 11;
int brightness = 0;
int fadeAmount = 5;
float Lowww = 900;
int ledeyes = 13;

// notes in the melody:
int melody[] = {
  NOTE_D6, NOTE_F6,0,NOTE_D7,NOTE_E7, NOTE_F7, NOTE_G7, NOTE_A7, NOTE_B7, NOTE_C8,0};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {
  16,8,16,32,32,32,32,32,32,32,4 };


void setup()
{
  Serial.begin(9600);            //start the serial monitor with 9600 buad
  pinMode(11, OUTPUT);     //we mostly use13 because there is already a built in yellow LED in arduino which shows output when 13 pin is enabled
  pinMode (ledeyes,OUTPUT);

}

void loop()
{
  LDRValue = analogRead(LDR);          //reads the ldr’s value through LDR which we have set to Analog input 0 “A0″
  //Serial.println(LDRValue);   //prints the LDR values to serial monitor
  
  delay(50);   
  float Matt = map(LDRValue, Lowww, 1000, 0, 255);
  Serial.println(Matt);


  digitalWrite(ledeyes, HIGH);  

  if(LDRValue > Lowww)
  {
    analogWrite(ledred, Matt);
  }

  else{
    analogWrite(ledred, LOW);


  }

  if (Matt >= 260) {     
    digitalWrite(ledred, HIGH);
     delay(2700);

//delay(2750);
    for (int thisNote = 0; thisNote < 8; thisNote++) {

      // to calculate the note duration, take one second 
      // divided by the note type.
      //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
      int noteDuration = 1000/noteDurations[thisNote];
      tone(2, melody[thisNote],noteDuration);

      int pauseBetweenNotes = noteDuration * 1.30;
      delay(pauseBetweenNotes);
      // stop the tone playing:
      noTone(2);
    }    
  

} 
  else {
    noTone(2); 
  }


}





