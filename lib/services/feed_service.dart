import 'dart:convert';

import 'package:front_developer_test/services/status_codes.dart';
import 'package:http/http.dart' as http;

///Feed service that contains functions to make API calls to database
///to do different requests such as get and post.
///This class returns the data to the Feed Repository for data manipulation.

class FeedService {
  final String _url =
      "http://161.35.162.216:1210/interview/home/reel?lat=51.5&lon=-0.17&page=1";

  ///makes a request to get feed data, it can return a json object or a null object.
  ///It is possible to return responses for each specific response status code.
  ///But client only needs to know whether the response has been successful or failed.
  Future<dynamic> getFeedJson() async {
    final http.Response response = await http.get(Uri.parse(_url));
    final int statusCode = response.statusCode;
    if (statusCode == StatusCodes.success) {
      return jsonDecode(response.body);
    }
    print(response.statusCode);
    return null;
  }
}
