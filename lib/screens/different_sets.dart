import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matematicki_vrtuljak/my_widgets/dynamic_empty_container.dart';
import 'package:matematicki_vrtuljak/my_widgets/wooden_answers/wooden_answers_different_sets.dart';

import '../before_game/generate_before_start.dart';
import '../constants/constants.dart';
import '../models/start_different_sets_game_model.dart';
import '../my_widgets/item_pictures/different_sets_item_pictures.dart';
import '../my_widgets/pause/pause_button.dart';
import '../util/time.dart';

class DifferentSets extends StatefulWidget {
  StartDifferentSetsGameModel startGameModel;

  DifferentSets({
    super.key,
    required this.startGameModel,
  });

  @override
  State<DifferentSets> createState() => _DifferentSetsState();
}

class _DifferentSetsState extends State<DifferentSets> {
  Color answerBoxColor = Colors.transparent;

  exitButtonCallback() {
    context.go('/');
  }

  restartButtonCallback() {
    startTimer(
      context,
      '/different_sets',
      widget.startGameModel.numberOfRounds,
    ); // Restart the game
  }

  answerBoxCallback(Color value) {
    setState(() {
      answerBoxColor = value;
      if (value == Colors.green) {
        widget.startGameModel.correctGuesses++;
      } else if (value == Colors.red) {
        widget.startGameModel.wrongGuesses++;
      }
    });
    if (value == Colors.green) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        generateBeforeStart(
          context,
          '/different_sets',
          widget.startGameModel.numberOfRounds,
          widget.startGameModel.currentRound,
          widget.startGameModel.stopwatch,
          widget.startGameModel.correctGuesses,
          widget.startGameModel.wrongGuesses,
          2,
        );
      });
    } else if (value == Colors.red) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        setState(() {
          answerBoxColor = Colors.transparent;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/game_bg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: <Widget>[
                IgnorePointer(
                  ignoring: answerBoxColor != Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            DifferentSetsItemPictures(
                              height: constraints.maxHeight *
                                  differentSetsItemPicturesHeightScale,
                              width: constraints.maxWidth *
                                  differentSetsItemPicturesWidthScale,
                              imageName: widget.startGameModel.imageName,
                              answer: widget.startGameModel.correctAnswer,
                              iconPositions:
                                  widget.startGameModel.correctIconPositions,
                            ),
                            DynamicEmptyContainer(
                              height: constraints.maxHeight * 0.3,
                              width: constraints.maxWidth * 0.3,
                              boxColor: answerBoxColor,
                            ),
                            DifferentSetsItemPictures(
                              height: constraints.maxHeight *
                                  differentSetsItemPicturesHeightScale,
                              width: constraints.maxWidth *
                                  differentSetsItemPicturesWidthScale,
                              imageName: widget.startGameModel.imageName,
                              answer: widget.startGameModel.otherAnswer,
                              iconPositions:
                                  widget.startGameModel.otherIconsPositions,
                            ),
                          ],
                        ),
                        WoodenAnswersDifferentSets(
                          height: constraints.maxHeight * 0.2,
                          width: constraints.maxWidth * 0.5,
                          correctAnswer: widget.startGameModel.correctAnswer,
                          otherAnswer: widget.startGameModel.otherAnswer,
                          // correctAnswer: widget.startGameModel.correctAnswer,
                          answerBoxCallback: answerBoxCallback,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(smallScreenPadding),
                  child: PauseButton(
                    constraints.maxWidth,
                    constraints.maxHeight,
                    '/different_sets',
                    restartButtonCallback,
                    exitButtonCallback,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
