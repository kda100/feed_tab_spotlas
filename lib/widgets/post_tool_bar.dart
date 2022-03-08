import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:front_developer_test/buttons/like_icon_button.dart';
import 'package:front_developer_test/models/post_view_model.dart';
import 'package:front_developer_test/providers/feed_provider.dart';
import 'package:provider/provider.dart';

///Widget for tool bar of each post, as a row of icons and icon buttons.
///Uses the postViewModel and FeedProvider to control state of widget when liking and unliking.

class PostToolBar extends StatelessWidget {
  final PostViewModel postViewModel;
  final double iconSize;

  PostToolBar({required this.postViewModel, this.iconSize = 30});

  @override
  Widget build(BuildContext context) {
    final FeedProvider feedProvider =
        Provider.of<FeedProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          CupertinoIcons.map,
          size: iconSize,
        ),
        Icon(
          CupertinoIcons.conversation_bubble,
          size: iconSize,
        ),
        Selector<FeedProvider, bool>(
          //rebuilds icon when liking and unliking post.
          selector: (context, _) => postViewModel.isLiked,
          builder: (context, isLiked, _) => LikeIconButton(
              isLiked: isLiked,
              onLike: () {
                feedProvider.likePost(index: postViewModel.index);
              },
              onUnlike: () {
                feedProvider.unlikePost(index: postViewModel.index);
              }),
        ),
        Icon(
          CupertinoIcons.paperplane,
          size: iconSize,
        ),
      ],
    );
  }
}
