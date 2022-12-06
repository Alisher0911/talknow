enum Hobbies {
  beer,
  dog,
  burger,
  headphones,
  game,
}

extension HobbiesExtension on Hobbies {
  String get name {
    switch (this) {
      case Hobbies.beer:
        return 'assets/hobbies/beer.svg';
      case Hobbies.dog:
        return 'assets/hobbies/dog.svg';
      case Hobbies.burger:
        return 'assets/hobbies/burger.svg';
       case Hobbies.headphones:
        return 'assets/hobbies/headphones.svg';
      case Hobbies.game:
        return 'assets/hobbies/game.svg';
      default:
        return 'assets/hobbies/beer.svg';
    }
  }
}