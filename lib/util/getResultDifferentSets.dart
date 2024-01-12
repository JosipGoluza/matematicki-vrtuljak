import 'package:flutter/material.dart';

getResultDifferentSets(
  String path,
  int correctAnswer,
  int otherAnswer,
  Function(Color value) answerBoxCallback, List<bool> guessedList,
) async {
  if (path == "equal") {
    if (guessedList[0] == true) return;
    if (correctAnswer == otherAnswer) {
      await answerBoxCallback(Colors.green);
    } else {
      guessedList[0] = true;
      answerBoxCallback(Colors.red);
    }
  } else {
    if (guessedList[1] == true) return;
    if (correctAnswer != otherAnswer) {
      await answerBoxCallback(Colors.green);
    } else {
      guessedList[1] = true;
      answerBoxCallback(Colors.red);
    }
  }
}
