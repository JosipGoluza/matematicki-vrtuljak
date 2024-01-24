import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/util/language_constants.dart';

import '../constants/constants.dart';

Widget timeTaken(
  String minutes,
  String seconds,
  BuildContext context,
  double width,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AutoSizeText(
        translation(context).totalTime,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: width * gameFinishTextRowFontScale,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
      ),
      const SizedBox(
        width: settingsRowMargin,
      ),
      AutoSizeText(
        '$minutes min $seconds s',
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: width * gameFinishTextRowFontScale,
        ),
        maxLines: 1,
      ),
    ],
  );
}
