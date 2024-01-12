import 'package:flutter/material.dart';

class NumbersItemPictures extends StatefulWidget {
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
  State<NumbersItemPictures> createState() => _NumbersItemPicturesState();
}

class _NumbersItemPicturesState extends State<NumbersItemPictures> {
  int? tappedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.correctAnswer,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  tappedIndex = index;
                });

                Future.delayed(const Duration(milliseconds: 500), () {
                  // Reset tappedIndex after 500 milliseconds (5 seconds)
                  setState(() {
                    tappedIndex = null;
                  });
                });
              },
              child: Stack(
                children: [
                  Image(
                    fit: BoxFit.fill,
                    width: widget.imageSize,
                    height: widget.imageSize,
                    image: AssetImage(
                      'assets/images/game_icons/${widget.imageName}',
                    ),
                  ),
                  if (tappedIndex != null && tappedIndex == index)
                    Center(
                      child: Container(
                        width: widget.imageSize,
                        height: widget.imageSize,
                        color: Colors.green.withOpacity(0.5),
                        child: AnimatedOpacity(
                          opacity: 1.0,
                          duration: const Duration(milliseconds: 500),
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: widget.imageSize * 0.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
