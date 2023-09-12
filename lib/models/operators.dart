enum Operators {
  add(value: '+'),
  subtract(value: '-'),
  multiply(value: '*'),
  divide(value: '/');

  const Operators({
    required this.value,
  });

  final String value;

  doOperation(Operators operator, int firstNumber, int secondNumber) {
    switch (operator) {
      case Operators.add:
        return firstNumber + secondNumber;
      case Operators.subtract:
        return firstNumber - secondNumber;
      case Operators.multiply:
        return firstNumber * secondNumber;
      case Operators.divide:
        return firstNumber / secondNumber;
      default:
        return 1;
    }
  }

  checkOperation(
      int firstNumber, Operators operator, int secondNumber, int result) {
    switch (operator) {
      case Operators.add:
        return firstNumber + secondNumber == result;
      case Operators.subtract:
        return firstNumber - secondNumber == result;
      case Operators.multiply:
        return firstNumber * secondNumber == result;
      case Operators.divide:
        return firstNumber / secondNumber == result;
      default:
        return false;
    }
  }

  static int doReverseOperation(
      Operators operator, int biggerNumber, int smallerNumber) {
    switch (operator) {
      case Operators.add:
        return biggerNumber - smallerNumber;
      case Operators.subtract:
        return biggerNumber - smallerNumber;
      case Operators.multiply:
        return biggerNumber ~/ smallerNumber;
      case Operators.divide:
        return biggerNumber ~/ smallerNumber;
      default:
        return 1;
    }
  }
}

List<Operators> getOperatorFromValue(List<String> value) {
  return value
      .map((e) => Operators.values.firstWhere((element) => element.value == e))
      .toList();
}

// getImagePath() {
//   switch (this) {
//     case GameSymbol.numbers:
//       return 'assets/images/numbers.png';
//     case GameSymbol.images:
//       return 'assets/images/images.png';
//     case GameSymbol.blocks:
//       return 'assets/images/blocks.png';
//     default:
//       return 'assets/images/numbers.png';
//   }
// }
