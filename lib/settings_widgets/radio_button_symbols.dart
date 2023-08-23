import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/game_symbol.dart';

class RadioButtonSymbols extends StatefulWidget {
  Function(String value) symbolCallback;
  String value;
  Function(int value) tasksCallback;
  int numberOfTasks;

  RadioButtonSymbols(
      this.symbolCallback, this.value, this.tasksCallback, this.numberOfTasks,
      {Key? key})
      : super(key: key);

  @override
  State<RadioButtonSymbols> createState() => _RadioButtonSymbolsState();
}

class _RadioButtonSymbolsState extends State<RadioButtonSymbols> {
  Widget customRadioButton(GameSymbol symbolValue) {
    // Used SizedBox with fixed width to center the widget
    return SizedBox(
      width: 80,
      height: 40,
      child: OutlinedButton(
        onPressed: () {
          setState(
            () {
              widget.value = symbolValue.name;
              widget.symbolCallback(widget.value);
              if (widget.numberOfTasks > symbolValue.max) {
                widget.numberOfTasks = symbolValue.max;
                widget.tasksCallback(widget.numberOfTasks);
              }
            },
          );
        },
        style: OutlinedButton.styleFrom(
          backgroundColor:
              (widget.value == symbolValue.name) ? Colors.blue : Colors.transparent,
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
                  (widget.value == symbolValue.name) ? Colors.white : Colors.black,
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
