import 'dart:math';

import 'package:flutter/material.dart';

class WoodenAnswers extends StatefulWidget {
  double height;
  double width;
  int correctAnswer;
  int numberOfAnswers;
  Function(Color value) answerBoxCallback;

  WoodenAnswers({
    Key? key,
    required this.height,
    required this.width,
    required this.correctAnswer,
    required this.numberOfAnswers,
    required this.answerBoxCallback,
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
      int randomNumber = randomizer.nextInt(10) + 1;
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
    return SizedBox(
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
                      child: Text(answer.toString()),
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
