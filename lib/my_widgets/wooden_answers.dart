import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/models/game_symbol.dart';

class WoodenAnswers extends StatefulWidget {
  double height;
  double width;
  int correctAnswer;
  int numberOfAnswers;
  GameSymbol gameSymbol;
  int maxAnswerNumber;
  Function(Color value) answerBoxCallback;

  WoodenAnswers({
    Key? key,
    required this.height,
    required this.width,
    required this.correctAnswer,
    required this.numberOfAnswers,
    required this.answerBoxCallback,
    required this.maxAnswerNumber,
    this.gameSymbol = GameSymbol.numbers,
  }) : super(key: key);

  @override
  State<WoodenAnswers> createState() => _WoodenAnswersState();
}

class _WoodenAnswersState extends State<WoodenAnswers> {
  List<int> numberList = [];

  void initializeList() {
    Random randomizer = Random();
    numberList.add(widget.correctAnswer);
    while (numberList.length < widget.numberOfAnswers) {
      int randomNumber = randomizer.nextInt(widget.maxAnswerNumber) + 1;
      if (!numberList.contains(randomNumber)) {
        numberList.add(randomNumber);
      }
    }
    numberList.shuffle();
  }

  @override
  void initState() {
    super.initState();
    initializeList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var answer in numberList)
            SizedBox(
              width: min(widget.width * 0.165, widget.height),
              height: min(widget.width * 0.165, widget.height),
              child: Center(
                child: InkWell(
                  onTap: () async {
                    if (answer == widget.correctAnswer) {
                      await widget.answerBoxCallback(Colors.green);
                    } else {
                      await widget.answerBoxCallback(Colors.red);
                    }
                  },
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const Image(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/images/sign.png',
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: {
                          GameSymbol.numbers: Text(
                            answer.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize:
                                  min(widget.width * 0.165, widget.height) *
                                      0.5,
                            ),
                          ),
                          GameSymbol.images: Padding(
                            padding: EdgeInsets.only(
                              bottom: widget.height * 0.25,
                              top: widget.height * 0.16,
                            ),
                            child: Image.asset(
                              'assets/images/apples/apple$answer.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          GameSymbol.blocks: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: widget.height * 0.13,
                            ),
                            child: Image.asset(
                              'assets/images/tree/tree$answer.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        }[widget.gameSymbol],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
