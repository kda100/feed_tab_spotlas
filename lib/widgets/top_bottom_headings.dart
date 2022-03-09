// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///widgets used to represent the top heading and bottom heading of profile
///can be re-used in other areas of app.

class TopBottomHeadings extends StatelessWidget {
  final String topHeading;
  final String bottomHeading;
  final TextStyle? topHeadingStyle;
  final TextStyle? bottomHeadingStyle;

  const TopBottomHeadings({
    required this.topHeading,
    required this.bottomHeading,
    this.topHeadingStyle,
    this.bottomHeadingStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topHeading,
          style: topHeadingStyle ?? Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          bottomHeading,
          style: bottomHeadingStyle ?? Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}
