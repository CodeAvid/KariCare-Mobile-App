import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kari_care_flutter/models/photo.dart';
import 'package:kari_care_flutter/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class HomeDetailScreen extends StatefulWidget {
  final Photo photo;

  const HomeDetailScreen({
    Key key,
    this.photo,
  }) : super(key: key);

  @override
  _HomeDetailScreenState createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    child: Hero(
                      tag: widget.photo.urls.small,
                      child: CachedNetworkImage(
                        height: MediaQuery.of(context).size.height / 2,
                        width: double.infinity,
                        imageUrl: widget.photo.urls.small,
                        fit: BoxFit.cover,
                        placeholder: (BuildContext context, String text) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            child: Container(
                              height: MediaQuery.of(context).size.height / 2,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40.0,
                    left: 20.0,
                    right: 20.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.arrow_back,
                          ),
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.more_vert,
                          ),
                          color: Colors.white,
                          onPressed: () => print('More'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SocialIcon(
                            icon: FontAwesomeIcons.solidHeart,
                            count: widget.photo.likes),
                        SocialIcon(
                            icon: FontAwesomeIcons.solidComment,
                            count: widget.photo.user.totalCollections),
                        SocialIcon(
                            icon: FontAwesomeIcons.reply,
                            count: widget.photo.user.totalPhotos),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.bookmark,
                          color: Theme.of(context).hoverColor),
                      iconSize: 30.0,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(child: Comment(photo: widget.photo))
        ],
      ),
    );
  }
}
