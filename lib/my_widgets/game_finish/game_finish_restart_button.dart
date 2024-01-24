import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/my_widgets/game_finish/restart_new_game.dart';

import '../../util/language_constants.dart';

Widget gameFinishRestartButton(
  BuildContext context,
  double width,
  double height,
  String path,
) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/pause_dialog/button_green.png'),
        fit: BoxFit.fill,
      ),
    ),
    width: width,
    height: height,
    child: TextButton(
      onPressed: () {
        restartNewGame(
          context,
          path,
        );
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: height * 0.1,
          ),
          child: AutoSizeText(
            translation(context).playAgain,
            maxLines: 1,
            style: TextStyle(
              color: Colors.black, // Text color
              fontWeight: FontWeight.bold,
              fontSize: width * 0.10,
            ),
          ),
        ),
      ),
    ),
  );
}
