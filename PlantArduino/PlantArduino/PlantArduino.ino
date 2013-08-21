
int sensorPin = A0;    // select the input pin for the potentiometer
int ledPin = 13;      // select the pin for the LED
int sensorValue = 0;  // variable to store the value coming from the sensor

void setup() {
  // declare the ledPin as an OUTPUT:
  pinMode(ledPin, OUTPUT);  
  Serial.begin(19200);
}

void loop() {
  // read the value from the sensor:
  sensorValue = analogRead(sensorPin);    

  Serial.print("SENSOR:");
  Serial.println(sensorValue);
  
  // turn the ledPin on
  digitalWrite(ledPin, HIGH);  
  
  // wait a bit
  delay(500);          
  
  // turn the ledPin off:        
  digitalWrite(ledPin, LOW);   
  
  // wait a bit
  delay(500);
  
}
