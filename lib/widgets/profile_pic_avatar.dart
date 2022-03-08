// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

///widget used to display profile pics.
class ProfilePicAvatar extends StatelessWidget {
  final String photoUrl;
  final double innerRadius; //size of profile pic.
  final Color? borderColor;

  ProfilePicAvatar({
    required this.photoUrl,
    this.innerRadius = 30,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: innerRadius * 1.10, // for border.
      backgroundColor: borderColor ?? Theme.of(context).primaryColor,
      child: CircleAvatar(
        radius: innerRadius,
        child: ClipOval(
          child: Image.network(
            photoUrl,
            errorBuilder: (context, _, __) {
              return const Icon(Icons.broken_image);
            },
          ),
        ),
      ),
    );
  }
}
