import 'package:i18n_extension/i18n_extension.dart';

const selectLanguage = "selectLanguage";
const numberOfRoundsLocalization = "numberOfRoundsLocalization";
const numberOfAnswersLocalization = "numberOfAnswersLocalization";
const yes = "yes";
const no = "no";
const music = "music";
const enableOperations = "enableOperations";
const numbers = "numbers";
const numbersOrSymbols = "nubersOrSymbols";
const tasksUpToNumber = "tasksUpToNumber";
const ok = "ok";
const addOperator = "addOperator";
const chooseAtLeastOneOperator = "chooseAtLeastOneOperator";
const operationGameSettings = "operationGameSettings";

extension SettingsLocalization on String {
  static const _t = Translations.from("en_us", {
    selectLanguage: {
      "en_us": "LANGUAGE:",
      "es_es": "IDIOMA:",
      "fr_fr": "LANGUE:",
      "hr_hr": "JEZIK:",
      "hu_hu": "NYELV:",
      "pt_pt": "IDIOMA:",
    },
    numberOfRoundsLocalization: {
      "en_us": "NUMBER OF ROUNDS:",
      "es_es": "NÚMERO DE RONDAS:",
      "fr_fr": "NOMBRE DE TOURS:",
      "hr_hr": "BROJ ZADATAKA:",
      "hu_hu": "MENETEK SZÁMA:",
      "pt_pt": "NÚMERO DE RONDAS:",
    },
    numberOfAnswersLocalization: {
      "en_us": "NUMBER OF ANSWERS:",
      "es_es": "NÚMERO DE RESPUESTAS:",
      "fr_fr": "NOMBRE DE RÉPONSES:",
      "hr_hr": "BROJ ODGOVORA:",
      "hu_hu": "VÁLASZOK SZÁMA:",
      "pt_pt": "NÚMERO DE RESPOSTAS:",
    },
    yes: {
      "en_us": "YES",
      "es_es": "SÍ",
      "fr_fr": "OUI",
      "hr_hr": "DA",
      "hu_hu": "IGEN",
      "pt_pt": "SIM",
    },
    no: {
      "en_us": "NO",
      "es_es": "NO",
      "fr_fr": "NON",
      "hr_hr": "NE",
      "hu_hu": "NEM",
      "pt_pt": "NÃO",
    },
    music: {
      "en_us": "MUSIC:",
      "es_es": "MÚSICA:",
      "fr_fr": "MUSIQUE:",
      "hr_hr": "GLAZBA:",
      "hu_hu": "ZENE:",
      "pt_pt": "MÚSICA:",
    },
    enableOperations: {
      "en_us": "ENABLE OPERATIONS:",
      "es_es": "ACTIVAR OPERACIONES:",
      "fr_fr": "PERMETTRE LES OPÉRATIONS:",
      "hr_hr": "OMOGUĆI OPERACIJE:",
      "hu_hu": "ELÉRHETŐ MŰVELETEK:",
      "pt_pt": "ATIVAR OPERAÇÕES:",
    },
    numbers: {
      "en_us": "Numbers",
      "es_es": "Números",
      "fr_fr": "Nombres",
      "hr_hr": "Brojevi",
      "hu_hu": "Számok",
      "pt_pt": "Números",
    },
    numbersOrSymbols: {
      "en_us": "NUMBERS OR SYMBOLS:",
      "es_es": "NÚMEROS O SÍMBOLOS:",
      "fr_fr": "NOMBRES OU SYMBOLES:",
      "hr_hr": "BROJEVI ILI SIMBOLI:",
      "hu_hu": "SZÁMOK VAGY SZIMBÓLUMOK:",
      "pt_pt": "NÚMERO DE SÍMBOLOS:",
    },
    tasksUpToNumber: {
      "en_us": "TASKS UP TO NUMBER:",
      "es_es": "TAREAS HASTA EL NÚMERO:",
      "fr_fr": "DES TÂCHES JUSQU'AU NOMBRE:",
      "hr_hr": "ZADACI DO BROJA:",
      "hu_hu": "FELADATOK AZ ADOTT SZÁMIG:",
      "pt_pt": "TAREFAS ATÉ AO NÚMERO:",
    },
    ok: {
      "en_us": "OK",
      "es_es": "OK",
      "fr_fr": "OK",
      "hr_hr": "OK",
      "hu_hu": "OK",
      "pt_pt": "OK",
    },
    addOperator: {
      "en_us": "ADD OPERATOR",
      "es_es": "AÑADIR OPERADOR",
      "fr_fr": "AJOUTER UN OPÉRATEUR",
      "hr_hr": "DODAJ OPERATOR",
      "hu_hu": "MŰVELET HOZZÁADÁSA",
      "pt_pt": "ADICIONAR OPERADOR",
    },
    chooseAtLeastOneOperator: {
      "en_us": "Choose at least one operator.",
      "es_es": "Elija al menos un operador.",
      "fr_fr": "Choisissez au moins un opérateur.",
      "hr_hr": "Odaberite barem jedan operator.",
      "hu_hu": "Válasszon legalább egy műveletet.",
      "pt_pt": "Escolha pelo menos um operador.",
    },
    operationGameSettings: {
      "en_us": "\"OPERATIONS\" GAME SETTINGS",
      "es_es": "AJUSTES DE JUEGO \"OPERACIONES\"",
      "fr_fr": "\"OPÉRATIONS\" PARAMÉTRAGES DU JEU",
      "hr_hr": "POSTAVKE ZA IGRU \"OPERACIJE\"",
      "hu_hu": "A \"MŰVELETEK\" JÁTÉK BEÁLLÍTÁSAI",
      "pt_pt": "CONFIGURAÇÕES DO JOGO \"OPERAÇÕES\"",
    },
  });

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(value) => localizePlural(value, this, _t);
}
