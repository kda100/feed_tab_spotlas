import 'package:feed_tab_spotlas/models/place.dart';
import 'package:feed_tab_spotlas/models/post.dart';
import 'package:feed_tab_spotlas/models/tag.dart';

import 'author.dart';

///Model used by view in obtaining data for each post for the feed UI.
///it restricts ability of view to be able to change element within the post model.

class PostViewModel {
  final int index;
  final Post _post;

  PostViewModel({
    required this.index,
    required Post post,
  }) : _post = post;

  String get id => _post.id;

  String get description => _post.description;

  List<Tag> get tags => _post.tags;

  Place get place => _post.place;

  Author get author => _post.author;

  List<String> get photoUrls => _post.photoUrls;

  DateTime get createdAt => _post.createdAt;

  bool get isLiked => _post.isLiked;

  bool get isSaved => _post.saved;
}
