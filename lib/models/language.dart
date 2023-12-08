import 'dart:ui';

enum LanguageOptions {
  english,
  croatian,
  spanish,
  french,
  portuguese,
  hungarian;
}

getLanguageOptionFromName(String name) {
  return LanguageOptions.values.firstWhere((element) => element.name == name);
}

getLanguageFromName(LanguageOptions language) {
  switch (language) {
    case LanguageOptions.english:
      return const Locale('en', "US");
    case LanguageOptions.croatian:
      return const Locale('hr', "HR");
    case LanguageOptions.spanish:
      return const Locale('es', "ES");
    case LanguageOptions.french:
      return const Locale('fr', "FR");
    case LanguageOptions.portuguese:
      return const Locale('pt', "PT");
    case LanguageOptions.hungarian:
      return const Locale('hu', "HU");
    default:
      return const Locale('en', "US");
  }
}
