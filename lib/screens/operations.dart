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
                                StaticEmptyContainer(
                                  height: 210,
                                  width: 210,
                                  gameSymbol: widget.startGameModel.gameSymbol,
                                  containerNumber: widget.startGameModel.operationValues.firstNumber,
                                ),
                                const Text(" + ",
                                    style: TextStyle(fontSize: 30)),
                                StaticEmptyContainer(
                                  height: 210,
                                  width: 210,
                                  gameSymbol: widget.startGameModel.gameSymbol,
                                  containerNumber: widget.startGameModel.operationValues.secondNumber,
                                ),
                                const Text(" = ",
                                    style: TextStyle(fontSize: 30)),
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
        },
      ),
    );
  }
}
//
// class OperationsDesktop extends StatelessWidget {
//   const OperationsDesktop({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Stack(
//         children: [
//           Column(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Expanded(
//                       flex: 2,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           const StaticEmptyContainer(
//                             height: 210,
//                             width: 210,
//                           ),
//                           const Text(" + ", style: TextStyle(fontSize: 30)),
//                           const StaticEmptyContainer(
//                             height: 210,
//                             width: 210,
//                           ),
//                           const Text(" = ", style: TextStyle(fontSize: 30)),
//                           DynamicEmptyContainer(
//                             height: 210,
//                             width: 210,
//                             boxColor: Colors.transparent,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           WoodenAnswers(
//                             height: 150,
//                             width: 150,
//                             correctAnswer: 1,
//                             numberOfAnswers: 2,
//                             answerBoxCallback: (Color value) {},
//                           ),
//                           const SizedBox(
//                             width: 32.0,
//                           ),
//                           WoodenAnswers(
//                             height: 150,
//                             width: 150,
//                             correctAnswer: 1,
//                             numberOfAnswers: 2,
//                             answerBoxCallback: (Color value) {},
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           const Padding(
//             padding: EdgeInsets.all(bigScreenPadding),
//             child: PauseButton(),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class OperationsMobile extends StatelessWidget {
//   const OperationsMobile({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final currentWidth = MediaQuery.of(context).size.width;
//
//     return Container(
//       padding: const EdgeInsets.all(smallScreenPadding),
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/game_bg.png'),
//           fit: BoxFit.fill,
//         ),
//       ),
//       child: Stack(
//         children: [
//           Column(
//             children: [
//               const SizedBox(
//                 height: 20.0,
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Expanded(
//                       flex: 2,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           StaticEmptyContainer(
//                             height: currentWidth / widthRatio,
//                             width: currentWidth / widthRatio,
//                           ),
//                           Text(" + ",
//                               style: TextStyle(
//                                   fontSize: currentWidth / operationsRatio)),
//                           StaticEmptyContainer(
//                             height: currentWidth / widthRatio,
//                             width: currentWidth / widthRatio,
//                           ),
//                           Text(" = ",
//                               style: TextStyle(
//                                   fontSize: currentWidth / operationsRatio)),
//                           DynamicEmptyContainer(
//                             height: currentWidth / widthRatio,
//                             width: currentWidth / widthRatio,
//                             boxColor: Colors.transparent,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           WoodenAnswers(
//                             height: currentWidth / widthRatio,
//                             width: currentWidth / widthRatio,
//                             correctAnswer: 1,
//                             numberOfAnswers: 2,
//                             answerBoxCallback: (Color value) {},
//                           ),
//                           const SizedBox(
//                             width: 32.0,
//                           ),
//                           WoodenAnswers(
//                             height: currentWidth / widthRatio,
//                             width: currentWidth / widthRatio,
//                             correctAnswer: 1,
//                             numberOfAnswers: 2,
//                             answerBoxCallback: (Color value) {},
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//             ],
//           ),
//           const PauseButton(),
//         ],
//       ),
//     );
//   }
// }
