import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/localizations/settings_widgets_localization.dart';

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
      width: widget.maxWidth / 7,
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
            numbers.i18n,
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
        Text(
          numbersOrSymbols.i18n,
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: widget.maxWidth / settingsFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: settingsRowMargin,
        ),
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
