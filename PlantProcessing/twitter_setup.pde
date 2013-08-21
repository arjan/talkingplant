Twitter twitter;

// This is the twitter setup function. You need to create a twitter app at https://dev.twitter.com/ 
// and paste your configuration keys in here. You can find those keys on the "OAuth tool" page of your 
// new Twitter app. Be sure to allow "read and write" permission to the app, otherwise it cannot post messages.

void setupTwitter() {
  ConfigurationBuilder cb = new ConfigurationBuilder();
  
  
  cb.setOAuthConsumerKey("5z9hn5jZgvcoqOTKNJQAA");
  cb.setOAuthConsumerSecret("F9TuU09GLwvQS7AntSlb0GWzqC3hD3mrUSLodNtaBjs");
  cb.setOAuthAccessToken("92106926-O6hwvnniZBqJ41d7E4RVHEFwQcKOlwvqyWb996YuA");
  cb.setOAuthAccessTokenSecret("uuxIDE7jqSOfxpqJGy3HcxKjDxxcejqgtGUHWDgt00");
   
  twitter = new TwitterFactory(cb.build()).getInstance();
}

int tweetFrequency(String health) {
  if (health.equals("drowning")) 
    return 30;
  if (health.equals("moist")) 
    return 30;
  if (health.equals("medium")) 
    return 3;
  if (health.equals("dry")) 
    return 30;
  return 3000; // unknown health?
}    

int intervalBetweenTweets = 3; // 5 minutes
int lastTweet = millis();
String lastTweetText = null;


void considerTweeting(String health) {
   if (lastTweet + tweetFrequency(health) * 1000 > millis()) {
     return;
   }
   
   //println("I should tweet something now about: " + health);
   lastTweetText = getRandomTweet(health);
   println(lastTweetText);

   lastTweet = millis();
}

int getLastTweetInSeconds() {
  return (millis() - lastTweet) / 1000;
}
