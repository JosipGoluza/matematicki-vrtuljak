import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/localizations/settings_widgets_localization.dart';

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(ok.i18n),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(addOperator.i18n),
    content: Text(chooseAtLeastOneOperator.i18n),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
