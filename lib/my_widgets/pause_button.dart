import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PauseButton extends StatelessWidget {
  const PauseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          context.go('/');
        },
        child: const Image(
          fit: BoxFit.fill,
          width: 50,
          height: 50,
          image: AssetImage(
            'assets/images/button_pause.png',
          ),
        ),
      ),
    );
  }
}
