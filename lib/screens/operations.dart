import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/models/start_operations_game_model.dart';

import '../constants/constants.dart';
import '../my_widgets/dynamic_empty_container.dart';
import '../my_widgets/pause_button.dart';
import '../my_widgets/static_empty_container.dart';
import '../my_widgets/wooden_answers.dart';

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
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const PauseButton(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        StaticEmptyContainer(
                          height: constraints.maxHeight * 0.35,
                          width: constraints.maxHeight * 0.35,
                          gameSymbol:
                              widget.startGameModel.gameSymbol,
                          containerNumber: widget.startGameModel
                              .operationValues.firstNumber,
                        ),
                        Text(
                          widget.startGameModel.operationValues
                              .operator.value,
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.10,
                          ),
                        ),
                        StaticEmptyContainer(
                          height: constraints.maxHeight * 0.35,
                          width: constraints.maxHeight * 0.35,
                          gameSymbol:
                              widget.startGameModel.gameSymbol,
                          containerNumber: widget.startGameModel
                              .operationValues.secondNumber,
                        ),
                        Text(
                          " = ",
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.10,
                          ),
                        ),
                        DynamicEmptyContainer(
                          height: constraints.maxHeight * 0.35,
                          width: constraints.maxHeight * 0.35,
                          boxColor: Colors.transparent,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        WoodenAnswers(
                          height: constraints.maxWidth * 0.2,
                          width: constraints.maxWidth * 0.97,
                          correctAnswer: widget.startGameModel
                              .operationValues.operationResult,
                          numberOfAnswers:
                              widget.startGameModel.numberOfAnswers,
                          maxAnswerNumber:
                              widget.startGameModel.gameSymbol.max,
                          gameSymbol:
                              widget.startGameModel.gameSymbol,
                          answerBoxCallback: (Color value) {},
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
