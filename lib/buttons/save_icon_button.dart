import 'package:flutter_svg/flutter_svg.dart';
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
    return GestureDetector(
      onTap: () {
        if (!isSaved) {
          onSave();
        } else {
          onUnSave();
        }
      },
      child: isSaved
          ? SvgPicture.asset(
              "assets/icons/star.svg",
              color: Colors.yellow,
              width: iconSize,
              height: iconSize,
            )
          : SvgPicture.asset(
              "assets/icons/star_border.svg",
              color: Colors.white,
              width: iconSize,
              height: iconSize,
            ),
    );
  }
}
