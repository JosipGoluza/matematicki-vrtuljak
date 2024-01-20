import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/util/language_constants.dart';

import '../constants/constants.dart';

Widget timeTaken(
  String minutes,
  String seconds,
  BuildContext context,
) {
  return Row(
    children: [
      Expanded(
          child: Text(
        translation(context).totalTime,
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
