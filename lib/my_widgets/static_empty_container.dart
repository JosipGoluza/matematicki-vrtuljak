import 'package:flutter/material.dart';
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
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: {
        GameSymbol.numbers: Text(
          containerNumber.toString(),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        GameSymbol.images: Image.asset(
          'assets/images/game_icons/symbol_$containerNumber.png',
          fit: BoxFit.fill,
        ),
        GameSymbol.blocks: Image.asset(
          'assets/images/game_icons/tree$containerNumber.png',
          fit: BoxFit.fill,
        ),
      }[gameSymbol],
    );
  }
}
