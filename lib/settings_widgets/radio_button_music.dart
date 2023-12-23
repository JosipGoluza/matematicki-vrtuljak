import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/localizations/settings_widgets_localization.dart';

import '../constants/constants.dart';

class RadioButtonMusic extends StatefulWidget {
  Function(bool value) musicCallback;
  bool value;
  double maxWidth;

  RadioButtonMusic(this.musicCallback, this.value, this.maxWidth, {Key? key})
      : super(key: key);

  @override
  State<RadioButtonMusic> createState() => _RadioButtonMusicState();
}

class _RadioButtonMusicState extends State<RadioButtonMusic> {
  Widget customRadioButton(bool musicValue) {
    var text = musicValue ? yes.i18n : no.i18n;
    // Used SizedBox with fixed width to center the widget
    return SizedBox(
      width: (widget.maxWidth) / 7,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            widget.value = musicValue;
          });
          widget.musicCallback(widget.value);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor:
              (widget.value == musicValue) ? Colors.blue : Colors.transparent,
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
        Expanded(
          flex: 1,
          child: Text(
            music.i18n,
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
