Twitter twitter;

void setup() {
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("5z9hn5jZgvcoqOTKNJQAA");
  cb.setOAuthConsumerSecret("F9TuU09GLwvQS7AntSlb0GWzqC3hD3mrUSLodNtaBjs");
  cb.setOAuthAccessToken("92106926-O6hwvnniZBqJ41d7E4RVHEFwQcKOlwvqyWb996YuA");
  cb.setOAuthAccessTokenSecret("uuxIDE7jqSOfxpqJGy3HcxKjDxxcejqgtGUHWDgt00");
   
  twitter = new TwitterFactory(cb.build()).getInstance();
  
  try {
  twitter.updateStatus(new StatusUpdate("Haaai ik moet water"));
  } catch (Exception e) {
    println("sorry something went wrong " + e.toString());
  } 
}

void loop() {
  println("Hello");
  
}

