import 'dart:math';

import 'package:flutter/material.dart';

class DynamicEmptyContainer extends StatefulWidget {
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
  State<DynamicEmptyContainer> createState() => _DynamicEmptyContainerState();
}

class _DynamicEmptyContainerState extends State<DynamicEmptyContainer>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutQuart,
  );

  @override
  Widget build(BuildContext context) {
    var endValue = min(widget.height, widget.width);

    if (widget.boxColor == Colors.transparent) {
      return Container(
        height: endValue,
        width: endValue,
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: Colors.grey,
          ),
          color: widget.boxColor,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      );
    } else {
      return Center(
        child: RotationTransition(
          turns: _animation,
          child: (widget.boxColor == Colors.green)
              ? Image(
                  image: const AssetImage('assets/images/correct.png'),
                  height: endValue,
                  width: endValue,
                )
              : SizedBox(
                  height: endValue,
                  width: endValue,
                  child: Center(
                    child: Text(
                      'X',
                      style: TextStyle(
                        fontSize: endValue * 0.8,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
        ),
      );
      // return PlayAnimationBuilder<double>(
      //   tween: Tween(begin: 0.0, end: endValue),
      //   duration: const Duration(seconds: 2),
      //   curve: Curves.easeOut,
      //   builder: (context, value, child) {
      //     return Container(
      //       height: value,
      //       width: value,
      //       color: widget.boxColor,
      //       child: child,
      //     );
      //   },
      // );
    }
  }
}
