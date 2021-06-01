import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBoarder;
  final double width;
  final double height;
  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
    required this.isActive,
    required this.hasBoarder,
    this.width = 15.0,
    this.height = 15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Theme.of(context).indicatorColor,
          child: CircleAvatar(
            radius: hasBoarder ? 17.0 : 20.0,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        isActive
            ? Positioned(
                right: 0.0,
                bottom: 0.0,
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).indicatorColor,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Colors.white),
                  ),
                ),
              )
            : SizedBox.shrink()
      ],
    );
  }
}
