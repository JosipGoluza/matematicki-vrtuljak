import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../localizations/game_finish_localization.dart';

Widget timeTaken(
  String minutes,
  String seconds,
) {
  return Row(
    children: [
      Expanded(
          child: Text(
        totalTime.i18n,
        textAlign: TextAlign.end,
      )),
      const SizedBox(
        width: settingsRowMargin,
      ),
      Expanded(
        child: Text(
          '$minutes min $seconds s',
          textAlign: TextAlign.start,
        ),
      ),
    ],
  );
}
