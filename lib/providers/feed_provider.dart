import 'package:feed_tab_spotlas/models/feed_response.dart';
import 'package:feed_tab_spotlas/models/post_view_model.dart';
import 'package:feed_tab_spotlas/repositories/feed_repository.dart';
import 'package:flutter/material.dart';

///Provider aims to link the widgets to the data management and business logic.
///It takes in user events then communicates to the Feed Repository to make updates to or gets info from the data.
///Then notifies the UI to update when these changes have been made.

class FeedProvider with ChangeNotifier {
  final FeedRepository _feedRepository = FeedRepository();
  FeedResponse feedResponse = FeedResponse.loading();

  int get numberOfPosts => _feedRepository.numberOfPosts;

  Future<void> downloadFeed() async {
    feedResponse = await _feedRepository.downloadFeed();
    notifyListeners();
  }

  Future<void> refreshFeed() async {
    feedResponse = FeedResponse.loading();
    notifyListeners();
    feedResponse = await _feedRepository.refreshFeed();
    notifyListeners();
  }

  PostViewModel getPostViewModel({required int index}) {
    return PostViewModel(
      index: index,
      post: _feedRepository.getPost(index: index),
    );
  }

  ///likePost and UnlikePost separated so specific code for each action can be added.
  void likePost({required int index}) {
    _feedRepository.likePost(index: index);
    notifyListeners();
  }

  void unlikePost({required int index}) {
    _feedRepository.unlikePost(index: index);
    notifyListeners();
  }

  ///savePost and UnSavePost separated so specific code for each action can be added.
  void savePost({required int index}) {
    _feedRepository.savePost(index: index);
    notifyListeners();
  }

  void unSavePost({required int index}) {
    _feedRepository.unSavePost(index: index);
    notifyListeners();
  }
}
