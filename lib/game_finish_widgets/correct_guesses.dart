import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../localizations/game_finish_localization.dart';

Widget correctGuesses(
  String correctGuessText,
) {
  return Row(
    children: [
      Expanded(
          child: Text(
        numberOfHits.i18n,
        textAlign: TextAlign.end,
      )),
      const SizedBox(
        width: settingsRowMargin,
      ),
      Expanded(
        child: Text(
          correctGuessText,
          textAlign: TextAlign.start,
        ),
      ),
    ],
  );
}
