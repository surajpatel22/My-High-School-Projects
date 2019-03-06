/*
 * speaker/buzzer says "... ___ ..." (SOS)
 */
void setup() {
  pinMode(4, OUTPUT);
}

void loop() {
  
  for (int i = 1; i <= 3; i++){
    tone(4, 500, 400);          // speaker/buzzer says ". . ."
    delay(800);
  }
  for (int i = 1; i <= 3; i++){
    tone(4, 500, 1000);          // speaker/buzzer says "_ _ _"
    delay(1400);
  }
  for (int i = 1; i <= 3; i++){
    tone(4, 500, 400);          // speaker/buzzer says ". . ."
    delay(800);
  }
  delay(2000);    // pause in between the SOS's
}
