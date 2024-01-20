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

Locale getLanguageFromName(LanguageOptions language) {
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

Locale getEnumValueFromName(String? name){
  switch (name) {
    case 'en':
      return const Locale('en', "US");
    case 'hr':
      return const Locale('hr', "HR");
    case 'es':
      return const Locale('es', "ES");
    case 'fr':
      return const Locale('fr', "FR");
    case 'pt':
      return const Locale('pt', "PT");
    case 'hu':
      return const Locale('hu', "HU");
    default:
      return const Locale('en', "US");
  }
}
