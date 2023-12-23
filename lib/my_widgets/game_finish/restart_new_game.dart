import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/util/time.dart';

import '../../util/user_preferences.dart';

Future<void> restartNewGame(BuildContext context, String path) async {
  final userPreferences = UserPreferences();

  var sharedPrefs = await userPreferences.getSettings();

  if (!context.mounted) return;
  switch (path) {
    case '/numbers':
      startTimer(
        context,
        path,
        sharedPrefs.numberOfRounds,
        sharedPrefs.numberOfAnswers,
      );
      break;
    case '/different_sets':
      startTimer(
        context,
        path,
        sharedPrefs.numberOfRounds,
      );
      break;
    case '/operations':
      startTimerOperators(
        context,
        path,
        sharedPrefs.numberOfRounds,
        sharedPrefs.numberOfAnswers,
        sharedPrefs.currentOperators,
        sharedPrefs.currentSymbol,
        sharedPrefs.maxOperationNumber,
      );
      break;
  }
}
