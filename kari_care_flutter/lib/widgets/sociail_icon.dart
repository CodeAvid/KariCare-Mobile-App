import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final int count;

  const SocialIcon({
    Key key,
    @required this.icon,
    @required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 25.0,
            color: Theme.of(context).hoverColor,
          ),
          SizedBox(width: 10.0),
          Text(
            count.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Theme.of(context).hoverColor),
          )
        ],
      ),
    );
  }
}
