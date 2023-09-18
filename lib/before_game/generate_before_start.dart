import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

import '../models/game_finish_model.dart';
import '../models/start_different_sets_game_model.dart';
import '../models/start_numbers_game_model.dart';

void generateBeforeStart(BuildContext context, String path, int numberOfRounds,
    int currentRound, Stopwatch stopwatch, int correctGuesses, int wrongGuesses,
    int numberOfAnswers,) {
  Random random = Random();

  if (currentRound >= numberOfRounds) {
    stopwatch.stop();
    context.go(
      '/end_game',
      extra: GameFinishModel(
        correctGuesses: correctGuesses,
        wrongGuesses: wrongGuesses,
        timeElapsed: stopwatch.elapsed,
      ),
    );
  } else {
    currentRound++;
    if (path == '/numbers' || path == '/different_sets') {
      // choosing which symbol to show
      String imageName = "symbol_${random.nextInt(21) + 1}.png";

      // random number between 1 and 10
      int correctAnswer = random.nextInt(10) + 1;

      if (path == '/numbers') {
        StartNumbersGameModel startGameModel = StartNumbersGameModel(
          numberOfRounds: numberOfRounds,
          numberOfAnswers: numberOfAnswers,
          correctAnswer: correctAnswer,
          imageName: imageName,
          currentRound: currentRound,
          stopwatch: stopwatch,
          correctGuesses: correctGuesses,
          wrongGuesses: wrongGuesses,
        );
        context.go(path, extra: startGameModel);
      } else {
        var otherAnswer = getOtherValue(random, correctAnswer);
        bool isSame = otherAnswer == correctAnswer;

        StartDifferentSetsGameModel startGameModel =
            StartDifferentSetsGameModel(
          numberOfRounds: numberOfRounds,
          correctAnswer: correctAnswer,
          imageName: imageName,
          otherAnswer: otherAnswer,
          isSame: isSame,
          currentRound: currentRound,
          stopwatch: stopwatch,
          correctGuesses: correctGuesses,
          wrongGuesses: wrongGuesses,
        );
        context.go(path, extra: startGameModel);
      }
    }
  }
}

int getOtherValue(Random random, int correctAnswer) {
  int otherAnswerFlag = random.nextInt(2);
  int otherAnswer;

  // if otherAnswerFlag is 0, then sets will be different
  if (otherAnswerFlag == 0) {
    int otherAnswerCount = random.nextInt(2);

    // take random number that is close to correctAnswer
    if (otherAnswerCount == 0) {
      if (correctAnswer == 1) {
        otherAnswer = correctAnswer + 1;
      } else {
        otherAnswer = correctAnswer - 1;
      }
    } else {
      if (correctAnswer == 10) {
        otherAnswer = correctAnswer - 1;
      } else {
        otherAnswer = correctAnswer + 1;
      }
    }
    // if otherAnswerFlag is 1, then sets will be the same
  } else {
    otherAnswer = correctAnswer;
  }
  return otherAnswer;
}
