const int SW_pin = 2; 
const int X_pin = 0;  
const int Y_pin = 1; 

void setup() {
  pinMode(SW_pin, INPUT_PULLUP); 
  Serial.begin(9600);
}

void loop() {
  int x = analogRead(X_pin); 
  int y = analogRead(Y_pin); 
  int buttonState = digitalRead(SW_pin); 

  Serial.print("X-axis: ");
  Serial.print(x);
  Serial.print("\tY-axis: ");
  Serial.print(y);
  Serial.print("\tSwitch: ");
  Serial.println(buttonState);
  delay(100);
}
