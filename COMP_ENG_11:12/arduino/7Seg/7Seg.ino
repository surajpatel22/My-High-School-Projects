/* this will display the numbers 0 - 9
 *  
 */
void setup() {
  pinMode(1, OUTPUT);
  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
}

void clearAll(){
  for (int i = 1; i <= 7; i++){
    digitalWrite(i, HIGH);
  }
}

void digitZero(){
  clearAll();
  for (int i = 1; i <= 6; i++){
    digitalWrite(i, LOW);
  }
  digitalWrite(7, HIGH);
}

void digitOne(){
  clearAll();
  digitalWrite(1, HIGH);
  digitalWrite(2, LOW);
  digitalWrite(3, LOW);
  for (int i = 4; i <= 7; i++){
    digitalWrite(i, HIGH);
  }
}

void digitTwo(){
  clearAll();
  for (int i = 1; i <= 7; i++){
    digitalWrite(i, LOW);
  }
  digitalWrite(3, HIGH);
  digitalWrite(6, HIGH);
}

void digitThree(){
  clearAll();
  for (int i = 1; i <= 7; i++){
    digitalWrite(i, LOW);
  }
  digitalWrite(5, HIGH);
  digitalWrite(6, HIGH);
}

void digitFour(){
  clearAll();
  for (int i = 1; i <= 7; i++){
    digitalWrite(i, LOW);
  }
  digitalWrite(1, HIGH);
  digitalWrite(4, HIGH);
  digitalWrite(5, HIGH);
}

void digitFive(){
  clearAll();
  for (int i = 1; i <= 7; i++){
    digitalWrite(i, LOW);
  }
  digitalWrite(2, HIGH);
  digitalWrite(5, HIGH);
}

void digitSix(){
  clearAll();
  for (int i = 1; i <= 7; i++){
    digitalWrite(i, LOW);
  }
  digitalWrite(2, HIGH);
}

void digitSeven(){
  clearAll();
  for (int i = 1; i <= 3; i++){
    digitalWrite(i, LOW);
  }
}

void digitEight(){
  clearAll();
  for (int i = 1; i <= 7; i++){
    digitalWrite(i, LOW);
  }
}

void digitNine(){
  clearAll();
  for (int i = 1; i <= 7; i++){
    digitalWrite(i, LOW);
  }
  digitalWrite(5, HIGH);
}


void loop() {
  digitZero();
  delay(1000);
  digitOne();
  delay(1000);
  digitTwo();
  delay(1000);
  digitThree();
  delay(1000);
  digitFour();
  delay(1000);
  digitFive();
  delay(1000);
  digitSix();
  delay(1000);
  digitSeven();
  delay(1000);
  digitEight();
  delay(1000);
  digitNine();
  delay(1000);
  
}
