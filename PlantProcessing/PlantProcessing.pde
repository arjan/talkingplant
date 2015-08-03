
// This function gets called once, at the start of the program.
void setup() {
  
  // Set the screen size.
  size(640, 480);
  
  // This sets up the connection to Twitter. See the twitter_setup.pde file
  setupTwitter();
  
  // Setup the sensor communication
  setupSensor();
}


// This function gets called all the time
void draw() {
  getSensorValue();
  String health = calculateHealth(sensorValue);
  
  background(0);
  if (health.equals("dry")) 
    fill(255,0,0); // red
  if (health.equals("medium")) 
    fill(255,168,0); // orange
  if (health.equals("moist")) 
    fill(0,255,0); // green
  if (health.equals("drowning")) 
    fill(255,255,0); // yellow
  clear();
  textSize(40);
  
  considerTweeting(health);
  
  text("Plant value: " + sensorValue  + "\n" + 
        "Health: " + health, 60, 120);

  fill(128,128,128); // gray  
  textSize(20);      
  if (lastTweetText != null) {
        text(lastTweetText + "\n" + "Posted " + getLastTweetInSeconds() + " seconds ago.", 60, 240);
  }
  
  text("Next tweet in " + getNextTweetInSeconds(health) + " seconds.", 60, 340);
  
  text("http://is.gd/wkarduino", 60, 60);
}

