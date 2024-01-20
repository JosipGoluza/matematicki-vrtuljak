import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/constants.dart';
import '../util/language_constants.dart';

class RadioButtonRounds extends StatefulWidget {
  Function(int value) roundsCallback;
  int value;
  double maxWidth;

  RadioButtonRounds(this.roundsCallback, this.value, this.maxWidth, {Key? key})
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
      width: widget.maxWidth / 7,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            widget.value = roundsValue;
          });
          widget.roundsCallback(widget.value);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor:
              (widget.value == roundsValue) ? Colors.blue : Colors.transparent,
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
        Expanded(
          flex: 1,
          child: Text(
            translation(context).numberOfRoundsLocalization,
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
