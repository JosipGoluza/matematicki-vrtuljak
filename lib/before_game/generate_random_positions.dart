import 'dart:math';

import 'package:matematicki_vrtuljak/models/icon_position.dart';

import '../constants/constants.dart';

List<IconPosition> generateRandomPositions(int answer) {
  List<IconPosition> currentPositions = [];

  while (currentPositions.length < answer) {
    var random = Random();
    var x = doubleInRange(random, 0, 1 - randomItemSizeScale);
    var y = doubleInRange(random, 0, 1 - randomItemSizeScale);

    if (checkIfAvailable(x, y, currentPositions)) {
      currentPositions.add(
        IconPosition(
          x: x,
          y: y,
        ),
      );
    }
  }

  return currentPositions;
}

bool checkIfAvailable(double x, double y, List<IconPosition> currentPositions) {
  for (var position in currentPositions) {
    var betweenX = x >= position.x - randomItemSizeScale &&
        x <= position.x + randomItemSizeScale;
    var betweenY = y >= position.y - randomItemSizeScale &&
        y <= position.y + randomItemSizeScale;
    if (betweenX && betweenY) {
      return false;
    }
  }

  return true;
}

double doubleInRange(Random source, num start, num end) =>
    source.nextDouble() * (end - start) + start;
