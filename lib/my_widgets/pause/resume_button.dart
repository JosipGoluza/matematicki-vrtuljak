import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/util/language_constants.dart';

class ResumeButton extends StatefulWidget {
  BuildContext appContext;

  ResumeButton(this.appContext, {super.key});

  @override
  State<ResumeButton> createState() => _ResumeButtonState();
}

class _ResumeButtonState extends State<ResumeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/pause_dialog/button_yellow.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: TextButton(
        onPressed: () {
          // Action for the button
          Navigator.of(context).pop(); // Close the dialog
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero, // Remove padding
        ),
        child: Center(
          child: Text(
            translation(widget.appContext).continueGame,
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
