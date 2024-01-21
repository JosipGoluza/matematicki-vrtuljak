import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/models/language.dart';

import '../constants/constants.dart';
import '../main.dart';
import '../util/language_constants.dart';

class RadioButtonLanguage extends StatefulWidget {
  double maxWidth;
  double maxHeight;

  RadioButtonLanguage(this.maxWidth, this.maxHeight, {Key? key})
      : super(key: key);

  @override
  State<RadioButtonLanguage> createState() => RadioButtonLanguageState();
}

class RadioButtonLanguageState extends State<RadioButtonLanguage> {
  Widget customRadioButton(
      LanguageOptions languageValue, String currentLocale) {
    var buttonWidth = widget.maxWidth / 9;
    var buttonHeight = widget.maxHeight * settingsRadioButtonHeightScale;
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: OutlinedButton(
        onPressed: () async {
          Locale _locale =
              await setLocale(getLanguageFromName(languageValue).languageCode);
          MyApp.setLocale(context, (_locale));
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: (currentLocale ==
                  getLanguageFromName(languageValue).languageCode.toString())
              ? Colors.blue
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(
            color: Colors.black,
          ),
          padding: const EdgeInsets.all(5),
        ),
        child: {
          LanguageOptions.english: Image.asset(
            'assets/images/language_icon/english.png',
          ),
          LanguageOptions.croatian: Image.asset(
            'assets/images/language_icon/croatian.png',
          ),
          LanguageOptions.spanish: Image.asset(
            'assets/images/language_icon/spanish.png',
          ),
          LanguageOptions.french: Image.asset(
            'assets/images/language_icon/french.png',
          ),
          LanguageOptions.portuguese: Image.asset(
            'assets/images/language_icon/portuguese.png',
          ),
          LanguageOptions.hungarian: Image.asset(
            'assets/images/language_icon/hungarian.png',
          ),
        }[languageValue],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var currentLocale = Localizations.localeOf(context).toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // expanded da odvoji tekst od radio buttona i poravna sve u sredinu
        Expanded(
          flex: 1,
          child: Text(
            translation(context).selectLanguage,
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
              for (var element in LanguageOptions.values)
                customRadioButton(element, currentLocale)
            ],
          ),
        ),
      ],
    );
  }
}
