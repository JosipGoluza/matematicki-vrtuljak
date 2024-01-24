import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matematicki_vrtuljak/before_game/generate_before_start_operations.dart';
import 'package:matematicki_vrtuljak/models/start_operations_game_model.dart';

import '../constants/constants.dart';
import '../my_widgets/dynamic_empty_container.dart';
import '../my_widgets/pause/pause_button.dart';
import '../my_widgets/static_empty_container.dart';
import '../my_widgets/wooden_answers/wooden_answers.dart';
import '../util/time.dart';

class Operations extends StatefulWidget {
  StartOperationsGameModel startGameModel;

  Operations({
    super.key,
    required this.startGameModel,
  });

  @override
  State<Operations> createState() => _OperationsState();
}

class _OperationsState extends State<Operations> {
  Color answerBoxColor = Colors.transparent;

  exitButtonCallback() {
    context.go('/');
  }

  restartButtonCallback() {
    startTimerOperators(
      context,
      widget.startGameModel.path,
      widget.startGameModel.numberOfRounds,
      widget.startGameModel.numberOfAnswers,
      widget.startGameModel.operators,
      widget.startGameModel.gameSymbol,
      widget.startGameModel.maxOperationNumber,
    );
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
        generateBeforeStartOperations(
          context,
          widget.startGameModel.path,
          widget.startGameModel.numberOfRounds,
          widget.startGameModel.currentRound,
          widget.startGameModel.stopwatch,
          widget.startGameModel.correctGuesses,
          widget.startGameModel.wrongGuesses,
          widget.startGameModel.numberOfAnswers,
          widget.startGameModel.maxOperationNumber,
          widget.startGameModel.gameSymbol,
          widget.startGameModel.operators,
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
          var boxWidth = constraints.maxWidth * operationsContainerWidthScale;
          var boxHeight =
              constraints.maxHeight * operationsContainerHeightScale;
          return Container(
            padding: const EdgeInsets.all(
              smallScreenPadding,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/game_bg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                IgnorePointer(
                  ignoring: answerBoxColor != Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(smallScreenPadding),
                        child: PauseButton(
                          constraints.maxWidth,
                          constraints.maxHeight,
                          widget.startGameModel.path,
                          restartButtonCallback,
                          exitButtonCallback,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          StaticEmptyContainer(
                            height: boxHeight,
                            width: boxWidth,
                            gameSymbol: widget.startGameModel.gameSymbol,
                            containerNumber: widget
                                .startGameModel.operationValues.firstNumber,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: min(boxHeight, boxWidth) * 0.08,
                            ),
                            child: Text(
                              widget.startGameModel.operationValues.operator
                                  .value,
                              style: TextStyle(
                                fontSize: min(
                                    constraints.maxHeight * operatorHeightScale,
                                    constraints.maxWidth * operatorWidthScale),
                              ),
                            ),
                          ),
                          StaticEmptyContainer(
                            height: boxHeight,
                            width: boxWidth,
                            gameSymbol: widget.startGameModel.gameSymbol,
                            containerNumber: widget
                                .startGameModel.operationValues.secondNumber,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: min(boxHeight, boxWidth) * 0.08,
                            ),
                            child: Text(
                              "=",
                              style: TextStyle(
                                fontSize: min(
                                    constraints.maxHeight * operatorHeightScale,
                                    constraints.maxWidth * operatorWidthScale),
                              ),
                            ),
                          ),
                          DynamicEmptyContainer(
                            height: boxHeight,
                            width: boxWidth,
                            boxColor: answerBoxColor,
                          ),
                        ],
                      ),
                      WoodenAnswers(
                        height: constraints.maxHeight * 0.3,
                        width: constraints.maxWidth * 0.9,
                        correctAnswer: widget
                            .startGameModel.operationValues.operationResult,
                        numberOfAnswers: widget.startGameModel.numberOfAnswers,
                        maxAnswerNumber: widget.startGameModel.gameSymbol.max,
                        gameSymbol: widget.startGameModel.gameSymbol,
                        answerBoxCallback: answerBoxCallback,
                      ),
                    ],
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
