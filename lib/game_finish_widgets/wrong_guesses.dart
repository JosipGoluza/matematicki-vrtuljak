import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../localizations/game_finish_localization.dart';

Widget wrongGuesses(
  String wrongGuessText,
) {
  return Row(
    children: [
      Expanded(
          child: Text(
        numberOfMisses.i18n,
        textAlign: TextAlign.end,
      )),
      const SizedBox(
        width: settingsRowMargin,
      ),
      Expanded(
        child: Text(
          wrongGuessText,
          textAlign: TextAlign.start,
        ),
      ),
    ],
  );
}
