// ignore_for_file: prefer_initializing_formals
import 'package:flutter/material.dart';
import 'package:front_developer_test/animations/liked_animation.dart';
import 'package:front_developer_test/buttons/save_icon_button.dart';
import 'package:front_developer_test/helpers/datetime_helpers.dart';
import 'package:front_developer_test/models/post_view_model.dart';
import 'package:front_developer_test/providers/feed_provider.dart';
import 'captions/custom_caption.dart';
import 'image_slider/image_slider.dart';
import 'package:front_developer_test/widgets/post_tool_bar.dart';
import 'package:front_developer_test/widgets/profile_widget.dart';
import 'package:front_developer_test/widgets/tags_list.dart';
import 'package:provider/provider.dart';

///post widget that holds all the widgets needed to make the UI for each post.
///It holds the image slider, place and author profile, save button
///tool bar, caption and time after post.
///It uses the feed provider to rebuild save icon when post has been saved.

class PostWidget extends StatefulWidget {
  final PostViewModel postViewModel;

  PostWidget({required this.postViewModel})
      : super(key: ValueKey(postViewModel.id));

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool playLiked = false;
  late PostViewModel postViewModel;

  @override
  void initState() {
    postViewModel = widget.postViewModel;
    super.initState();
  }

  ///builds animation when double tapped.
  Widget _buildLikedAnimation() {
    if (playLiked) {
      playLiked = false;
      return Center(
        child: LikedAnimation(
          size: 100,
          milliseconds: 100,
        ),
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    final FeedProvider feedProvider =
        Provider.of<FeedProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width *
              5 /
              4, //aspect ratio of images
          child: Stack(
            children: [
              GestureDetector(
                //controls like action on double tap.
                onDoubleTap: () {
                  setState(() {
                    playLiked = true;
                    feedProvider.likePost(
                      index: postViewModel.index,
                    );
                  });
                },
                child: ImageSlider(
                  //post images
                  photoUrls: postViewModel.photoUrls,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: ProfileWidget.fromAuthor(
                  author: postViewModel.author,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: ProfileWidget.fromPlace(
                  place: postViewModel.place,
                ),
              ),
              _buildLikedAnimation(),
              Positioned(
                bottom: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          blurRadius: 25,
                        )
                      ],
                    ),
                    child: Selector<FeedProvider, bool>(
                      selector: (context, _) => postViewModel.isSaved,
                      builder: (context, isSaved, _) => SaveIconButton(
                        //rebuilds UI to reflect post being saved.
                        isSaved: isSaved,
                        onSave: () {
                          feedProvider.savePost(index: postViewModel.index);
                        },
                        onUnSave: () {
                          feedProvider.unSavePost(index: postViewModel.index);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        PostToolBar(
          postViewModel: postViewModel,
        ),
        CustomCaption(
          authorUsername: postViewModel.author.authorUsername,
          description: postViewModel.description,
        ),
        TagsList(
          tags: postViewModel.tags,
        ),
        //could also extract this into a separate widget.
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            DateTimeHelpers.getTimeAfterPost(
                createdAt: postViewModel.createdAt),
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
