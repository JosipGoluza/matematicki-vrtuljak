import 'package:matematicki_vrtuljak/models/game_symbol.dart';
import 'package:matematicki_vrtuljak/models/operators.dart';

import 'language.dart';

class SettingsModel {
  int numberOfRounds;
  int numberOfAnswers;
  bool musicEnabled;
  GameSymbol currentSymbol;
  int maxOperationNumber;
  List<Operators> currentOperators;
  LanguageOptions languageOptions;

  SettingsModel({
    required this.numberOfRounds,
    required this.numberOfAnswers,
    required this.musicEnabled,
    required this.currentSymbol,
    required this.maxOperationNumber,
    required this.currentOperators,
    required this.languageOptions,
  });
}