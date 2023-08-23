import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/constants/constants.dart';

class RadioButtonAnswers extends StatefulWidget {
  Function(int value) answersCallback;
  int value;

  RadioButtonAnswers(this.answersCallback, this.value, {Key? key})
      : super(key: key);

  @override
  State<RadioButtonAnswers> createState() => _RadioButtonAnswersState();
}

class _RadioButtonAnswersState extends State<RadioButtonAnswers> {
  Widget customRadioButton(int answersValue) {
    // Used SizedBox with fixed width to center the widget
    return SizedBox(
      width: 60,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            widget.value = answersValue;
          });
          widget.answersCallback(widget.value);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: (widget.value == answersValue)
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
        const Expanded(
            child: Text(
          'BROJ ODGOVORA',
          textAlign: TextAlign.end,
        )),
        const SizedBox(
          width: settingsRowMargin,
        ),
        Expanded(
          child: Row(
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
