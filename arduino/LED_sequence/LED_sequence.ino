void setup() {
  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT); // sets all the output pins
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(8, OUTPUT);
  pinMode(9, OUTPUT);
}

void loop() {
  
  for (int i = 1; i <= 9; i++){ // swap with this to change direction  for (int i = 9; i >= 1; i--){

      digitalWrite(i, HIGH);  // turns led i on
      delay(200);           // delays the pragram for 200ms, so the led stays on long enough to notice
      digitalWrite(i, LOW); // turns led i off
  }
  
}
