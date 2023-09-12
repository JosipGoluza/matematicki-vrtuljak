import "dart:math";

import '../models/operators.dart';
import 'generate_addition_subtraction_numbers.dart';
import 'generate_multiplication_division_numbers.dart';

class OperationValues {
  int firstNumber;
  int secondNumber;
  int operationResult;
  Operators operator;

  OperationValues({
    required this.firstNumber,
    required this.secondNumber,
    required this.operationResult,
    required this.operator,
  });
}

OperationValues generateOperationsValues(
  int maxOperationNumber,
  List<Operators> operators,
) {
  final random = Random();

  var chosenOperator = operators[random.nextInt(operators.length)];
  late OperationValues operationValues;

  // Addition and multiplication have the same logic for generating numbers
  if (chosenOperator == Operators.add || chosenOperator == Operators.subtract) {
    operationValues = generateAdditionSubtractionValues(
      maxOperationNumber,
      chosenOperator,
    );
  } else if (chosenOperator == Operators.multiply ||
      chosenOperator == Operators.divide) {
    operationValues = generateMultiplicationDivisionValues(
      maxOperationNumber,
      chosenOperator,
    );
  } else {
    throw Exception("Unknown operator");
  }

  return operationValues;
}
