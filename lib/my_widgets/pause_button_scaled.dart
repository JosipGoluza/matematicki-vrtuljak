import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PauseButtonScaled extends StatelessWidget {
  double size;

  PauseButtonScaled({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          context.go('/');
        },
        child: Image(
          fit: BoxFit.fill,
          width: size,
          height: size,
          image: const AssetImage(
            'assets/images/button_pause.png',
          ),
        ),
      ),
    );
  }
}
