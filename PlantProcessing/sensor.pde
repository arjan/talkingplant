import processing.serial.*;
Serial port;

// This function opens our serial port. 
void setupSensor() {
  // IMPORTANT: Change the "portName" variable to the name of your serial port.
  String portName = "/dev/ttyACM4";
  port = new Serial(this, portName, 19200);
}


// This function reads the sensor value from the arduino. 
int sensorValue = -1;
boolean getSensorValue() {
  boolean reading = false;
  while (port.available() > 0) {
    String line = port.readStringUntil(10);
    if (line != null) {
      String[] list = split(line, ':');
      if (list[0].equals("SENSOR")) {
        sensorValue = int(list[1].trim());
        //println("Sensor reading: " + sensorValue);
        reading = true;
      }
    }
  }
  return reading;
}

//
// This function is the calibration of our plant logic.
// We have 4 states depending on the moisture level; from "drowning" to "dry".
// The value from the sensor gets converted in one of these strings.
String calculateHealth(int value) {
  if (value > 700)
    return "drowning";
  if (value > 500)
    return "moist";
  if (value > 300)
    return "medium";
    
  // 300 or less
  return "dry";    
}
