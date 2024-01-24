import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/util/getResultDifferentSets.dart';

class WoodenAnswersDifferentSets extends StatefulWidget {
  double height;
  double width;
  int correctAnswer;
  int otherAnswer;
  Function(Color value) answerBoxCallback;

  WoodenAnswersDifferentSets({
    Key? key,
    required this.height,
    required this.width,
    required this.correctAnswer,
    required this.otherAnswer,
    required this.answerBoxCallback,
  }) : super(key: key);

  @override
  State<WoodenAnswersDifferentSets> createState() =>
      _WoodenAnswersDifferentSetsState();
}

class _WoodenAnswersDifferentSetsState
    extends State<WoodenAnswersDifferentSets> {
  List<bool> guessedList = List.filled(2, false);

  Widget customWoodenAnswer(String path, BuildContext appContext) {
    var index = path == "equal" ? 0 : 1;
    var boxSize = min(widget.width * 0.4, widget.height);
    return Opacity(
      opacity: guessedList[index] ? 0.5 : 1,
      child: SizedBox(
        width: boxSize,
        height: boxSize,
        child: InkWell(
          onTap: () async {
            getResultDifferentSets(
              path,
              widget.correctAnswer,
              widget.otherAnswer,
              widget.answerBoxCallback,
              guessedList,
              appContext,
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Image(
                alignment: Alignment.center,
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/sign.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: boxSize * 0.05,
                  bottom: boxSize * 0.1,
                ),
                child: Image(
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/$path.png',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        customWoodenAnswer("equal", context),
        SizedBox(
          width: widget.width * 0.2,
        ),
        customWoodenAnswer("not_equal", context),
      ],
    );
  }
}
