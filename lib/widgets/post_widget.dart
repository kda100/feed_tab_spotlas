// ignore_for_file: prefer_initializing_formals
import 'package:feed_tab_spotlas/animations/liked_animation.dart';
import 'package:feed_tab_spotlas/buttons/save_icon_button.dart';
import 'package:feed_tab_spotlas/helpers/datetime_helpers.dart';
import 'package:feed_tab_spotlas/models/post_view_model.dart';
import 'package:feed_tab_spotlas/providers/feed_provider.dart';
import 'package:feed_tab_spotlas/widgets/post_tool_bar.dart';
import 'package:feed_tab_spotlas/widgets/profile_widget.dart';
import 'package:feed_tab_spotlas/widgets/tags_list.dart';
import 'package:flutter/material.dart';
import '../providers/post_UI_provider.dart';
import 'captions/custom_caption.dart';
import 'image_slider/image_slider.dart';
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
  late PostUIProvider postUIProvider;
  late FeedProvider feedProvider;

  @override
  void initState() {
    postViewModel = widget.postViewModel;
    postUIProvider = Provider.of<PostUIProvider>(context, listen: false);
    feedProvider = Provider.of<FeedProvider>(context, listen: false);
    super.initState();
  }

  static final decoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.34),
        blurRadius: 25,
      )
    ],
  );

  ///builds animation when double tapped.
  Widget _buildLikedAnimation() {
    if (playLiked) {
      playLiked = false;
      return Center(
        child: LikedAnimation(
          size: postUIProvider.likeAnimationSize,
          milliseconds: 100,
        ),
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
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
                  dotSpacing: postUIProvider.XXS,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: ProfileWidget.fromAuthor(
                  author: postViewModel.author,
                  decoration: decoration,
                ),
              ),
              _buildLikedAnimation(),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileWidget.fromPlace(
                        place: postViewModel.place, decoration: decoration),
                    Padding(
                      padding: EdgeInsets.only(
                        left: postUIProvider.S,
                        right: postUIProvider.L,
                      ),
                      child: DecoratedBox(
                        decoration: decoration,
                        child: Selector<FeedProvider, bool>(
                          selector: (context, _) => postViewModel.isSaved,
                          builder: (context, isSaved, _) => SaveIconButton(
                            iconSize: postUIProvider.iconSize,
                            //rebuilds UI to reflect post being saved.
                            isSaved: isSaved,
                            onSave: () {
                              feedProvider.savePost(index: postViewModel.index);
                            },
                            onUnSave: () {
                              feedProvider.unSavePost(
                                  index: postViewModel.index);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: postUIProvider.M,
            horizontal: postUIProvider.XXL,
          ),
          child: PostToolBar(
            postViewModel: postViewModel,
            iconSize: postUIProvider.iconSize,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: postUIProvider.S,
            right: postUIProvider.S,
            bottom: postUIProvider.XS,
          ),
          child: CustomCaption(
            authorUsername: postViewModel.author.authorUsername,
            description: postViewModel.description,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: postUIProvider.S),
          child: TagsList(
            spacing: postUIProvider.XXS,
            tags: postViewModel.tags,
          ),
        ),
        //could also extract this into a separate widget.
        Padding(
          padding: EdgeInsets.only(
            left: postUIProvider.S,
            right: postUIProvider.S,
            bottom: postUIProvider.L,
            top: postUIProvider.S,
          ),
          child: Text(
            DateTimeHelpers.getTimeAfterPost(
                createdAt: postViewModel.createdAt),
            style: TextStyle(
                color: Colors.grey, fontSize: postUIProvider.bodyTextSize),
          ),
        ),
      ],
    );
  }
}
