import 'package:feed_tab_spotlas/buttons/like_icon_button.dart';
import 'package:feed_tab_spotlas/models/post_view_model.dart';
import 'package:feed_tab_spotlas/providers/feed_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          "assets/icons/map_border.svg",
          height: iconSize,
          width: iconSize,
        ),
        SvgPicture.asset(
          "assets/icons/speech_bubble_border.svg",
          height: iconSize,
          width: iconSize,
        ),
        Selector<FeedProvider, bool>(
          //rebuilds icon when liking and unliking post.
          selector: (context, _) => postViewModel.isLiked,
          builder: (context, isLiked, _) => LikeIconButton(
              isLiked: isLiked,
              iconSize: iconSize,
              onLike: () {
                feedProvider.likePost(index: postViewModel.index);
              },
              onUnlike: () {
                feedProvider.unlikePost(index: postViewModel.index);
              }),
        ),
        SvgPicture.asset(
          "assets/icons/paper_plane_border.svg",
          height: iconSize,
          width: iconSize,
        ),
      ],
    );
  }
}
