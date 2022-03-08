import 'package:flutter/material.dart';

///Wigdet containing caption.
///It shows the username of author and the description of the post.
///can control the max number of lines shown on initialisation of post.
///user can expand the caption to see remaining text.

class CustomCaption extends StatefulWidget {
  final String authorUsername;
  final String description;
  final int maxLines;
  final EdgeInsets padding;

  CustomCaption({
    required this.authorUsername,
    required this.description,
    this.padding = const EdgeInsets.all(8.0),
    this.maxLines = 3,
  });

  @override
  _CustomCaptionState createState() => _CustomCaptionState();
}

class _CustomCaptionState extends State<CustomCaption> {
  bool expanded = false;
  late TextSpan textSpan;

  @override
  void initState() {
    textSpan = TextSpan(
      //username with description.
      children: [
        TextSpan(
          text: "${widget.authorUsername} ",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: "${widget.description}",
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final TextPainter textPainter = TextPainter(
              //used for dimensions of text on screen
              maxLines: widget.maxLines,
              textDirection: TextDirection.rtl,
              text: textSpan)
            ..layout(
              minWidth: constraints.minWidth,
              maxWidth: constraints.maxWidth,
            );
          if (textPainter.didExceedMaxLines) {
            return AnimatedSize(
              //username and description with expanding more or less button.
              duration: const Duration(milliseconds: 200),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    maxLines: expanded ? null : widget.maxLines,
                    text: textSpan,
                  ),
                  GestureDetector(
                    child: Text(
                      expanded ? "less.." : "more..",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                  ),
                ],
              ),
            );
          }
          return RichText(
            //just username and description.
            text: textSpan,
          );
        },
      ),
    );
  }
}
