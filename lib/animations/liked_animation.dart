import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Animation that pops up a heart then disappears.
///used for post widget.

class LikedAnimation extends StatelessWidget {
  final double size;
  final int milliseconds; //expansion time of animation.

  LikedAnimation({required this.milliseconds, required this.size});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: milliseconds + 1000)),
      builder: (context, delay) {
        if (delay.connectionState == ConnectionState.waiting) {
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: size),
            duration: Duration(milliseconds: milliseconds),
            builder: (context, double val, _) {
              return Icon(
                CupertinoIcons.heart_fill,
                size: val,
                color: Colors.red,
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
