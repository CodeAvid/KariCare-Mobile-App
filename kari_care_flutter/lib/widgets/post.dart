import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kari_care_flutter/models/photo.dart';
import 'package:kari_care_flutter/routes/routes.dart';
import 'package:kari_care_flutter/themes/text_style.dart';
import 'package:kari_care_flutter/widgets/profile_avatar.dart';
import 'package:kari_care_flutter/widgets/sociail_icon.dart';
import 'package:shimmer/shimmer.dart';

class Post extends StatelessWidget {
  final Photo photo;
  final isLoading;

  const Post({
    Key key,
    @required this.photo,
    this.isLoading = false,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, HomeDetailScreenRoute,
          arguments: {'photo': photo}),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DefaultBorderRadius),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    isLoading
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width / 15,
                              backgroundColor: Colors.grey[200],
                            ),
                          )
                        : ProfileAvatar(
                            imageProvider: CachedNetworkImageProvider(
                                photo.user.profileImage.medium),
                            radius:
                                (MediaQuery.of(context).size.width / 15).abs(),
                            hasBoarder: false,
                          ),
                    isLoading
                        ? Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            width:
                                (MediaQuery.of(context).size.width - 170).abs(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[300],
                                  highlightColor: Colors.grey[100],
                                  child: Container(
                                      height: 16.0, color: Colors.grey[300]),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[300],
                                  highlightColor: Colors.grey[100],
                                  child: Container(
                                      height: 16.0, color: Colors.grey[300]),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            width:
                                (MediaQuery.of(context).size.width - 170).abs(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  photo.user.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  photo.user.location ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                        color: Theme.of(context).buttonColor,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
                isLoading
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey[300],
                        highlightColor: Colors.grey[100],
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.grey[300],
                          size: 30.0,
                        ),
                      )
                    : IconButton(
                        icon: Icon(Icons.more_vert),
                        iconSize: 30.0,
                        color: Theme.of(context).primaryColorDark,
                        onPressed: () {},
                      )
              ],
            ),
            isLoading
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      child: Container(
                        height: MediaQuery.maybeOf(context).size.height / 5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(
                            DefaultBorderRadius,
                          ),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        DefaultBorderRadius,
                      ),
                      child: Stack(
                        children: [
                          Hero(
                              tag: photo.urls.small,
                              child: CachedNetworkImage(
                                height:
                                    MediaQuery.maybeOf(context).size.height / 4,
                                width: double.infinity,
                                imageUrl: photo.urls.small,
                                fit: BoxFit.cover,
                                placeholder:
                                    (BuildContext context, String text) {
                                  return Container(
                                    height: MediaQuery.maybeOf(context)
                                            .size
                                            .height /
                                        5,
                                    width: double.infinity,
                                    color: Colors.grey[300],
                                  );
                                },
                              )),
                          Positioned(
                            right: 0.0,
                            top: 0.0,
                            child: IconButton(
                              icon: Icon(
                                Icons.bookmark_outline,
                                color: Colors.white,
                              ),
                              iconSize: 30.0,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            isLoading
                ? SizedBox.shrink()
                : Row(
                    children: [
                      SocialIcon(
                          icon: FontAwesomeIcons.solidHeart,
                          count: photo.likes),
                      SocialIcon(
                          icon: FontAwesomeIcons.solidComment,
                          count: photo.user.totalCollections),
                      SocialIcon(
                          icon: FontAwesomeIcons.reply,
                          count: photo.user.totalPhotos),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
