import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/game_symbol.dart';
import '../util/language_constants.dart';

class RadioButtonSymbols extends StatefulWidget {
  Function(GameSymbol value) symbolCallback;
  GameSymbol value;
  Function(int value) tasksCallback;
  int maxOperationNumber;
  double maxWidth;
  double maxHeight;

  RadioButtonSymbols(this.symbolCallback, this.value, this.tasksCallback,
      this.maxOperationNumber, this.maxWidth, this.maxHeight,
      {super.key});

  @override
  State<RadioButtonSymbols> createState() => _RadioButtonSymbolsState();
}

class _RadioButtonSymbolsState extends State<RadioButtonSymbols> {
  Widget customRadioButton(GameSymbol symbolValue) {
    var buttonWidth = widget.maxWidth / 7;
    var buttonHeight = widget.maxHeight * settingsRadioButtonHeightScale;
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
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
          padding: const EdgeInsets.all(5),
        ),
        child: {
          GameSymbol.numbers: AutoSizeText(
            translation(context).numbers,
            style: TextStyle(
              color:
                  (widget.value == symbolValue) ? Colors.white : Colors.black,
              fontSize: 9999,
            ),
            maxLines: 1,
          ),
          GameSymbol.images: Image.asset(
            'assets/images/option_apple.png',
          ),
          GameSymbol.blocks: Image.asset(
            'assets/images/option_square.png',
            fit: BoxFit.fill,
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
        Expanded(
          flex: 1,
          child: Text(
            translation(context).numbersOrSymbols,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: widget.maxWidth / settingsFontSize,
              fontWeight: FontWeight.bold,
            ),
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
