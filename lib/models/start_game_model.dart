class StartNumbersGameModel {
  int numberOfRounds;
  int numberOfAnswers;
  int correctAnswer;
  String imageName;
  int currentRound;
  Stopwatch stopwatch;
  int correctGuesses;
  int wrongGuesses;

  StartNumbersGameModel({
    required this.numberOfRounds,
    required this.numberOfAnswers,
    required this.correctAnswer,
    required this.imageName,
    required this.currentRound,
    required this.stopwatch,
    required this.correctGuesses,
    required this.wrongGuesses,
  });
}

class StartDifferentSetsGameModel {
  int numberOfRounds;
  int correctAnswer;
  int otherAnswer;
  String imageName;
  bool isSame;
  int currentRound;
  Stopwatch stopwatch;
  int correctGuesses;
  int wrongGuesses;

  StartDifferentSetsGameModel({
    required this.numberOfRounds,
    required this.correctAnswer,
    required this.otherAnswer,
    required this.imageName,
    required this.isSame,
    required this.currentRound,
    required this.stopwatch,
    required this.correctGuesses,
    required this.wrongGuesses,
  });
}