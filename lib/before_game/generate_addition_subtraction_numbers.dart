import 'dart:math';

import 'package:matematicki_vrtuljak/models/operators.dart';

import 'generate_operations_values.dart';

OperationValues generateAdditionSubtractionValues(
  int maxOperationNumber,
  Operators chosenOperator,
) {
  final random = Random();
  const minimalResultNumber = 2;

  if (minimalResultNumber == maxOperationNumber) {
    if(chosenOperator == Operators.add) {
      return OperationValues(
        firstNumber: 1,
        secondNumber: 1,
        operationResult: 2,
        operator: chosenOperator,
      );
    } else {
      return OperationValues(
        firstNumber: 2,
        secondNumber: 1,
        operationResult: 1,
        operator: chosenOperator,
      );
    }
  }

  // in addition it is a result, but in subtraction it is a first number
  var biggestNumber = minimalResultNumber +
      random.nextInt(maxOperationNumber - minimalResultNumber);

  var firstOtherNumber = random.nextInt(biggestNumber - 1) + 1;
  var secondOtherNumber = Operators.doReverseOperation(
    chosenOperator,
    biggestNumber,
    firstOtherNumber,
  );

  if (chosenOperator == Operators.add) {
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
