import 'package:animated_emoji/animated_emoji.dart';

final Map<String, AnimatedEmojiData> moodData = {
  "Happy": AnimatedEmojis.smileWithBigEyes,
  "Excited": AnimatedEmojis.partyingFace,
  "Grateful": AnimatedEmojis.halo,
  "Sad": AnimatedEmojis.cry,
  "Tired": AnimatedEmojis.sleepy,
  "Angry": AnimatedEmojis.angry,
  "Cool": AnimatedEmojis.cool,
  "Guilty": AnimatedEmojis.woozy,
  "Expressionless": AnimatedEmojis.expressionless,
  "InLove": AnimatedEmojis.heartFace,
};

final List moods = [
  "Happy",
  "Excited",
  "Grateful",
  "Sad",
  "Tired",
  "Angry",
  "Cool",
  "Guilty",
  "Expressionless",
  "InLove",
];

AnimatedEmojiData animatedMood(String mood) {
  return moodData[mood]!;
}
