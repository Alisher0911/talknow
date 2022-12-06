enum EmojiPath {
  like,
  dislike,
  superlike,
  instantMatch,
  send,
  rewind
}

extension EmojiPathExtension on EmojiPath {
  String get name {
    switch (this) {
      case EmojiPath.like:
        return "assets/actions/like.svg";
      case EmojiPath.dislike:
        return "assets/actions/dislike.svg";
      case EmojiPath.superlike:
        return "assets/actions/superlike.svg";
      case EmojiPath.rewind:
        return "assets/actions/rewind.svg";
      case EmojiPath.instantMatch:
        return "assets/actions/instant_match.svg";
      case EmojiPath.send:
        return "assets/actions/send.svg";
      default:
        return "assets/actions/dislike.svg";
    }
  }
}

class Emoji {
  final double initialOpacity;
  final EmojiPath emojiName;

  Emoji({
    required this.initialOpacity, 
    required this.emojiName
  });
}