import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matematicki_vrtuljak/util/language_constants.dart';

Widget aboutCloseButton(
  BuildContext context,
  double width,
  double height,
  double fontSize,
) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/pause_dialog/button_grey.png'),
        fit: BoxFit.fill,
      ),
    ),
    width: width,
    height: height,
    child: TextButton(
      onPressed: () {
        context.go('/');
      },
      child: Padding(
        padding: EdgeInsets.only(
            bottom: height * 0.05,
            ),
        child: AutoSizeText(
          translation(context).aboutClose,
          maxLines: 1,
          style: TextStyle(
            color: Colors.black, // Text color
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
      ),
    ),
  );
}
