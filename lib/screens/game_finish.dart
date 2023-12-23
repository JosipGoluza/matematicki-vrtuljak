import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matematicki_vrtuljak/models/game_finish_model.dart';
import 'package:matematicki_vrtuljak/my_widgets/exit_button.dart';

import '../constants/constants.dart';
import '../localizations/game_finish_localization.dart';
import '../my_widgets/game_finish/restart_new_game.dart';

class GameFinish extends StatefulWidget {
  GameFinishModel gameFinishModel;

  GameFinish({
    Key? key,
    required this.gameFinishModel,
  }) : super(key: key);

  @override
  State<GameFinish> createState() => _GameFinishState();
}

class _GameFinishState extends State<GameFinish> {
  Widget correctGuesses() {
    return Row(
      children: [
        Expanded(
            child: Text(
          numberOfHits.i18n,
          textAlign: TextAlign.end,
        )),
        const SizedBox(
          width: settingsRowMargin,
        ),
        Expanded(
          child: Text(
            widget.gameFinishModel.correctGuesses.toString(),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget wrongGuesses() {
    return Row(
      children: [
        Expanded(
            child: Text(
          numberOfMisses.i18n,
          textAlign: TextAlign.end,
        )),
        const SizedBox(
          width: settingsRowMargin,
        ),
        Expanded(
          child: Text(
            widget.gameFinishModel.wrongGuesses.toString(),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget timeTaken() {
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
            '${widget.gameFinishModel.timeElapsed.inMinutes.toString()} min ${widget.gameFinishModel.timeElapsed.inSeconds.toString()} s',
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            backgroundColor: Colors.grey[350],
            // stack is used to set pause button on top right corner
            body: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        gameOver.i18n,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      correctGuesses(),
                      const SizedBox(height: 20),
                      wrongGuesses(),
                      const SizedBox(height: 20),
                      timeTaken(),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => {
                              context.go('/'),
                            },
                            child: Text(return_.i18n),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () => {
                              restartNewGame(
                                context,
                                widget.gameFinishModel.path,
                              ),
                            },
                            child: Text(playAgain.i18n),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(smallScreenPadding),
                  child:
                      ExitButton(constraints.maxWidth, constraints.maxHeight),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
