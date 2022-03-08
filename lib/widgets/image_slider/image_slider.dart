import 'package:flutter/material.dart';

import 'image_slider_dots.dart';

///image slider used in post class.
///is a standalone widget so it can be used in other areas of app.
///takes in list of photoUrls and aspect ratio has a default of 4/5.
///This can be changed depending on aspect ratio of images in slider,
///this is so images don't look stretched or compacted.

class ImageSlider extends StatefulWidget {
  final List<String> photoUrls;
  final Color backgroundColor;

  ImageSlider({
    required this.photoUrls,
    this.backgroundColor = Colors.black,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: widget.backgroundColor, //background color of image slider
          ),
          child: PageView.builder(
            //controls swiping along images.
            itemCount: widget.photoUrls.length,
            onPageChanged: (newIndex) {
              setState(() {
                //for rebuilding image slider dots.
                selectedIndex = newIndex;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(
                widget.photoUrls[index],
                frameBuilder: (BuildContext context, Widget child, int? frame,
                    bool wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;
                  return AnimatedOpacity(
                    //smooth fade in
                    child: child,
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                fit: BoxFit.contain,
              );
            },
          ),
        ),
        if (widget.photoUrls.length > 1)
          Positioned(
            top: 0,
            right: 0,
            child: ImageSliderDots(
              //shows which image in list is being shown.
              selectedIndex: selectedIndex,
              photosNum: widget.photoUrls.length,
            ),
          ),
      ],
    );
  }
}
