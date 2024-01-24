import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/models/game_finish_model.dart';
import 'package:matematicki_vrtuljak/my_widgets/exit_button.dart';
import 'package:matematicki_vrtuljak/my_widgets/game_finish/game_finish_back_button.dart';
import 'package:matematicki_vrtuljak/my_widgets/game_finish/game_finish_restart_button.dart';
import 'package:matematicki_vrtuljak/util/language_constants.dart';

import '../constants/constants.dart';
import '../game_finish_widgets/correct_guesses.dart';
import '../game_finish_widgets/time_taken.dart';
import '../game_finish_widgets/wrong_guesses.dart';
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
  Widget gameFinishMobile({
    required String correctGuessesText,
    required String wrongGuessesText,
    required String minutesText,
    required String secondsText,
    required String path,
  }) {
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
                      AutoSizeText(
                        translation(context).gameOver,
                        style: TextStyle(
                          fontSize:
                              constraints.maxWidth * gameFinishTitleFontScale,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4),
                      correctGuesses(
                        correctGuessesText,
                        context,
                        constraints.maxWidth,
                        constraints.maxHeight,
                      ),
                      const SizedBox(height: 2),
                      wrongGuesses(
                        wrongGuessesText,
                        context,
                        constraints.maxWidth,
                      ),
                      const SizedBox(height: 2),
                      timeTaken(
                        minutesText,
                        secondsText,
                        context,
                        constraints.maxWidth,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          gameFinishBackButton(
                            context,
                            constraints.maxWidth * gameFinishButtonWidthScale,
                            constraints.maxHeight * gameFinishButtonHeightScale,
                          ),
                          const SizedBox(width: 10),
                          gameFinishRestartButton(
                            context,
                            constraints.maxWidth * gameFinishButtonWidthScale,
                            constraints.maxHeight * gameFinishButtonHeightScale,
                            path,
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

  Widget gameFinishDesktop(
      {required String correctGuessesText,
      required String wrongGuessesText,
      required String minutesText,
      required String secondsText,
      required String path,
      required double width,
      required double height}) {
    double cardWidth = 700;
    double cardHeight = 450;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(smallScreenPadding),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/game_bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                width: cardWidth,
                height: cardHeight,
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    border: Border.all(color: Colors.grey[850]!),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      translation(context).gameOver,
                      style: TextStyle(
                        fontSize: cardWidth * gameFinishTitleFontScale,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    correctGuesses(
                      correctGuessesText,
                      context,
                      cardWidth,
                      cardHeight,
                    ),
                    const SizedBox(height: 20),
                    wrongGuesses(
                      wrongGuessesText,
                      context,
                      cardWidth,
                    ),
                    const SizedBox(height: 20),
                    timeTaken(
                      minutesText,
                      secondsText,
                      context,
                      cardWidth,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        gameFinishBackButton(
                          context,
                          cardWidth * gameFinishButtonWidthScale,
                          cardHeight * gameFinishButtonHeightScale,
                        ),
                        const SizedBox(width: 10),
                        gameFinishRestartButton(
                          context,
                          cardWidth * gameFinishButtonWidthScale,
                          cardHeight * gameFinishButtonHeightScale,
                          path,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(smallScreenPadding),
              child: ExitButton(width, height),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var correctGuessesText = widget.gameFinishModel.correctGuesses.toString();
    var wrongGuessesText = widget.gameFinishModel.wrongGuesses.toString();
    var minutesText = widget.gameFinishModel.timeElapsed.inMinutes.toString();
    var secondsText =
        (widget.gameFinishModel.timeElapsed.inSeconds % 60).toString();
    var path = widget.gameFinishModel.path;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var isMobile = width < 800 || height < 500;

    if (isMobile) {
      return gameFinishMobile(
        correctGuessesText: correctGuessesText,
        wrongGuessesText: wrongGuessesText,
        minutesText: minutesText,
        secondsText: secondsText,
        path: path,
      );
    } else {
      return gameFinishDesktop(
        correctGuessesText: correctGuessesText,
        wrongGuessesText: wrongGuessesText,
        minutesText: minutesText,
        secondsText: secondsText,
        path: path,
        width: width,
        height: height,
      );
    }
  }
}
