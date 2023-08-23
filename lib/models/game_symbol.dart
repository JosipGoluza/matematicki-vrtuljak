enum GameSymbol {
  numbers(name: 'Brojevi', min: 2, max: 99),
  images(name: 'Slike', min: 2, max: 9),
  blocks(name: 'Kocke', min: 2, max: 30);

  const GameSymbol({
    required this.name,
    required this.min,
    required this.max,
  });

  final String name;
  final int min;
  final int max;
}
