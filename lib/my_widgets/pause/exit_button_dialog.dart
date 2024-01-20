import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/util/language_constants.dart';

class ExitButtonDialog extends StatefulWidget {
  Function() exitButtonCallback;
  BuildContext appContext;

  ExitButtonDialog(this.exitButtonCallback, this.appContext, {super.key});

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
            translation(widget.appContext).mainMenu,
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
