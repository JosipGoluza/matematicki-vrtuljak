enum Operators {
  add(value: '+'),
  subtract(value: '-'),
  multiply(value: '*'),
  divide(value: '/');

  const Operators({
    required this.value,
  });

  final String value;
}
