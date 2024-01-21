import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/util/language_constants.dart';

import '../constants/constants.dart';

Widget correctGuesses(
  String correctGuessText,
  BuildContext context,
  double width,
) {
  return Row(
    children: [
      Expanded(
        child: AutoSizeText(
          translation(context).numberOfHits,
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: width * gameFinishTextFontScale,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
        ),
      ),
      const SizedBox(
        width: settingsRowMargin,
      ),
      Expanded(
        child: AutoSizeText(
          correctGuessText,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: width * gameFinishTextFontScale,
          ),
          maxLines: 1,
        ),
      ),
    ],
  );
}
