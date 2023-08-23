import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:matematicki_vrtuljak/before_game/generate_before_start.dart';

import '../before_game/generate_before_start_operations.dart';

void startTimer(BuildContext context, String path, int numberOfRounds,
    [int numberOfAnswers = 2]) {
  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();

  int currentRound = 0;
  int correctGuesses = 0;
  int wrongGuesses = 0;

  if (path == '/numbers' || path == '/different_sets') {
    generateBeforeStart(
      context,
      path,
      numberOfRounds,
      currentRound,
      stopwatch,
      correctGuesses,
      wrongGuesses,
      numberOfAnswers,
    );
  } else {
    generateBeforeStartOperations(
      context,
      path,
      numberOfRounds,
      currentRound,
      stopwatch,
      correctGuesses,
      wrongGuesses,
    );
  }
}
