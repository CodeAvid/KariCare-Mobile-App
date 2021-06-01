import 'package:flutter/material.dart';

const ExtraLargeTextSize = 30.0;
const LargeTextSize = 22.0;
const MediumTextSize = 14.0;
const SmallTextSize = 10.0;

const String FontNameDefault = 'Poppins';
const Color TextColorDark = Colors.black;
const Color TextColorLight = Colors.white;

const DefaultBorderRadius = 10.0;

const AppBarTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: LargeTextSize,
  color: Colors.white,
);

const HeadingTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.bold,
  fontSize: ExtraLargeTextSize,
  color: TextColorDark,
);

const TitleTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.bold,
  fontSize: LargeTextSize,
  color: TextColorDark,
);

const BodyTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: MediumTextSize,
  color: TextColorDark,
);

const CaptionTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: SmallTextSize,
  color: TextColorDark,
);
