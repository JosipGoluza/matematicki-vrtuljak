import 'package:i18n_extension/i18n_extension.dart';

const numberOfHits = "Number of hits";
const numberOfMisses = "Number of misses";
const totalTime = "Total time";
const gameOver = "Game over";
const return_ = "Return";
const playAgain = "Play again";

extension GameFinishLocalization on String {
  static const _t = Translations.from("en_us", {
    numberOfHits: {
      "en_us": "NUMBER OF HITS:",
      "es_es": "NÚMERO DE INTENTOS:",
      "fr_fr": "LE NOMBRE D'OCCURRENCES:",
      "hr_hr": "BROJ POGODAKA:",
      "hu_hu": "TALÁLATOK SZÁMA:",
      "pt_br": "NÚMERO DE HITS:",
    },
    numberOfMisses: {
      "en_us": "NUMBER OF MISSES:",
      "es_es": "NÚMERO DE FALLOS:",
      "fr_fr": "NOMBRE D'ÉCHECS:",
      "hr_hr": "BROJ PROMAŠAJA:",
      "hu_hu": "HIBÁK SZÁMA:",
      "pt_br": "NÚMERO DE FALHAS:",
    },
    totalTime: {
      "en_us": "TOTAL TIME:",
      "es_es": "TIEMPO TOTAL:",
      "fr_fr": "TEMPS TOTAL:",
      "hr_hr": "UKUPNO VRIJEME:",
      "hu_hu": "JÁTÉKIDŐ:",
      "pt_br": "TEMPO TOTAL:",
    },
    gameOver: {
      "en_us": "GAME OVER",
      "es_es": "JUEGO TERMINADO",
      "fr_fr": "LE JEU EST FINI",
      "hr_hr": "IGRA JE GOTOVA",
      "hu_hu": "JÁTÉK VÉGE",
      "pt_br": "FIM DO JOGO",
    },
    return_: {
      "en_us": "RETURN",
      "es_es": "REGRESAR",
      "fr_fr": "RETOUR",
      "hr_hr": "POVRATAK",
      "hu_hu": "VISSZA",
      "pt_br": "REGRESSAR",
    },
    playAgain: {
      "en_us": "PLAY AGAIN",
      "es_es": "JUGAR DE NUEVO",
      "fr_fr": "RECOMMENCER",
      "hr_hr": "IGRAJ PONOVO",
      "hu_hu": "ÚJRA",
      "pt_br": "JOGAR NOVAMENTE",
    },
  });



  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(value) => localizePlural(value, this, _t);
}
