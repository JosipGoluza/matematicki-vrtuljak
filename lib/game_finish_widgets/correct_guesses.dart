import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/util/language_constants.dart';

import '../constants/constants.dart';

Widget correctGuesses(
  String correctGuessText,
  BuildContext context,
  double width,
  double height,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AutoSizeText(
        translation(context).numberOfHits,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: min(width * gameFinishTextRowFontScale,
              height * gameFinishTextHeightFontScale),
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
      ),
      const SizedBox(
        width: settingsRowMargin,
      ),
      AutoSizeText(
        correctGuessText,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: width * gameFinishTextRowFontScale,
        ),
        maxLines: 1,
      ),
    ],
  );
}
