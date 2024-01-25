import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../models/icon_position.dart';

class DifferentSetsItemPictures extends StatefulWidget {
  double height;
  double width;
  String imageName;
  int answer;
  List<IconPosition> iconPositions = [];

  DifferentSetsItemPictures({
    Key? key,
    required this.height,
    required this.width,
    required this.imageName,
    required this.answer,
    required this.iconPositions,
  }) : super(key: key);

  @override
  State<DifferentSetsItemPictures> createState() =>
      _DifferentSetsItemPicturesState();
}

class _DifferentSetsItemPicturesState extends State<DifferentSetsItemPictures> {
  int? tappedIndex;

  @override
  void initState() {
    super.initState();
  }

  Widget randomPosition(
    double positionX,
    double positionY,
  ) {
    return Positioned(
      left: positionX * widget.width,
      top: positionY * widget.height,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/game_icons/${widget.imageName}',
            height: min(widget.width, widget.height) * randomItemSizeScale,
            width:  min(widget.width, widget.height) * randomItemSizeScale,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
          for (var iconPosition in widget.iconPositions)
            randomPosition(
              iconPosition.x,
              iconPosition.y,
            ),
        ],
      ),
    );
  }
}
