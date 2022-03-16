// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:front_developer_test/models/author.dart';
import 'package:front_developer_test/models/place.dart';
import 'package:front_developer_test/providers/post_layout_provider.dart';
import 'package:front_developer_test/widgets/profile_pic_avatar.dart';
import 'package:provider/provider.dart';

///widget used to display profile information for Place and Author.
///can be re-used in other areas of app.

class ProfileWidget extends StatelessWidget {
  final String? profilePicUrl; //profile pic Url.
  final Color? profilePicBorderColor;
  final String topHeading;
  final String bottomHeading;
  final Decoration? decoration;
  final Widget profilePicPlaceHolder;

  ProfileWidget.fromAuthor({
    required Author author,
    this.profilePicBorderColor = Colors.pink,
    this.decoration,
    this.profilePicPlaceHolder = const Icon(Icons.person),
  })  : profilePicUrl = author.authorPhotoUrl,
        topHeading = author.authorUsername,
        bottomHeading = author.authorFullName;

  static final headingShadows = [
    Shadow(
      blurRadius: 10,
      color: Colors.black.withOpacity(0.75),
      offset: const Offset(3, 3),
    ),
  ];

  ProfileWidget.fromPlace({
    required Place place,
    this.profilePicBorderColor = Colors.white,
    this.decoration,
    this.profilePicPlaceHolder = const Icon(Icons.restaurant),
  })  : profilePicUrl = place.placeLogoUrl ?? "",
        topHeading = place.placeName,
        bottomHeading =
            "${place.categoryDisplayName} · ${place.placeLocationName}";

  @override
  Widget build(BuildContext context) {
    final PostLayoutProvider postLayoutProvider =
        Provider.of<PostLayoutProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(
        left: postLayoutProvider.S,
        bottom: postLayoutProvider.S,
        top: postLayoutProvider.S,
      ),
      child: DecoratedBox(
        decoration: decoration ?? const BoxDecoration(),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: postLayoutProvider.S,
              ),
              child: ProfilePicAvatar(
                photoUrl: profilePicUrl,
                borderColor: profilePicBorderColor,
                placeHolder: profilePicPlaceHolder,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topHeading,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: headingShadows,
                  ),
                ),
                SizedBox(
                  height: postLayoutProvider.XXXS,
                ),
                Text(
                  bottomHeading,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    shadows: headingShadows,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
