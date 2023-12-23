import 'package:i18n_extension/i18n_extension.dart';

const about = "About";
const aboutProject = "aboutProject";
const elementsUsedFrom = "elementsUsedFrom";

extension AboutLocalization on String {
  static const _t = Translations.from("en_us", {
    about: {
      "en_us": "ABOUT",
      "es_es": "ACERCA DE",
      "fr_fr": "AU SUJET",
      "hr_hr": "O NAMA",
      "hu_hu": "RÓLUNK",
      "pt_pt": "SOBRE",
    },
    aboutProject : {
      "en_us": "The Mathematical Carousel application was created by Josip Goluža, a student at the Faculty of Electrical Engineering and Computing in Zagreb. The application was created for the purpose of the final thesis at the undergraduate studies as a refinement of the existing Mathematical Carousel application.",
      "es_es": "La aplicación Mathematical Carousel fue creada por Josip Goluža, estudiante de la Facultad de Ingeniería Eléctrica e Informática de Zagreb. La aplicación se creó con el fin de realizar la tesis final de los estudios de pregrado como un refinamiento de la aplicación Mathematical Carousel existente.",
      "fr_fr": "L'application Mathematical Carousel a été créée par Josip Goluža, étudiant à la Faculté de génie électrique et d'informatique de Zagreb. L'application a été créée dans le but de la thèse de fin d'études de premier cycle en tant que perfectionnement de l'application Mathematical Carousel existante.",
      "hr_hr": "Aplikaciju Matematički vrtuljak izradio je Josip Goluža, student Fakulteta elektrotehnike i računarstva u Zagrebu. Aplikacija je izrađena u svrhu završnog rada na preddiplomskom studiju kao dorada postojećoj aplikaciji Matematički vrtuljak.",
      "hu_hu": "A Mathematical Carousel alkalmazást Josip Goluža, a zágrábi Villamosmérnöki és Számítástechnikai Kar hallgatója készítette. Az alkalmazás az alapképzési szakdolgozat elkészítésére készült, a meglévő Matematikai körhinta alkalmazás továbbfejlesztéseként.",
      "pt_pt": "A aplicação Carrossel Matemático foi criada por Josip Goluža, aluno da Faculdade de Engenharia Elétrica e Computação de Zagreb. O aplicativo foi criado para efeito de tese final de graduação como um refinamento do aplicativo Carrossel Matemático existente.",
    },
    elementsUsedFrom : {
      "en_us": "Sound and graphic elements were downloaded from:",
      "es_es": "Los elementos de sonido y gráficos se descargaron de:",
      "fr_fr": "Des éléments sonores et graphiques ont été téléchargés de:",
      "hr_hr": "Korišteni elementi zvuka i grafike preuzeti su sa stranica:",
      "hu_hu": "A hanganyag és a grafikus elemek letöltési helye:",
      "pt_pt": "Som e elementos gráficos foram descarregados a partir de:",
    },
  });

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(value) => localizePlural(value, this, _t);
}
