// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

///widget used to display profile pics.
/// can be re-used in other areas of app.

class ProfilePicAvatar extends StatelessWidget {
  final String? photoUrl;
  final double innerRadius; //size of profile pic.
  final Color? borderColor;
  final Widget placeHolder;

  ProfilePicAvatar({
    this.photoUrl,
    this.innerRadius = 30,
    this.borderColor,
    this.placeHolder = const Icon(Icons.broken_image),
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: innerRadius * 1.10, // for border.
      backgroundColor: borderColor ?? Theme.of(context).primaryColor,
      child: CircleAvatar(
        radius: innerRadius,
        child: ClipOval(
          child: photoUrl != null
              ? Image.network(
                  photoUrl!,
                  errorBuilder: (context, _, __) {
                    return placeHolder;
                  },
                )
              : placeHolder,
        ),
      ),
    );
  }
}
