import 'dart:math';

int generateRandomNumberAround(int number, int maxDistance) {
  Random randomizer = Random();
  int lowerBound = number - maxDistance;
  int upperBound = number + maxDistance;
  int randomNumber =
      randomizer.nextInt(upperBound - lowerBound + 1) + lowerBound;
  return randomNumber;
}
