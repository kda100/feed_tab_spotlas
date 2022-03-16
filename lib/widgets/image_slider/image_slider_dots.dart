import 'package:flutter/material.dart';

///Dots used to represent which image is being displayed in image slider widget.
///dots are displayed as a row of dots.
///an enlarged that is used to indicate which photo in the list is being presented.
///when image is changed adjacent dot is animated to an enlarged size whilst other dot is shrunk.

class ImageSliderDots extends StatelessWidget {
  final int selectedIndex;
  final int photosNum;
  final double _sizeNeeded;

  ImageSliderDots({required this.selectedIndex, required this.photosNum})
      : _sizeNeeded = _largeDotSize +
            ((photosNum - 1) * _smallDotSize) +
            (photosNum * _padding * 2);
  // creates size of box needs to hold dots.

  static const double _largeDotSize = 12.0;

  static const double _smallDotSize = 4.0;

  static const double _padding = 4;

  static final BoxDecoration _boxDecoration = BoxDecoration(
    //widget for each dot.
    color: Colors.white,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.75),
        blurRadius: 15,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: _sizeNeeded,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            // num dots depends on num photos.
            photosNum,
            (index) {
              return AnimatedContainer(
                alignment: Alignment.center,
                duration: const Duration(milliseconds: 200),
                width: selectedIndex == index ? _largeDotSize : _smallDotSize,
                height: selectedIndex == index ? _largeDotSize : _smallDotSize,
                decoration: _boxDecoration,
                padding: const EdgeInsets.all(_padding),
              );
            },
          ),
        ),
      ),
    );
  }
}
