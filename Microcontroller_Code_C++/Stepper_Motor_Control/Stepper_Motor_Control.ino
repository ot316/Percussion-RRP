//Author: Jacob Tan
//This code runs on an arduino uno and rotates a stepper motor. The speed can be controlled by changing the delaytime variable

#define EN        8

//Direction pin
#define X_DIR     5

//Step pin
#define X_STP     2


//DRV8825
int delayTime = 400; //Delay between each pause (uS)
int stps = 200; // Steps to move
int incomingByte = 0;

void step(boolean dir, byte dirPin, byte stepperPin, int steps)

{

 digitalWrite(dirPin, dir);

 for (int i = 0; i < steps; i++) {

    digitalWrite(stepperPin, HIGH);

    delayMicroseconds(delayTime);

    digitalWrite(stepperPin, LOW);

    delayMicroseconds(delayTime);

  }

}

void setup() {
  pinMode(X_DIR, OUTPUT); 
  pinMode(X_STP, OUTPUT);
  pinMode(EN, OUTPUT);

  digitalWrite(EN, LOW);

}

void loop() {
  step(true, X_DIR, X_STP, stps);
}
