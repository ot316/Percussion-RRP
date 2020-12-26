// Author: Jacob Tan
// This code runs on an arduino uno and controls the speed of a continuous stepper motor. the delaytime variable controls the speed.

long pos = 0;
int const delaytime = 700;

void setup() {
pinMode(9, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
digitalWrite(9, HIGH);
delayMicroseconds(delaytime);
digitalWrite(9, LOW);
delayMicroseconds(delaytime);
}
