// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///widgets used to represent the top heading and bottom heading of profile

class TopBottomHeadings extends StatelessWidget {
  final String topHeading;
  final String bottomHeading;

  const TopBottomHeadings({
    required this.topHeading,
    required this.bottomHeading,
  });

  static final _shadows = [
    Shadow(
      blurRadius: 20,
      color: Colors.black.withOpacity(0.75),
      offset: const Offset(3, 3),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topHeading,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                shadows: _shadows,
              ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          bottomHeading,
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                shadows: _shadows,
              ),
        ),
      ],
    );
  }
}
