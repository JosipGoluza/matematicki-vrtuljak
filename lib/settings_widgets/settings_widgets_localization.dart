import 'package:i18n_extension/i18n_extension.dart';

const selectLanguage = "selectLanguage";
const numberOfRoundsLocalization = "numberOfRoundsLocalization";
const greetings = "greetings";
const increment = "increment";
const changeLanguage = "changeLanguage";
const youClickedThisNumberOfTimes = "youClickedThisNumberOfTimes";

extension SettingsLocalization on String {
  static final _t = Translations.from("en_us", {
    selectLanguage: {
      "en_us": "LANGUAGE:",
      "hr_hr": "JEZIK:",
      "es_es": "IDIOMA:",
      "fr_fr": "LANGUE:",
      "pt_pt": "IDIOMA:",
      "hu_hu": "NYELV:",
    },
    numberOfRoundsLocalization: {
      "en_us": "NUMBER OF ROUNDS:",
      "hr_hr": "BROJ ZADATAKA:",
      "es_es": "NÚMERO DE RONDAS:",
      "fr_fr": "NOMBRE DE TOURS:",
      "pt_pt": "NÚMERO DE RONDAS:",
      "hu_hu": "MENETEK SZÁMA:",
    },
    youClickedThisNumberOfTimes: {
      "en_us": "You clicked the button %d times:"
          .zero("You haven't clicked the button:")
          .one("You clicked it once:")
          .two("You clicked a couple times:")
          .many("You clicked %d times:")
          .times(12, "You clicked a dozen times:"),
      "hr_hr": "Você clicou o botão %d vezes:"
          .zero("Você não clicou no botão:")
          .one("Você clicou uma única vez:")
          .two("Você clicou um par de vezes:")
          .many("Você clicou %d vezes:")
          .times(12, "Você clicou uma dúzia de vezes:"),
    }
  });

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(value) => localizePlural(value, this, _t);
}