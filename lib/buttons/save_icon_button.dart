import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///save icon used for tool bar.

class SaveIconButton extends StatelessWidget {
  double iconSize;
  bool isSaved;
  void Function()
      onSave; //separate functions so specific things can happen in each case.
  void Function() onUnSave;

  SaveIconButton({
    this.iconSize = 30,
    required this.isSaved,
    required this.onSave,
    required this.onUnSave,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (!isSaved) {
          onSave();
        } else {
          onUnSave();
        }
      },
      icon: Icon(
        isSaved ? CupertinoIcons.star_fill : CupertinoIcons.star,
      ),
      color: isSaved ? Colors.yellow : Colors.white,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      padding: EdgeInsets.zero,
      iconSize: iconSize,
    );
  }
}
