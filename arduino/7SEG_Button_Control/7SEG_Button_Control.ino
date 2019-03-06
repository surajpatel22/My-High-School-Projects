
bool lastpressed = false;

void setup() {
  pinMode(1, OUTPUT);
  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(9, INPUT);
  Serial.begin(9600);
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

int num = 0;


void loop() {
  Serial.println(digitalRead(9));
  if (digitalRead(9) == 1){
    num += 1;
  }
  
  if (num == 0){
    digitZero();
  } 
  else if (num == 1){
    digitOne();
  }
  else if (num == 2){
    digitTwo();
  }
  else if (num == 3){
    digitThree();
  }
  else if (num == 4){
    digitFour();
  }
  else if (num == 5){
    digitFive();
  }
  else if (num == 6){
    digitSix();
  }
  else if (num == 7){
    digitSeven();
  }
  else if (num == 8){
    digitEight();
  }
  else if (num == 9){
    digitNine();
  }
  else {
    num = 0;
  }
    delay(1000);
}
