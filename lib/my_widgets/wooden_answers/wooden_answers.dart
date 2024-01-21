import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/models/game_symbol.dart';
import 'package:provider/provider.dart';

import '../../util/audio_player_handler.dart';
import '../../util/generate_random_number_around.dart';

class WoodenAnswers extends StatefulWidget {
  double height;
  double width;
  int correctAnswer;
  int numberOfAnswers;
  GameSymbol gameSymbol;
  int maxAnswerNumber;
  Function(Color value) answerBoxCallback;

  WoodenAnswers({
    Key? key,
    required this.height,
    required this.width,
    required this.correctAnswer,
    required this.numberOfAnswers,
    required this.answerBoxCallback,
    required this.maxAnswerNumber,
    this.gameSymbol = GameSymbol.numbers,
  }) : super(key: key);

  @override
  State<WoodenAnswers> createState() => _WoodenAnswersState();
}

class _WoodenAnswersState extends State<WoodenAnswers> {
  List<int> numberList = [];
  List<bool> guessedList = [];
  int maxDistance = 10;

  void initializeList() {
    numberList.add(widget.correctAnswer);
    guessedList = List.filled(widget.numberOfAnswers, false);
    while (numberList.length < widget.numberOfAnswers) {
      int randomValue = generateRandomNumberAround(
        widget.correctAnswer,
        maxDistance,
      );
      if (!numberList.contains(randomValue) &&
          randomValue > 0 &&
          randomValue <= widget.maxAnswerNumber) {
        numberList.add(randomValue);
      }
    }
    numberList.shuffle();
  }

  @override
  void initState() {
    super.initState();
    initializeList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var index = 0; index < numberList.length; index++)
            SizedBox(
              width: min(widget.width * 0.165, widget.height),
              height: min(widget.width * 0.165, widget.height),
              child: Opacity(
                opacity: guessedList[index] ? 0.5 : 1,
                child: Center(
                  child: InkWell(
                    onTap: () async {
                      if (guessedList[index] == true) return;
                      if (numberList[index] == widget.correctAnswer) {
                        var audioPlayerProvider =
                            Provider.of<AudioPlayerProvider>(
                          context,
                          listen: false,
                        );
                        audioPlayerProvider.playCorrectSoundEffect();
                        await widget.answerBoxCallback(Colors.green);
                      } else {
                        var audioPlayerProvider =
                            Provider.of<AudioPlayerProvider>(
                          context,
                          listen: false,
                        );
                        audioPlayerProvider.playWrongSoundEffect();
                        guessedList[index] = true;
                        await widget.answerBoxCallback(Colors.red);
                      }
                    },
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: const Image(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/images/sign.png',
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: {
                            GameSymbol.numbers: Text(
                              numberList[index].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize:
                                    min(widget.width * 0.165, widget.height) *
                                        0.5,
                              ),
                            ),
                            GameSymbol.images: Padding(
                              padding: EdgeInsets.only(
                                bottom: widget.height * 0.25,
                                top: widget.height * 0.16,
                              ),
                              child: Image.asset(
                                'assets/images/apples/apple${numberList[index]}.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            GameSymbol.blocks: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: widget.height * 0.13,
                              ),
                              child: Image.asset(
                                'assets/images/tree/tree${numberList[index]}.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          }[widget.gameSymbol],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
