// ignore_for_file: prefer_final_fields

enum FeedResponseType {
  loading,
  success,
  error,
}

///class representing response, when client makes a request to feed API.
///it contains a message and a feed response type.
class FeedResponse {
  final FeedResponseType feedResponseType;
  String _message = "";

  FeedResponse.success() : feedResponseType = FeedResponseType.success;

  FeedResponse.error()
      : feedResponseType = FeedResponseType.error,
        _message = "An error has occurred";

  FeedResponse.loading() : feedResponseType = FeedResponseType.loading;

  String get message => _message;
}
