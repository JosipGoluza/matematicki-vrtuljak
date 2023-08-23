import 'package:flutter/material.dart';

class DifferentSetsItemPictures extends StatelessWidget {
  double height;
  double width;
  String imageName;
  int answer;
  double imageSize;

  DifferentSetsItemPictures({
    Key? key,
    required this.height,
    required this.width,
    required this.imageName,
    required this.answer,
    required this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: answer > 5 ? 2 : 1,
            mainAxisExtent: imageSize,
            childAspectRatio: 1,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: answer,
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
