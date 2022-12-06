enum AppIcons {
  logo,
  playbutton,
  date,
  loud,
  nomessages,
}

extension AppIconsExtension on AppIcons {
  String get name {
    switch (this) {
      case AppIcons.logo:
        return 'assets/logo.svg';
      case AppIcons.playbutton:
        return 'assets/playbutton.svg';
      case AppIcons.date:
        return 'assets/icons/date.svg';
       case AppIcons.loud:
        return 'assets/icons/loud.svg';
      case AppIcons.nomessages:
        return 'assets/icons/nomessages.svg';
      default:
        return 'assets/logo.svg';
    }
  }
}