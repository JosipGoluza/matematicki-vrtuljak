import 'package:flutter/material.dart';

class StaticEmptyContainer extends StatelessWidget {
  final double height;
  final double width;

  const StaticEmptyContainer({
    Key? key,
    required this.height,
    required this.width,
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
      child: Image.asset(
        'assets/images/game_icons/symbol_17.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
