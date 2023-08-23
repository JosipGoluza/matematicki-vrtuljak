import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/models/start_game_model.dart';
import 'package:matematicki_vrtuljak/my_widgets/wooden_answers.dart';

import '../before_game/generate_before_start.dart';
import '../constants/constants.dart';
import '../my_widgets/dynamic_empty_container.dart';
import '../my_widgets/item_pictures/numbers_item_pictures.dart';
import '../my_widgets/pause_button.dart';

class Numbers extends StatefulWidget {
  StartNumbersGameModel startGameModel;

  Numbers({
    super.key,
    required this.startGameModel,
  });

  @override
  State<Numbers> createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
  Color answerBoxColor = Colors.transparent;

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
          '/numbers',
          widget.startGameModel.numberOfRounds,
          widget.startGameModel.currentRound,
          widget.startGameModel.stopwatch,
          widget.startGameModel.correctGuesses,
          widget.startGameModel.wrongGuesses,
          widget.startGameModel.numberOfAnswers,
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
          final isDesktop = constraints.maxWidth >= isDesktopWidth &&
              constraints.maxHeight >= isDesktopHeight;

          return Container(
            padding: EdgeInsets.all(
              isDesktop ? bigScreenPadding : smallScreenPadding,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/game_bg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: <Widget>[
                IgnorePointer(
                  ignoring: answerBoxColor != Colors.transparent ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    // ovaj row je mozda nepotreban?
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NumbersItemPictures(
                              height: constraints.maxHeight * 0.2,
                              width: constraints.maxWidth * 0.85,
                              imageName: widget.startGameModel.imageName,
                              correctAnswer:
                                  widget.startGameModel.correctAnswer,
                              imageSize: constraints.maxWidth * 0.083,
                            ),
                            DynamicEmptyContainer(
                              height: constraints.maxHeight * 0.3,
                              width: constraints.maxHeight * 0.3,
                              boxColor: answerBoxColor,
                            ),
                            WoodenAnswers(
                              height: constraints.maxHeight * 0.3,
                              width: constraints.maxWidth * 0.9,
                              correctAnswer:
                                  widget.startGameModel.correctAnswer,
                              numberOfAnswers:
                                  widget.startGameModel.numberOfAnswers,
                              answerBoxCallback: answerBoxCallback,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const PauseButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
