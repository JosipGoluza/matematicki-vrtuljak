import '../before_game/generate_operations_values.dart';
import 'game_symbol.dart';
import 'operators.dart';

class StartOperationsGameModel {
  int numberOfRounds;
  int numberOfAnswers;
  int currentRound;
  Stopwatch stopwatch;
  int correctGuesses;
  int wrongGuesses;
  OperationValues operationValues;
  GameSymbol gameSymbol;
  String path;
  int maxOperationNumber;
  List<Operators> operators;

  StartOperationsGameModel({
    required this.numberOfRounds,
    required this.numberOfAnswers,
    required this.currentRound,
    required this.stopwatch,
    required this.correctGuesses,
    required this.wrongGuesses,
    required this.operationValues,
    required this.gameSymbol,
    required this.path,
    required this.maxOperationNumber,
    required this.operators,
  });
}
