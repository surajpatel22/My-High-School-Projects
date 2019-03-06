/*
 Controlling a servo position using a joystick
 by Michal Rinott <http://people.interaction-ivrea.it/m.rinott>

 modified on 8 Nov 2013
 by Scott Fitzgerald
 http://www.arduino.cc/en/Tutorial/Knob
*/

#include <Servo.h>

Servo serv1;  // create servo object to control a servo
Servo serv2;  // create servo object to control another servo

int val1;    // variable to read the value from the analog pin
int val2;    // variable to read the value from the analog pin

void setup() {
  serv1.attach(9);  // attaches the servo on pin 9 to the serv1 object
  serv2.attach(8);  // attaches the servo on pin 9 to the serv2 object
}

void loop() {
  val1 = analogRead(0);            // reads the value of the potentiometer(on the joystick) (value between 0 and 1023)
  val2 = analogRead(1);            // reads the value of the potentiomete(on the joystick)r (value between 0 and 1023)
  val1 = map(val1, 0, 1023, 0, 180);     // scale it to use it with the servo (value between 0 and 180)
  val2 = map(val2, 0, 1023, 0, 180);     // scale it to use it with the servo (value between 0 and 180)
  serv1.write(val1);                  // sets the serv1 position according to the scaled value
  serv2.write(val2);                  // sets the serv2 position according to the scaled value  
  delay(15);                           // waits for the servo to get there
}

