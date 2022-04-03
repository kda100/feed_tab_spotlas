import 'package:feed_tab_spotlas/models/feed_response.dart';
import 'package:feed_tab_spotlas/providers/feed_provider.dart';
import 'package:feed_tab_spotlas/widgets/post_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../providers/post_UI_provider.dart';

///page where feed containing posts are displayed. The feed is displayed as a list.
///Containing each post widget.
///
/// On initialisation the feed data is downloaded and the page awaits a new Feed Response from the Feed Provider.
/// Then rebuilds the page to present the posts or display an error.

class FeedPage extends StatefulWidget {
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final _controller = ScrollController();
  late FeedProvider feedProvider;
  bool isLoadingMore = false;

  @override
  void initState() {
    feedProvider = Provider.of<FeedProvider>(context, listen: false);
    feedProvider.downloadFeed(); //downloading posts.

    _controller.addListener(() async {
      if (_controller.position.maxScrollExtent == _controller.offset &&
          !isLoadingMore) {
        isLoadingMore = true;
        feedProvider.downloadFeed();
        isLoadingMore = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget scaffoldBody = Provider<PostUIProvider>(
      create: (ctx) => PostUIProvider(deviceSize: MediaQuery.of(context).size),
      child: Selector<FeedProvider, FeedResponse>(
        //rebuilds on Feed response
        selector: (context, feedProvider) => feedProvider.feedResponse,
        builder: (context, feedResponse, _) {
          final FeedResponseType feedResponseType =
              feedResponse.feedResponseType;
          if (feedResponseType == FeedResponseType.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            if (feedResponseType == FeedResponseType.error) {
              Center(
                child: Text(feedResponse.message),
              );
            }
            return ListView.builder(
              //posts.
              cacheExtent: 100,
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              itemCount: feedProvider.numberOfPosts + 1,
              itemBuilder: (context, index) {
                if (index != feedProvider.numberOfPosts) {
                  return PostWidget(
                    //widget is built when user scrolls to it.
                    postViewModel: feedProvider.getPostViewModel(
                      index:
                          index, //uses index of List View to retrieve the required PostViewModel.
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );

    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
          navigationBar: const CupertinoNavigationBar(
            middle: Text(
              "Feed",
            ),
          ),
          body: scaffoldBody),
      material: (_, __) => MaterialScaffoldData(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Feed",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: scaffoldBody,
      ),
    );
  }
}
