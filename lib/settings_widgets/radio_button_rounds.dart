import 'package:flutter/material.dart';

import '../constants/constants.dart';

class RadioButtonRounds extends StatefulWidget {
  Function(int value) roundsCallback;
  int value;

  RadioButtonRounds(this.roundsCallback, this.value, {Key? key})
      : super(key: key);

  @override
  State<RadioButtonRounds> createState() => _RadioButtonRoundsState();
}

class _RadioButtonRoundsState extends State<RadioButtonRounds> {
  Widget customRadioButton(int roundsValue) {
    // Used SizedBox with fixed width to center the widget
    var text = "";
    if (roundsValue == 100000) {
      text = "~";
    } else {
      text = roundsValue.toString();
    }

    return SizedBox(
      width: 60,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            widget.value = roundsValue;
          });
          widget.roundsCallback(widget.value);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: (widget.value == roundsValue)
              ? Colors.blue
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(
            color: Colors.black,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: (widget.value == roundsValue) ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // expanded da odvoji tekst od radio buttona i poravna sve u sredinu
        const Expanded(
          child: Text(
            'BROJ ZADATAKA',
            textAlign: TextAlign.end,
          ),
        ),
        const SizedBox(
          width: settingsRowMargin,
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              customRadioButton(5),
              customRadioButton(10),
              customRadioButton(15),
              customRadioButton(20),
              customRadioButton(100000),
            ],
          ),
        ),
      ],
    );
  }
}
