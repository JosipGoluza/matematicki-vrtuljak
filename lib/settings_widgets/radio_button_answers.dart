import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:matematicki_vrtuljak/constants/constants.dart';

import '../util/language_constants.dart';

class RadioButtonAnswers extends StatefulWidget {
  Function(int value) answersCallback;
  int value;
  double maxWidth;

  RadioButtonAnswers(this.answersCallback, this.value, this.maxWidth,
      {Key? key})
      : super(key: key);

  @override
  State<RadioButtonAnswers> createState() => _RadioButtonAnswersState();
}

class _RadioButtonAnswersState extends State<RadioButtonAnswers> {
  Widget customRadioButton(int answersValue) {
    // Used SizedBox with fixed width to center the widget
    return SizedBox(
      width: widget.maxWidth / 7,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            widget.value = answersValue;
          });
          widget.answersCallback(widget.value);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor:
              (widget.value == answersValue) ? Colors.blue : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(
            color: Colors.black,
          ),
        ),
        child: Text(
          answersValue.toString(),
          style: TextStyle(
            color: (widget.value == answersValue) ? Colors.white : Colors.black,
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
        Expanded(
            flex: 1,
            child: Text(
              translation(context).numberOfAnswersLocalization,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: widget.maxWidth / settingsFontSize,
                fontWeight: FontWeight.bold,
              ),
            )),
        const SizedBox(
          width: settingsRowMargin,
        ),
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              customRadioButton(2),
              customRadioButton(3),
              customRadioButton(4),
              customRadioButton(5),
              customRadioButton(6),
            ],
          ),
        ),
      ],
    );
  }
}
