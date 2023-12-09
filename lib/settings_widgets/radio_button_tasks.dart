import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../constants/constants.dart';
import '../models/game_symbol.dart';

class RadioButtonTasks extends StatefulWidget {
  Function(int value) tasksCallback;
  int value;
  GameSymbol symbol;
  double maxWidth;

  RadioButtonTasks(this.tasksCallback, this.value, this.symbol, this.maxWidth, {Key? key})
      : super(key: key);

  @override
  State<RadioButtonTasks> createState() => _RadioButtonTasksState();
}

class _RadioButtonTasksState extends State<RadioButtonTasks> {
  Widget customRadioButton(int roundsValue) {
    // Used SizedBox with fixed width to center the widget
    return SizedBox(
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(
            color: Colors.black,
          ),
        ),
        child: Text(
          roundsValue.toString(),
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var currentSymbol = GameSymbol.values.firstWhere((e) => e == widget.symbol);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // expanded da odvoji tekst od radio buttona i poravna sve u sredinu
        Text(
          'ZADACI DO BROJA',
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: widget.maxWidth / 55,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: settingsRowMargin,
        ),
        NumberPicker(
          value: widget.value > currentSymbol.max
              ? currentSymbol.max
              : widget.value,
          minValue: currentSymbol.min,
          maxValue: currentSymbol.max,
          onChanged: (value) {
            setState(() {
              widget.value = value;
              widget.tasksCallback(widget.value);
            });
          },
          // itemCount: 5,
          // itemWidth: widget.maxWidth / 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black),
          ),
          axis: Axis.horizontal,
        ),
      ],
    );
  }
}
