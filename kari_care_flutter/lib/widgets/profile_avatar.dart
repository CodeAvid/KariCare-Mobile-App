import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final Object imageProvider;
  final double radius;
  final bool hasBoarder;
  final Color boarderColor;

  const ProfileAvatar({
    @required this.imageProvider,
    @required this.radius,
    this.hasBoarder = false,
    this.boarderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: boarderColor,
          child: CircleAvatar(
            radius: hasBoarder ? radius - 3 : radius,
            backgroundColor: Colors.grey[200],
            backgroundImage: imageProvider,
          ),
        ),
      ],
    );
  }
}
