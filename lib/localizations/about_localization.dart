import 'package:i18n_extension/i18n_extension.dart';

const appbarTitle = "appbarTitle";
const greetings = "greetings";
const increment = "increment";
const changeLanguage = "changeLanguage";
const youClickedThisNumberOfTimes = "youClickedThisNumberOfTimes";

extension AboutLocalization on String {
  static final _t = Translations.from("en_us", {
    appbarTitle: {
      "en_us": "i18n Demo",
      "hr_hr": "Demonstração i18n",
    },
    greetings: {
      "en_us": "This example demonstrates how to use identifiers as keys.\n\n"
          "For example, you can write:\n"
          "helloThere.i18n\n"
          "instead of\n"
          "\"Hello There\".i18n",
      "hr_hr": "Este exemplo demonstra como usar identificadores como chaves.\n\n"
          "Por exemplo, você pode escrever:\n"
          "saudacao.i18n\n"
          "em vez de\n"
          "\"Olá como vai\".i18n",
    },
    increment: {
      "en_us": "Increment",
      "hr_hr": "Incrementar",
    },
    changeLanguage: {
      "en_us": "Change Language",
      "hr_hr": "Mude Idioma",
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