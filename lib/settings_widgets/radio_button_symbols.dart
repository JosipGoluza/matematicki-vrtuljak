import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/game_symbol.dart';

class RadioButtonSymbols extends StatefulWidget {
  Function(GameSymbol value) symbolCallback;
  GameSymbol value;
  Function(int value) tasksCallback;
  int maxOperationNumber;
  double maxWidth;

  RadioButtonSymbols(this.symbolCallback, this.value, this.tasksCallback,
      this.maxOperationNumber, this.maxWidth,
      {Key? key})
      : super(key: key);

  @override
  State<RadioButtonSymbols> createState() => _RadioButtonSymbolsState();
}

class _RadioButtonSymbolsState extends State<RadioButtonSymbols> {
  Widget customRadioButton(GameSymbol symbolValue) {
    // Used SizedBox with fixed width to center the widget
    return SizedBox(
      width: (widget.maxWidth / 2) / 5,
      height: 40,
      child: OutlinedButton(
        onPressed: () {
          setState(
            () {
              widget.value = symbolValue;
              widget.symbolCallback(widget.value);
              if (widget.maxOperationNumber > symbolValue.max) {
                widget.maxOperationNumber = symbolValue.max;
                widget.tasksCallback(widget.maxOperationNumber);
              }
            },
          );
        },
        style: OutlinedButton.styleFrom(
          backgroundColor:
              (widget.value == symbolValue) ? Colors.blue : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(
            color: Colors.black,
          ),
        ),
        child: {
          GameSymbol.numbers: Text(
            'Brojevi',
            style: TextStyle(
              color:
                  (widget.value == symbolValue) ? Colors.white : Colors.black,
            ),
          ),
          GameSymbol.images: Image.asset(
            'assets/images/option_apple.png',
          ),
          GameSymbol.blocks: Image.asset(
            'assets/images/option_square.png',
          ),
        }[symbolValue],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
            child: Text(
          'BROJEVI ILI SIMBOLI',
          textAlign: TextAlign.end,
        )),
        const SizedBox(
          width: settingsRowMargin,
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              customRadioButton(GameSymbol.numbers),
              customRadioButton(GameSymbol.images),
              customRadioButton(GameSymbol.blocks),
            ],
          ),
        ),
      ],
    );
  }
}
