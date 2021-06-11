import 'package:flutter/material.dart';
import 'package:kari_care_flutter/helpers/color_helper.dart';
import 'package:kari_care_flutter/models/photo.dart';
import 'package:kari_care_flutter/themes/text_style.dart';
import 'package:kari_care_flutter/widgets/profile_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ActiveUser extends StatelessWidget {
  final List<Photo> photos;

  const ActiveUser({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 7,
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: photos.length,
            itemBuilder: (BuildContext context, int index) {
              Photo photo = photos[index];
              return GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 11,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10.0)),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(DefaultBorderRadius),
                              child: CachedNetworkImage(
                                imageUrl: photo.urls.small,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ProfileAvatar(
                                  imageProvider: CachedNetworkImageProvider(
                                    photo.user.profileImage.medium,
                                  ),
                                  radius:
                                      MediaQuery.of(context).size.width / 25,
                                  hasBoarder: true,
                                  boarderColor: HexColor(photo.color),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  child: Text(
                                    photo.user.name,
                                    style: Theme.of(context).textTheme.caption,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 10.0,
                        right: 10.0,
                        child: Container(
                          height: 15.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          child: Icon(
                            Icons.videocam,
                            size: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
