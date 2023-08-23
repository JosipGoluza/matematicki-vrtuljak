import 'package:flutter/material.dart';

import '../constants/constants.dart';

class RadioButtonMusic extends StatefulWidget {
  Function(bool value) musicCallback;
  bool value;

  RadioButtonMusic(this.musicCallback, this.value, {Key? key})
      : super(key: key);

  @override
  State<RadioButtonMusic> createState() => _RadioButtonMusicState();
}

class _RadioButtonMusicState extends State<RadioButtonMusic> {
  Widget customRadioButton(bool musicValue) {
    var text = musicValue ? 'DA' : 'NE';
    // Used SizedBox with fixed width to center the widget
    return SizedBox(
      // width: 60,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            widget.value = musicValue;
          });
          widget.musicCallback(widget.value);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: (widget.value == musicValue)
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
            color: (widget.value == musicValue) ? Colors.white : Colors.black,
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
          'GLAZBA',
          textAlign: TextAlign.end,
        )),
        const SizedBox(
          width: settingsRowMargin,
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              customRadioButton(false),
              customRadioButton(true),
            ],
          ),
        ),
      ],
    );
  }
}
