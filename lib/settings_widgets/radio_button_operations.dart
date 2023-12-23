import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/localizations/settings_widgets_localization.dart';
import 'package:matematicki_vrtuljak/models/operators.dart';

import '../constants/constants.dart';

class RadioButtonOperations extends StatefulWidget {
  Function(List<Operators> value) operatorsCallback;
  List<Operators> value;
  double maxWidth;

  RadioButtonOperations(this.operatorsCallback, this.value, this.maxWidth,
      {Key? key})
      : super(key: key);

  @override
  State<RadioButtonOperations> createState() => _RadioButtonOperationsState();
}

class _RadioButtonOperationsState extends State<RadioButtonOperations> {
  Widget customRadioButton(Operators operatorValue) {
    return SizedBox(
      width: widget.maxWidth / 7,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            if (widget.value.contains(operatorValue)) {
              widget.value.remove(operatorValue);
            } else {
              widget.value.add(operatorValue);
            }
          });
          widget.operatorsCallback(widget.value);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: (widget.value.contains(operatorValue))
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
          operatorValue.value,
          style: TextStyle(
            color: (widget.value.contains(operatorValue))
                ? Colors.white
                : Colors.black,
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
              enableOperations.i18n,
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
              for (var operator in Operators.values) customRadioButton(operator)
            ],
          ),
        ),
      ],
    );
  }
}
