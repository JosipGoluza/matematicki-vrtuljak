import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/constants.dart';

class PauseButton extends StatefulWidget {
  double maxWidth;
  double maxHeight;

  PauseButton(this.maxWidth, this.maxHeight, {super.key});

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
          context.go('/');
        },
        child: Image(
          fit: BoxFit.fill,
          width: min(widget.maxWidth, widget.maxHeight) / pauseButtonSizeScale,
          height: min(widget.maxWidth, widget.maxHeight) / pauseButtonSizeScale,
          image: const AssetImage(
            'assets/images/button_pause.png',
          ),
        ),
      ),
    );
  }
}
