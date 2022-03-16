import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///like icon button used for tool bar.

class LikeIconButton extends StatelessWidget {
  double iconSize;
  bool isLiked;
  void Function()
      onLike; //separate functions so specific things can happen in each case.
  void Function() onUnlike;

  LikeIconButton({
    this.iconSize = 30,
    required this.isLiked,
    required this.onLike,
    required this.onUnlike,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isLiked) {
          onLike();
        } else {
          onUnlike();
        }
      },
      child: isLiked
          ? SvgPicture.asset(
              "assets/icons/heart.svg",
              color: Colors.red,
              width: iconSize,
              height: iconSize,
            )
          : SvgPicture.asset(
              "assets/icons/heart_border.svg",
              color: Colors.black,
              width: iconSize,
              height: iconSize,
            ),
    );
  }
}
