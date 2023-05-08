const int SW_pin = 2; // Switch pin
const int X_pin = 0;  // X-axis pin
const int Y_pin = 1;  // Y-axis pin

void setup() {
  pinMode(SW_pin, INPUT_PULLUP); // Set switch pin as input with internal pull-up resistor
  Serial.begin(9600);
}

void loop() {
  int x = analogRead(X_pin); // Read X-axis value
  int y = analogRead(Y_pin); // Read Y-axis value
  int buttonState = digitalRead(SW_pin); // Read switch state

  Serial.print("X-axis: ");
  Serial.print(x);
  Serial.print("\tY-axis: ");
  Serial.print(y);
  Serial.print("\tSwitch: ");
  Serial.println(buttonState);
  delay(100);
}
