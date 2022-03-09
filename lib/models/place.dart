import 'package:front_developer_test/constants/keys.dart';

///object representing place where each post was taken.

class Place {
  final String placeName;
  final String placeLocationName;
  final String categoryDisplayName;
  final String? placeLogoUrl;

  Place.fromJson({required Map<String, dynamic> json})
      : placeName = json[Keys.placeNameKey],
        placeLocationName = json[Keys.placeLocationNameKey],
        categoryDisplayName = json[Keys.categoryDisplayNameKey],
        placeLogoUrl = json[Keys.placeLogoUrlKey];
}
