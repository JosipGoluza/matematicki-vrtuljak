import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/my_widgets/dynamic_empty_container.dart';

import '../before_game/generate_before_start.dart';
import '../constants/constants.dart';
import '../models/start_different_sets_game_model.dart';
import '../my_widgets/item_pictures/different_sets_item_pictures.dart';
import '../my_widgets/pause_button.dart';

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
                  ignoring: answerBoxColor != Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            DifferentSetsItemPictures(
                              height: constraints.maxHeight * 0.6,
                              width: constraints.maxWidth * 0.2,
                              imageName: widget.startGameModel.imageName,
                              answer: widget.startGameModel.correctAnswer,
                              imageSize: constraints.maxHeight * 0.1,
                            ),
                            DynamicEmptyContainer(
                              height: constraints.maxHeight * 0.3,
                              width: constraints.maxHeight * 0.3,
                              boxColor: answerBoxColor,
                            ),
                            DifferentSetsItemPictures(
                              height: constraints.maxHeight * 0.6,
                              width: constraints.maxWidth * 0.2,
                              imageName: widget.startGameModel.imageName,
                              answer: widget.startGameModel.otherAnswer,
                              imageSize: constraints.maxHeight * 0.1,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: constraints.maxWidth * 0.2,
                              height: constraints.maxHeight * 0.2,
                              child: InkWell(
                                onTap: () async {
                                  if (widget.startGameModel.correctAnswer ==
                                      widget.startGameModel.otherAnswer) {
                                    await answerBoxCallback(Colors.green);
                                  } else {
                                    answerBoxCallback(Colors.red);
                                  }
                                },
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: const [
                                      Image(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                          'assets/images/sign.png',
                                        ),
                                      ),
                                      Image(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                          'assets/images/equal.png',
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.1,
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.2,
                              height: constraints.maxHeight * 0.2,
                              child: InkWell(
                                onTap: () async {
                                  if (widget.startGameModel.correctAnswer !=
                                      widget.startGameModel.otherAnswer) {
                                    await answerBoxCallback(Colors.green);
                                  } else {
                                    answerBoxCallback(Colors.red);
                                  }
                                },
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: const [
                                      Image(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                          'assets/images/sign.png',
                                        ),
                                      ),
                                      Image(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                          'assets/images/not_equal.png',
                                        ),
                                      ),
                                    ]),
                              ),
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
