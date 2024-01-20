import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../util/language_constants.dart';

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(translation(context).ok),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(translation(context).addOperator),
    content: Text(translation(context).chooseAtLeastOneOperator),
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
