import 'package:flutter/material.dart';
import 'package:kari_care_flutter/helpers/color_helper.dart';
import 'package:kari_care_flutter/models/photo.dart';
import 'widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Comment extends StatefulWidget {
  final Photo photo;

  const Comment({
    Key key,
    @required this.photo,
  }) : super(key: key);
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final defaultComment =
      'Wow! Just amazing. I love your profile content. Look forward to see more.Well done!';
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            ProfileAvatar(
              imageProvider: CachedNetworkImageProvider(
                  widget.photo.user.profileImage.medium),
              radius: MediaQuery.of(context).size.width / 15,
              hasBoarder: true,
              boarderColor: HexColor(widget.photo.color),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              width: 3.5 * MediaQuery.of(context).size.width / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 2.5 * MediaQuery.of(context).size.width / 5,
                        child: Text(
                          widget.photo.user.name,
                          style: Theme.of(context).textTheme.headline2.copyWith(
                                fontSize: 16.0,
                                color: Theme.of(context).hoverColor,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '8h ago',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 16.0, color: Colors.grey[400]),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Text(
                    defaultComment,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 12.0,
                          color: Theme.of(context).hoverColor,
                        ),
                  ),
                ],
              ),
            )
          ],
        );
      },
      itemCount: 2,
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }
}
