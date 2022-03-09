import 'dart:math';

///Helper functions for DateTime object.

class DateTimeHelpers {
  ///takes in a DateTime object and returns a string representation of the time after post.
  ///can return "27 weeks ago", "3 hours ago", "10 secs ago", etc.
  static String getTimeAfterPost({required DateTime createdAt}) {
    final now = DateTime.now();
    final diff = now.millisecondsSinceEpoch - createdAt.millisecondsSinceEpoch;
    if(diff < 1000) { //less than 1 sec
      return "now";
    } else if (diff < 60000) { //less than 1 minute
      final int secs = (diff / 1000).floor();
      return secs > 1 ? "$secs seconds ago" : "$secs second ago";
    } else if (diff < 3600000) { //less than 1 hour
      final int mins = (diff / 60000).floor();
      return mins > 1 ? "$mins minutes ago" : "$mins minute ago";
    } else if (diff < 86400000) { //less than 1 day
      final int hours = (diff / 3600000).floor();
      return hours > 1 ? "$hours hours ago" : "$hours hour ago";
    } else if (diff < 604800000) { // less than 1 week
      final int days = (diff / 86400000).floor();
      return days > 1 ? "$days days ago" : "$days day ago";
    } else { //longer than a week.
      final int weeks = (diff / 604800000).floor();
      return weeks > 1 ? "$weeks weeks ago" : "$weeks week ago";
    }
  }
}
