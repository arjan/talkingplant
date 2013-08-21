import java.util.*;

static Map tweets = new HashMap<String, String[]>();

static {
  tweets.put("dry", new String[]{
    "Hey dude, give me some water!!", 
    "I feel like a desert inside...",
    "I am almost out of water. Pleeeaassse...."});
  tweets.put("medium", new String[]{
    "It would be nice if I would get some water soon.", 
    "Hmm, I'm starting to get thirsty.", 
    "Wow, I'd like some water soon."});
  tweets.put("moist", new String[]{
    "Ah, nice... I am feeling nice and moist.", 
    "My owner is a nice person. I have plenty of water!", 
    "It took a while but I'm good again! Plenty of water."});
  tweets.put("drowning", new String[]{
    "Ugh! My roots are wet! I'm drowning, help!", 
    "My owner overdid himself a little. I've got too much water..!", 
    "Hopefully I'll dry up a bit soon, otherwise my roots will start to rot..!"});
}

String getRandomTweet(String health) {
  String[] strings = (String[])tweets.get(health);
  int index = int(random(strings.length));
  return strings[index];
} 
