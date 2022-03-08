import 'dart:math';

///Helper functions for DateTime object.

class DateTimeHelpers {
  ///takes in a DateTime object and returns a string representation of the time after post.
  ///can return "27 weeks ago" or "3 hours ago".
  static String getTimeAfterPost({required DateTime createdAt}) {
    final now = DateTime.now();
    final diff = now.millisecondsSinceEpoch - createdAt.millisecondsSinceEpoch;
    if (diff < 60000) {
      final int secs = (diff / 1000).ceil();
      return "$secs seconds ago";
    } else if (diff < 3600000) {
      final int mins = (diff / 60000).ceil();
      return "$mins minutes ago";
    } else if (diff < 86400000) {
      final int hours = (diff / 3600000).floor();
      return "$hours hours ago";
    } else if (diff < 604800000) {
      final int days = (diff / 86400000).floor();
      return "$days days ago";
    } else {
      final int weeks = (diff / 604800000).floor();
      return "$weeks weeks ago";
    }
  }
}
