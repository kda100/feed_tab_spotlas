import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return IconButton(
      onPressed: () {
        if (!isLiked) {
          onLike();
        } else {
          onUnlike();
        }
      },
      icon: Icon(
        isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
      ),
      color: isLiked ? Colors.red : Colors.black,
      splashColor: Colors.transparent,
      padding: EdgeInsets.zero,
      highlightColor: Colors.transparent,
      iconSize: iconSize,
    );
  }
}
