import 'package:flutter/material.dart';

class RestartButton extends StatefulWidget {
  Function() restartButtonCallback;

  RestartButton(this.restartButtonCallback, {super.key});

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
        child: const Center(
          child: Text(
            'IGRAJ PONOVO',
            style: TextStyle(
              color: Colors.black, // Text color
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
