import 'package:flutter/material.dart';

class NumbersItemPictures extends StatelessWidget {
  double height;
  double width;
  String imageName;
  int correctAnswer;
  double imageSize;

  NumbersItemPictures({
    Key? key,
    required this.height,
    required this.width,
    required this.imageName,
    required this.correctAnswer,
    required this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: correctAnswer,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    print((index + 1).toString());
                  },
                  child: Image(
                    fit: BoxFit.fill,
                    width: imageSize,
                    height: imageSize,
                    image: AssetImage(
                      'assets/images/game_icons/$imageName',
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
