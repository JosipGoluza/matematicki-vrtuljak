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
}

getOperatorFromValue(List<String> value) {
  value
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
