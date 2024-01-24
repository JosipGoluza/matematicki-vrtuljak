import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/util/language_constants.dart';

import '../constants/constants.dart';

Widget wrongGuesses(
  String wrongGuessText,
  BuildContext context,
  double maxWidth,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AutoSizeText(
        translation(context).numberOfMisses,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: maxWidth * gameFinishTextRowFontScale,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
      ),
      const SizedBox(
        width: settingsRowMargin,
      ),
      AutoSizeText(
        wrongGuessText,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: maxWidth * gameFinishTextRowFontScale,
        ),
        maxLines: 1,
      ),
    ],
  );
}
