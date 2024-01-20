import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/util/language_constants.dart';

class RestartButton extends StatefulWidget {
  Function() restartButtonCallback;
  BuildContext appContext;

  RestartButton(this.restartButtonCallback, this.appContext, {super.key});

  @override
  State<RestartButton> createState() => _RestartButtonState();
}

class _RestartButtonState extends State<RestartButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/pause_dialog/button_green.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: TextButton(
        onPressed: () {
          // Action for the button
          Navigator.of(context).pop(); // Close the dialog
          widget.restartButtonCallback();
        },
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: Colors.transparent, // Set background color to transparent
        // ),
        child: Center(
          child: Text(
            translation(widget.appContext).playAgainPause,
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
