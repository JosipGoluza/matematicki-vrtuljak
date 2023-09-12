import 'dart:math';

import '../models/operators.dart';
import 'generate_operations_values.dart';

generateMultiplicationDivisionValues(
  int maxOperationNumber,
  Operators chosenOperator,
) {
  final random = Random();
  const minimalResultNumber = 2;
  // this number can be fine tuned to get better results
  const numberOfTries = 10;

  while (true) {
    if (minimalResultNumber == maxOperationNumber) {
      if (chosenOperator == Operators.multiply) {
        return OperationValues(
          firstNumber: 2,
          secondNumber: 1,
          operationResult: 2,
          operator: chosenOperator,
        );
      } else {
        return OperationValues(
          firstNumber: 1,
          secondNumber: 2,
          operationResult: 2,
          operator: chosenOperator,
        );
      }
    }
    // in multiplication it is a result, but in division it is a first number
    var biggestNumber = minimalResultNumber +
        random.nextInt(maxOperationNumber - minimalResultNumber);

    // if no matching pair is found in n tries, generate new biggest number
    for (var i = 1; i <= numberOfTries; i++) {
      var firstOtherNumber = random.nextInt(biggestNumber - 1) + 1;
      if (biggestNumber % firstOtherNumber == 0 && firstOtherNumber != 1) {
        var secondOtherNumber = Operators.doReverseOperation(
            chosenOperator, biggestNumber, firstOtherNumber);
        if (chosenOperator == Operators.multiply) {
          return OperationValues(
            firstNumber: firstOtherNumber,
            secondNumber: secondOtherNumber,
            operationResult: biggestNumber,
            operator: chosenOperator,
          );
        } else {
          return OperationValues(
            firstNumber: biggestNumber,
            secondNumber: firstOtherNumber,
            operationResult: secondOtherNumber,
            operator: chosenOperator,
          );
        }
      }
    }
  }
}
