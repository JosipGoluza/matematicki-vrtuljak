import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../util/language_constants.dart';

Widget gameFinishBackButton(
  BuildContext context,
  double width,
  double height,
) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/pause_dialog/button_red.png'),
        fit: BoxFit.fill,
      ),
    ),
    width: width,
    height: height,
    child: TextButton(
      onPressed: () => {
        context.go('/'),
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: height * 0.1,
          ),
          child: AutoSizeText(
            translation(context).gameFinishReturn,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: width * 0.10,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ),
  );
}
