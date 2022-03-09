import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///alternative widget for caption, using expandable text caption.

class ExpandableCaption extends StatelessWidget {
  final String authorUsername;
  final String description;

  ExpandableCaption({
    required this.authorUsername,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      description,
      expandText: "more",
      collapseText: "less",
      maxLines: 3,
      linkColor: Colors.grey,
      animation: true,
      animationDuration: const Duration(
        seconds: 1,
      ),
      textAlign: TextAlign.left,
      prefixText: authorUsername,
      linkEllipsis: false,
      prefixStyle: Theme.of(context).textTheme.headline1,
      mentionStyle: const TextStyle(
        //alternative text style for mentions in caption.
        color: Colors.blue,
      ),
      onMentionTap: (mention) {},
    );
  }
}
