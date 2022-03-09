import 'package:flutter/material.dart';
import 'package:front_developer_test/models/feed_response.dart';
import 'package:front_developer_test/providers/feed_provider.dart';
import 'package:front_developer_test/widgets/post_widget.dart';
import 'package:provider/provider.dart';

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
  late FeedProvider feedProvider;

  @override
  void initState() {
    feedProvider = Provider.of<FeedProvider>(context, listen: false);
    feedProvider.downloadFeed(); //downloading posts.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Feed",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Selector<FeedProvider, FeedResponse>(
        //rebuilds on Feed response
        selector: (context, feedProvider) => feedProvider.feedResponse,
        builder: (context, feedResponse, _) {
          final FeedResponseType feedResponseType =
              feedResponse.feedResponseType;
          if (feedResponseType == FeedResponseType.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (feedResponseType == FeedResponseType.error) {
            Center(
              child: Text(feedResponse.message),
            );
          }
          return ListView.builder(
            //posts.
            itemCount: feedProvider.numberOfPosts,
            itemBuilder: (context, index) {
              return PostWidget(
                //widget is built when user scrolls to it.
                postViewModel: feedProvider.getPostViewModel(
                  index:
                      index, //uses index of List View to retrieve the required PostViewModel.
                ),
              );
            },
          );
        },
      ),
    );
  }
}
