import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/models/start_different_sets_game_model.dart';
import 'package:matematicki_vrtuljak/util/getResultDifferentSets.dart';

class WoodenAnswersDifferentSets extends StatefulWidget {
  double height;
  double width;
  StartDifferentSetsGameModel startGameModel;
  Function(Color value) answerBoxCallback;

  WoodenAnswersDifferentSets({
    Key? key,
    required this.height,
    required this.width,
    required this.startGameModel,
    required this.answerBoxCallback,
  }) : super(key: key);

  @override
  State<WoodenAnswersDifferentSets> createState() =>
      _WoodenAnswersDifferentSetsState();
}

class _WoodenAnswersDifferentSetsState
    extends State<WoodenAnswersDifferentSets> {
  List<bool> guessedList = List.filled(2, false);

  Widget customWoodenAnswer(String path) {
    var index = path == "equal" ? 0 : 1;
    return Opacity(
      opacity: guessedList[index] ? 0.5 : 1,
      child: SizedBox(
        width: widget.width * 0.4,
        height: widget.height,
        child: InkWell(
          onTap: () async {
            getResultDifferentSets(
              path,
              widget.startGameModel.correctAnswer,
              widget.startGameModel.otherAnswer,
              widget.answerBoxCallback,
              guessedList,
            );
          },
          child: Stack(alignment: Alignment.center, children: [
            const Image(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/sign.png',
              ),
            ),
            Image(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/$path.png',
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        customWoodenAnswer("equal"),
        SizedBox(
          width: widget.width * 0.2,
        ),
        customWoodenAnswer("not_equal"),
      ],
    );
  }
}
