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

  // Widget currentWidget() {
  //   return Center(
  //     child: GridView.builder(
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: widget.answer > 5 ? 2 : 1,
  //         // mainAxisExtent: widget.imageSize,
  //         childAspectRatio: 1,
  //       ),
  //       physics: const NeverScrollableScrollPhysics(),
  //       shrinkWrap: true,
  //       itemCount: widget.answer,
  //       itemBuilder: (context, index) {
  //         return Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             InkWell(
  //               onTap: () {
  //                 setState(() {
  //                   tappedIndex = index;
  //                 });
  //
  //                 Future.delayed(const Duration(milliseconds: 500), () {
  //                   // Reset tappedIndex after 500 milliseconds (5 seconds)
  //                   setState(() {
  //                     tappedIndex = null;
  //                   });
  //                 });
  //               },
  //               child: Stack(
  //                 children: [
  //                   Image(
  //                     // fit: BoxFit.fill,
  //                     // width: widget.imageSize,
  //                     // height: widget.imageSize,
  //                     image: AssetImage(
  //                       'assets/images/game_icons/${widget.imageName}',
  //                     ),
  //                   ),
  //                   if (tappedIndex != null && tappedIndex == index)
  //                     Center(
  //                       child: Container(
  //                         // width: widget.imageSize,
  //                         // height: widget.imageSize,
  //                         color: Colors.green.withOpacity(0.5),
  //                         child: AnimatedOpacity(
  //                           opacity: 1.0,
  //                           duration: const Duration(milliseconds: 500),
  //                           child: Center(
  //                             child: Text(
  //                               (index + 1).toString(),
  //                               style: TextStyle(
  //                                 color: Colors.black,
  //                                 // fontSize: widget.imageSize * 0.5,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         );
  //       },
  //     ),
  //   );
  // }

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
