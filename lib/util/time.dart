import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/before_game/generate_before_start.dart';
import 'package:matematicki_vrtuljak/models/game_symbol.dart';
import 'package:matematicki_vrtuljak/models/operators.dart';

import '../before_game/generate_before_start_operations.dart';

void startTimer(BuildContext context, String path, int numberOfRounds,
    [int numberOfAnswers = 2]) {
  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();

  int currentRound = 0;
  int correctGuesses = 0;
  int wrongGuesses = 0;
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
}

void startTimerOperators(BuildContext context, String path, int numberOfRounds,
    int numberOfAnswers, List<Operators> operators, GameSymbol gameSymbol,
    [int maxOperationNumber = 10]) {
  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();

  int currentRound = 0;
  int correctGuesses = 0;
  int wrongGuesses = 0;

  generateBeforeStartOperations(
    context,
    path,
    numberOfRounds,
    currentRound,
    stopwatch,
    correctGuesses,
    wrongGuesses,
    numberOfAnswers,
    maxOperationNumber,
    gameSymbol,
    operators,
  );
}
