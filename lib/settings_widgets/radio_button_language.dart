import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/models/language.dart';
import 'package:matematicki_vrtuljak/settings_widgets/settings_widgets_localization.dart';

import '../constants/constants.dart';

class RadioButtonLanguage extends StatefulWidget {
  Function(LanguageOptions value) languageCallback;
  LanguageOptions value;

  RadioButtonLanguage(this.languageCallback, this.value, {Key? key})
      : super(key: key);

  @override
  State<RadioButtonLanguage> createState() => RadioButtonLanguageState();
}

class RadioButtonLanguageState extends State<RadioButtonLanguage> {
  Widget customRadioButton(LanguageOptions languageValue) {
    return SizedBox(
      width: 40,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            widget.value = languageValue;
          });
          widget.languageCallback(widget.value);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: (widget.value == languageValue)
              ? Colors.blue
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(
            color: Colors.black,
          ),
        ),
        child: {
          LanguageOptions.english: Image.asset(
            'assets/images/language_icon/english.png',
          ),
          LanguageOptions.croatian: Image.asset(
            'assets/images/language_icon/croatian.png',
          ),
        }[languageValue],
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
          child: Text(
            selectLanguage.i18n,
            textAlign: TextAlign.end,
          ),
        ),
        const SizedBox(
          width: settingsRowMargin,
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              customRadioButton(LanguageOptions.english),
              customRadioButton(LanguageOptions.croatian),
              customRadioButton(LanguageOptions.english),
              customRadioButton(LanguageOptions.english),
              customRadioButton(LanguageOptions.english),
              customRadioButton(LanguageOptions.english),
            ],
          ),
        ),
      ],
    );
  }
}
