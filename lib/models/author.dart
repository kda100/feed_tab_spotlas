import 'package:feed_tab_spotlas/constants/keys.dart';

///object representing information on Author of each post.

class Author {
  final String authorUsername;
  final String authorFullName;
  final String authorPhotoUrl;

  Author.fromJson({
    required Map<String, dynamic> json,
  })  : authorUsername = json[Keys.authorUsername],
        authorFullName = json[Keys.authorFullNameKey],
        authorPhotoUrl = json[Keys.authorPhotoUrl];
}
