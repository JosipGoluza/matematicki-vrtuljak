import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:matematicki_vrtuljak/constants/constants.dart';
import 'package:matematicki_vrtuljak/models/game_symbol.dart';

class StaticEmptyContainer extends StatelessWidget {
  final double height;
  final double width;
  final GameSymbol gameSymbol;
  final int containerNumber;

  const StaticEmptyContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.gameSymbol,
    required this.containerNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: min(height, width),
      width: min(height, width),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: {
        GameSymbol.numbers: AutoSizeText(
          containerNumber.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: fontMaxSize,
          ),
          maxLines: 1,
        ),
        GameSymbol.images: Image.asset(
          'assets/images/apples/apple$containerNumber.png',
          fit: BoxFit.fill,
        ),
        GameSymbol.blocks: Image.asset(
          'assets/images/tree/tree$containerNumber.png',
          fit: BoxFit.fill,
        ),
      }[gameSymbol],
    );
  }
}
