import 'package:feed_tab_spotlas/constants/keys.dart';
import 'package:feed_tab_spotlas/models/place.dart';
import 'package:feed_tab_spotlas/models/tag.dart';

import 'author.dart';

///object that contains the key data of each post needed to make the feed UI.

class Post {
  final String id;
  final String description; //caption.
  final List<Tag> tags;
  final Place place;
  final Author author;
  final List<String> photoUrls;
  final DateTime createdAt;
  bool isLiked; //liked by user.
  bool saved = false; //saved by user.

  Post.fromJson({required Map<String, dynamic> json})
      : id = json[Keys.idKey],
        description = json[Keys.descriptionKey],
        tags = (json[Keys.tagsKey] as List)
            .map((jsonTag) => Tag.fromJson(json: jsonTag))
            .toList(),
        isLiked = json[Keys.isLikedKey],
        createdAt = DateTime.parse(json[Keys.createdAt]),
        photoUrls = (json[Keys.photoUrls] as List)
            .map((photoUrl) => photoUrl as String)
            .toList(),
        author = Author.fromJson(json: json),
        place = Place.fromJson(json: json);
}
