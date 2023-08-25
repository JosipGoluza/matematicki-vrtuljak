import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/models/operators.dart';

import '../constants/constants.dart';

class RadioButtonOperations extends StatefulWidget {
  Function(List<String> value) operatorsCallback;
  List<String> value;

  RadioButtonOperations(this.operatorsCallback, this.value, {Key? key})
      : super(key: key);

  @override
  State<RadioButtonOperations> createState() => _RadioButtonOperationsState();
}

class _RadioButtonOperationsState extends State<RadioButtonOperations> {
  Widget customRadioButton(String operatorValue) {
    return SizedBox(
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
          operatorValue,
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
        const Expanded(
            child: Text(
          'MOGUĆI OPERATORI',
          textAlign: TextAlign.end,
        )),
        const SizedBox(
          width: settingsRowMargin,
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              for (var operator in Operators.values)
                customRadioButton(operator.value)
            ],
          ),
        ),
      ],
    );
  }
}
