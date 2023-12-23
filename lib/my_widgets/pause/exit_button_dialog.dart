import 'package:flutter/material.dart';

import '../../localizations/pause_localization.dart';

class ExitButtonDialog extends StatefulWidget {
  Function() exitButtonCallback;

  ExitButtonDialog(this.exitButtonCallback, {super.key});

  @override
  State<ExitButtonDialog> createState() => _ExitButtonDialogState();
}

class _ExitButtonDialogState extends State<ExitButtonDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/pause_dialog/button_red.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: TextButton(
        onPressed: () {
          // Action for the button
          Navigator.of(context).pop(); // Close the dialog
          widget.exitButtonCallback();
        },
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: Colors.transparent, // Set background color to transparent
        // ),
        child: Center(
          child: Text(
            mainMenu.i18n,
            style: const TextStyle(
              color: Colors.black, // Text color
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
