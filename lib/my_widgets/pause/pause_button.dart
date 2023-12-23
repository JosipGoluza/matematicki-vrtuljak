import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/my_widgets/pause/restart_button.dart';
import 'package:matematicki_vrtuljak/my_widgets/pause/resume_button.dart';

import '../../constants/constants.dart';
import '../../localizations/pause_localization.dart';
import 'exit_button_dialog.dart';

class PauseButton extends StatefulWidget {
  double maxWidth;
  double maxHeight;
  String path;
  Function() restartButtonCallback;
  Function() exitButtonCallback;

  PauseButton(this.maxWidth, this.maxHeight, this.path,
      this.restartButtonCallback, this.exitButtonCallback,
      {super.key});

  @override
  State<PauseButton> createState() => _PauseButtonState();
}

class _PauseButtonState extends State<PauseButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          // context.go('/');
          _showPauseDialog(context);
        },
        child: Image(
          fit: BoxFit.fill,
          width: min(widget.maxWidth / pauseButtonSizeScaleWidth,
              widget.maxHeight / pauseButtonSizeScaleHeight),
          height: min(widget.maxWidth / pauseButtonSizeScaleWidth,
              widget.maxHeight / pauseButtonSizeScaleHeight),
          image: const AssetImage(
            'assets/images/button_pause.png',
          ),
        ),
      ),
    );
  }

  Future<void> _showPauseDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.lightBlue[200],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                pause.i18n,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(width: 200, height: 50, child: ResumeButton()),
              const SizedBox(height: 12),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: RestartButton(widget.restartButtonCallback)),
              const SizedBox(height: 12),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: ExitButtonDialog(widget.exitButtonCallback)),
            ],
          ),
        );
      },
    );
  }
}
