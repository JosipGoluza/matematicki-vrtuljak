import 'dart:ui';

import 'package:matematicki_vrtuljak/models/game_symbol.dart';
import 'package:matematicki_vrtuljak/models/settings_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/language.dart';
import '../models/operators.dart';

class UserPreferences {
  Future saveSettings(SettingsModel settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('numberOfRounds', settings.numberOfRounds);
    await prefs.setInt('numberOfAnswers', settings.numberOfAnswers);
    await prefs.setBool('musicEnabled', settings.musicEnabled);
    await prefs.setString('symbol', settings.currentSymbol.name);
    await prefs.setInt('maxOperationNumber', settings.maxOperationNumber);
    await prefs.setStringList('currentOperators',
        settings.currentOperators.map((e) => e.value).toList());
  }

  Future<SettingsModel> getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final numberOfRounds = prefs.getInt('numberOfRounds') ?? 5;
    final numberOfAnswers = prefs.getInt('numberOfAnswers') ?? 2;
    final musicEnabled = prefs.getBool('musicEnabled') ?? false;
    final symbolNamePrefs =
        prefs.getString('symbol') ?? GameSymbol.numbers.name;
    final symbolName = getSymbolFromName(symbolNamePrefs);
    final maxOperationNumber = prefs.getInt('maxOperationNumber') ?? 5;
    final currentOperatorsPrefs =
        prefs.getStringList('currentOperators') ?? ['+', '-'];
    final currentOperators = getOperatorFromValue(currentOperatorsPrefs);

    return SettingsModel(
      numberOfRounds: numberOfRounds,
      numberOfAnswers: numberOfAnswers,
      musicEnabled: musicEnabled,
      currentSymbol: symbolName,
      maxOperationNumber: maxOperationNumber,
      currentOperators: currentOperators,
    );
  }
}
