import 'package:flutter/material.dart';

class DynamicEmptyContainer extends StatelessWidget {
  double height;
  double width;
  Color boxColor;


  DynamicEmptyContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.boxColor,
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
        color: boxColor,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
    );
  }
}
