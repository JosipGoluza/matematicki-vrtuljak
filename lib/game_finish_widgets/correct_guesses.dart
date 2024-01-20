import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/util/language_constants.dart';

import '../constants/constants.dart';

Widget correctGuesses(
  String correctGuessText, BuildContext context,
) {
  return Row(
    children: [
      Expanded(
          child: Text(
        translation(context).numberOfHits,
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
