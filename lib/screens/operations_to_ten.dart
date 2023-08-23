import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/my_widgets/pause_button.dart';
import 'package:matematicki_vrtuljak/my_widgets/pause_button_scaled.dart';
import 'package:matematicki_vrtuljak/my_widgets/static_empty_container.dart';

import '../constants/constants.dart';
import '../my_widgets/dynamic_empty_container.dart';
import '../my_widgets/wooden_answers.dart';

class OperationsToTen extends StatefulWidget {
  const OperationsToTen({Key? key}) : super(key: key);

  @override
  State<OperationsToTen> createState() => _OperationsToTenState();
}

class _OperationsToTenState extends State<OperationsToTen> {
  answerBoxCallback(
    Color value,
  ) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= isDesktopWidth &&
              constraints.maxHeight >= isDesktopHeight;

          final minSize = min(constraints.maxWidth, constraints.maxHeight);

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
                  IgnorePointer(
                    // ignoring: answerBoxColor != Colors.transparent ? true : false,
                    ignoring: false,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: minSize * pauseButtonScale,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StaticEmptyContainer(
                                height: minSize * 0.45,
                                width: minSize * 0.45,
                              ),
                              Text(
                                " + ",
                                style: TextStyle(
                                  fontSize: minSize / operationsRatio,
                                ),
                              ),
                              StaticEmptyContainer(
                                height: minSize * 0.45,
                                width: minSize * 0.45,
                              ),
                              Text(
                                " = ",
                                style: TextStyle(
                                  fontSize: minSize / operationsRatio,
                                ),
                              ),
                              DynamicEmptyContainer(
                                height: minSize * 0.45,
                                width: minSize * 0.45,
                                boxColor: Colors.transparent,
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WoodenAnswers(
                                  height: constraints.maxHeight * 0.3,
                                  width: constraints.maxWidth * 0.9,
                                  correctAnswer: 3,
                                  numberOfAnswers: 4,
                                  answerBoxCallback: answerBoxCallback,
                                ),
                                // WoodenAnswers(
                                //   height: constraints.maxHeight * 0.3,
                                //   width: constraints.maxWidth * 0.9,
                                //   correctAnswer:
                                //   widget.startGameModel.correctAnswer,
                                //   numberOfAnswers:
                                //   widget.startGameModel.numberOfAnswers,
                                //   answerBoxCallback: answerBoxCallback,
                                // ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  PauseButtonScaled(
                    size: minSize * pauseButtonScale,
                  ),
                ],
              ));

          //
          // if (constraints.maxWidth >= isDesktopWidth || constraints.maxHeight >= isDesktopHeight) {
          //   return const OperationsToTenDesktop();
          // } else {
          //   return const OperationsToTenMobile();
          // }
        },
      ),
    );
  }
}

class OperationsToTenDesktop extends StatelessWidget {
  const OperationsToTenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/game_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const StaticEmptyContainer(
                            height: 210,
                            width: 210,
                          ),
                          const Text(" + ", style: TextStyle(fontSize: 30)),
                          const StaticEmptyContainer(
                            height: 210,
                            width: 210,
                          ),
                          const Text(" = ", style: TextStyle(fontSize: 30)),
                          DynamicEmptyContainer(
                            height: 210,
                            width: 210,
                            boxColor: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          WoodenAnswers(
                            height: 150,
                            width: 150,
                            correctAnswer: 1,
                            numberOfAnswers: 2,
                            answerBoxCallback: (Color value) {},
                          ),
                          const SizedBox(
                            width: 32.0,
                          ),
                          WoodenAnswers(
                            height: 150,
                            width: 150,
                            correctAnswer: 1,
                            numberOfAnswers: 2,
                            answerBoxCallback: (Color value) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(bigScreenPadding),
            child: PauseButton(),
          ),
        ],
      ),
    );
  }
}

class OperationsToTenMobile extends StatelessWidget {
  const OperationsToTenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(smallScreenPadding),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/game_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          StaticEmptyContainer(
                            height: currentWidth / widthRatio,
                            width: currentWidth / widthRatio,
                          ),
                          Text(" + ",
                              style: TextStyle(
                                  fontSize: currentWidth / operationsRatio)),
                          StaticEmptyContainer(
                            height: currentWidth / widthRatio,
                            width: currentWidth / widthRatio,
                          ),
                          Text(" = ",
                              style: TextStyle(
                                  fontSize: currentWidth / operationsRatio)),
                          DynamicEmptyContainer(
                            height: currentWidth / widthRatio,
                            width: currentWidth / widthRatio,
                            boxColor: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          WoodenAnswers(
                            height: currentWidth / widthRatio,
                            width: currentWidth / widthRatio,
                            correctAnswer: 1,
                            numberOfAnswers: 2,
                            answerBoxCallback: (Color value) {},
                          ),
                          const SizedBox(
                            width: 32.0,
                          ),
                          WoodenAnswers(
                            height: currentWidth / widthRatio,
                            width: currentWidth / widthRatio,
                            correctAnswer: 1,
                            numberOfAnswers: 2,
                            answerBoxCallback: (Color value) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
          const PauseButton(),
        ],
      ),
    );
  }
}
