import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/models/game_symbol.dart';

class WoodenAnswers extends StatefulWidget {
  double height;
  double width;
  int correctAnswer;
  int numberOfAnswers;
  GameSymbol gameSymbol;
  Function(Color value) answerBoxCallback;

  WoodenAnswers({
    Key? key,
    required this.height,
    required this.width,
    required this.correctAnswer,
    required this.numberOfAnswers,
    required this.answerBoxCallback,
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
      int randomNumber = randomizer.nextInt(widget.gameSymbol.max) + 1;
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
              width: widget.width * 0.15,
              height: widget.height,
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () async {
                          if (answer == widget.correctAnswer) {
                            await widget.answerBoxCallback(Colors.green);
                          } else {
                            await widget.answerBoxCallback(Colors.red);
                          }
                        },
                        child: const Image(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/images/sign.png',
                          ),
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
                            fontSize: widget.width * 0.05,
                          ),
                        ),
                        GameSymbol.images: Image.asset(
                          'assets/images/apples/apple$answer.png',
                          fit: BoxFit.fill,
                        ),
                        GameSymbol.blocks: Image.asset(
                          'assets/images/tree/tree$answer.png',
                          fit: BoxFit.fill,
                        ),
                      }[widget.gameSymbol],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
