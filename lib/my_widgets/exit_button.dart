import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/constants.dart';

class ExitButton extends StatefulWidget {
  double maxWidth;
  double maxHeight;

  ExitButton(this.maxWidth, this.maxHeight, {super.key});

  @override
  State<ExitButton> createState() => _ExitButtonState();
}

class _ExitButtonState extends State<ExitButton> {
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
}
