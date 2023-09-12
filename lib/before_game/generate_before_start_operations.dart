import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/game_finish_model.dart';
import '../models/operators.dart';
import 'generate_operations_values.dart';
import 'dart:developer' as developer;

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
      ),
    );
  } else {
    currentRound++;
    final operationValue = generateOperationsValues(
      maxOperationNumber,
      operators,
    );
    developer.log(maxOperationNumber.toString(), name: 'josip logger');
    developer.log(operationValue.operator.toString(), name: 'josip logger');
    developer.log(operationValue.firstNumber.toString(), name: 'josip logger');
    developer.log(operationValue.secondNumber.toString(), name: 'josip logger');
    developer.log(operationValue.operationResult.toString(), name: 'josip logger');

  }
}
