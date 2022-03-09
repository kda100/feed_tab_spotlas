// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:front_developer_test/models/author.dart';
import 'package:front_developer_test/models/place.dart';
import 'package:front_developer_test/widgets/profile_pic_avatar.dart';
import 'package:front_developer_test/widgets/top_bottom_headings.dart';

///widget used to display profile information for Place and Author.
///can be re-used in other areas of app.

class ProfileWidget extends StatelessWidget {
  final String? profilePicUrl; //profile pic Url.
  final double? profilePicSize;
  final Color? profilePicBorderColor;
  final String topHeading;
  final String bottomHeading;
  final TextStyle? topHeadingStyle;
  final TextStyle? bottomHeadingStyle;
  final EdgeInsets? padding;
  final Decoration? decoration;
  final Widget profilePicPlaceHolder;

  ProfileWidget.fromAuthor({
    required Author author,
    this.profilePicBorderColor = Colors.pink,
    this.padding = EdgeInsets.zero,
    this.topHeadingStyle,
    this.bottomHeadingStyle,
    this.decoration,
    this.profilePicPlaceHolder = const Icon(Icons.person),
    this.profilePicSize,
  })  : profilePicUrl = author.authorPhotoUrl,
        topHeading = author.authorUsername,
        bottomHeading = author.authorFullName;

  ProfileWidget.fromPlace({
    required Place place,
    this.profilePicBorderColor = Colors.white,
    this.padding = EdgeInsets.zero,
    this.topHeadingStyle,
    this.bottomHeadingStyle,
    this.decoration,
    this.profilePicPlaceHolder = const Icon(Icons.restaurant),
    this.profilePicSize,
  })  : profilePicUrl = place.placeLogoUrl ?? "",
        topHeading = place.placeName,
        bottomHeading =
            "${place.categoryDisplayName} · ${place.placeLocationName}";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: decoration,
      child: Row(
        children: [
          ProfilePicAvatar(
            photoUrl: profilePicUrl,
            borderColor: profilePicBorderColor,
            placeHolder: profilePicPlaceHolder,
            innerRadius: profilePicSize,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
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
          )
        ],
      ),
    );
  }
}
