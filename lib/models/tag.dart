import 'package:feed_tab_spotlas/constants/keys.dart';

///class containing the data for each tag contained within the post.

class Tag {
  final int id;
  final String name;

  Tag.fromJson({required Map<String, dynamic> json})
      : id = json[Keys.idKey],
        name = json[Keys.nameKey];
}
