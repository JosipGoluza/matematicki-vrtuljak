import 'package:i18n_extension/i18n_extension.dart';

const pause = "Pause";
const continue_ = "Continue";
const playAgain = "Play again";
const mainMenu = "Main menu";

extension PauseLocalization on String {
  static const _t = Translations.from("en_us", {
    pause : {
      "en_us": "PAUSE",
      "es_es": "PAUSA",
      "fr_fr": "PAUSE",
      "hr_hr": "PAUZA",
      "hu_hu": "SZÜNET",
      "pt_pt": "PAUSA",
    },
    continue_ : {
      "en_us": "CONTINUE",
      "es_es": "CONTINUAR",
      "fr_fr": "CONTINUER",
      "hr_hr": "NASTAVI",
      "hu_hu": "FOLYTATÁS",
      "pt_pt": "CONTINUAR",
    },
    playAgain : {
      "en_us": "PLAY AGAIN",
      "es_es": "JUGAR DE NUEVO",
      "fr_fr": "RECOMMENCER",
      "hr_hr": "IGRAJ PONOVO",
      "hu_hu": "ÚJRA",
      "pt_pt": "JOGAR NOVAMENTE",
    },
    mainMenu : {
      "en_us": "MAIN MENU",
      "es_es": "MENÚ PRINCIPAL",
      "fr_fr": "MENU PRINCIPAL",
      "hr_hr": "POČETNI IZBORNIK",
      "hu_hu": "FŐMENÜ",
      "pt_pt": "MENU PRINCIPAL",
    }
  });


  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(value) => localizePlural(value, this, _t);
}
