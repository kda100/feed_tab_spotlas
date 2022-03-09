// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:front_developer_test/models/author.dart';
import 'package:front_developer_test/models/place.dart';
import 'package:front_developer_test/widgets/profile_pic_avatar.dart';
import 'package:front_developer_test/widgets/top_bottom_headings.dart';

///widget used to display profile information for Place and Author.

class ProfileWidget extends StatelessWidget {
  final String photoUrl; //profile pic Url.
  final Color profilePicBorderColor;
  final String topHeading;
  final String bottomHeading;
  final EdgeInsets padding;

  ProfileWidget.fromAuthor(
      {required Author author,
      this.profilePicBorderColor = Colors.pink,
      this.padding = const EdgeInsets.all(12.0)})
      : photoUrl = author.authorPhotoUrl,
        topHeading = author.authorUsername,
        bottomHeading = author.authorFullName;

  ProfileWidget.fromPlace(
      {required Place place,
      this.profilePicBorderColor = Colors.white,
      this.padding = const EdgeInsets.all(12.0)})
      : photoUrl = place.placeLogoUrl ?? "",
        topHeading = place.placeName,
        bottomHeading =
            "${place.categoryDisplayName} · ${place.placeLocationName}";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 25,
            )
          ],
        ),
        child: Row(
          children: [
            ProfilePicAvatar(
              photoUrl: photoUrl,
              borderColor: profilePicBorderColor,
            ),
            const SizedBox(
              width: 10,
            ),
            TopBottomHeadings(
              topHeading: topHeading,
              bottomHeading: bottomHeading,
            )
          ],
        ),
      ),
    );
  }
}
