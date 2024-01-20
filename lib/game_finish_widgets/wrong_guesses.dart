import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/util/language_constants.dart';

import '../constants/constants.dart';

Widget wrongGuesses(
  String wrongGuessText, BuildContext context,
) {
  return Row(
    children: [
      Expanded(
          child: Text(
        translation(context).numberOfMisses,
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
