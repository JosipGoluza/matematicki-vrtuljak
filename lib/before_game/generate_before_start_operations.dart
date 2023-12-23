import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matematicki_vrtuljak/models/game_symbol.dart';
import 'package:matematicki_vrtuljak/models/start_operations_game_model.dart';

import '../models/game_finish_model.dart';
import '../models/operators.dart';
import 'generate_operations_values.dart';

void generateBeforeStartOperations(
  BuildContext context,
  String path,
  int numberOfRounds,
  int currentRound,
  Stopwatch stopwatch,
  int correctGuesses,
  int wrongGuesses,
  int numberOfAnswers,
  int maxOperationNumber,
  GameSymbol gameSymbol,
  List<Operators> operators,
) {
  if (currentRound >= numberOfRounds) {
    stopwatch.stop();
    context.go(
      '/end_game',
      extra: GameFinishModel(
        correctGuesses: correctGuesses,
        wrongGuesses: wrongGuesses,
        timeElapsed: stopwatch.elapsed,
        path: path,
      ),
    );
  } else {
    currentRound++;
    final operationValues = generateOperationsValues(
      maxOperationNumber,
      operators,
    );
    StartOperationsGameModel startGameModel = StartOperationsGameModel(
      numberOfRounds: numberOfRounds,
      numberOfAnswers: numberOfAnswers,
      currentRound: currentRound,
      stopwatch: stopwatch,
      correctGuesses: correctGuesses,
      wrongGuesses: wrongGuesses,
      operationValues: operationValues,
      gameSymbol: gameSymbol,
      path: path,
      maxOperationNumber: maxOperationNumber,
      operators: operators,
    );
    context.go(path, extra: startGameModel);
  }
}
