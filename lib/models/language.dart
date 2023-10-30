import 'dart:ui';

enum LanguageOptions {
  english,
  croatian;
  // images(name: 'Slike', min: 2, max: 9),
  // images(name: 'Slike', min: 2, max: 9),
  // images(name: 'Slike', min: 2, max: 9),
  // blocks(name: 'Kocke', min: 2, max: 30);
}
getLanguageOptionFromName(String name) {
  return LanguageOptions.values.firstWhere((element) => element.name == name);
}

getLanguageFromName(LanguageOptions language) {
  switch(language) {
    case LanguageOptions.english:
      return const Locale('en', "US");
    case LanguageOptions.croatian:
      return const Locale('hr', "HR");
    default:
      return const Locale('en', "US");
  }
}