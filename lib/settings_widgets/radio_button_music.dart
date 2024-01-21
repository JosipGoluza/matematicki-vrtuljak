import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/constants.dart';
import '../util/language_constants.dart';

class RadioButtonMusic extends StatefulWidget {
  Function(bool value) musicCallback;
  bool value;
  double maxWidth;
  double maxHeight;

  RadioButtonMusic(this.musicCallback, this.value, this.maxWidth, this.maxHeight, {Key? key})
      : super(key: key);

  @override
  State<RadioButtonMusic> createState() => _RadioButtonMusicState();
}

class _RadioButtonMusicState extends State<RadioButtonMusic> {
  Widget customRadioButton(bool musicValue) {
    var text = musicValue
        ? translation(context).yes
        : translation(context).no;
    var buttonWidth = widget.maxWidth / 7;
    var buttonHeight = widget.maxHeight * settingsRadioButtonHeightScale;
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
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
          padding: EdgeInsets.zero,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: (widget.value == musicValue) ? Colors.white : Colors.black,
            fontSize: min(buttonWidth * 0.4, buttonHeight * 0.7),
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
            translation(context).music,
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
