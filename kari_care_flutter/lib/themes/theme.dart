import 'package:flutter/material.dart';
import 'package:kari_care_flutter/themes/text_style.dart';

import 'custom_colors.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: CustomColors.lightBlueColor,
      scaffoldBackgroundColor: CustomColors.backgroundColor,
      primaryColorLight: CustomColors.blueColor,
      primaryColorDark: CustomColors.darkBlueColor,
      secondaryHeaderColor: CustomColors.secondaryColor,
      accentColor: CustomColors.accentColor,
      hoverColor: CustomColors.grey,
      buttonColor: CustomColors.darkGrey,
      fontFamily: FontNameDefault, //3
      textTheme: TextTheme(
        headline1: HeadingTextStyle,
        headline2: TitleTextStyle,
        bodyText1: BodyTextStyle,
        caption: CaptionTextStyle,
      ),
      indicatorColor: CustomColors.lightGrey,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: CustomColors.lightGrey.withOpacity(0.6),
        filled: true,
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: CustomColors.lightBlueColor,
        primaryColorLight: CustomColors.darkBlueColor,
        secondaryHeaderColor: CustomColors.secondaryColor,
        accentColor: CustomColors.accentColor,
        fontFamily: FontNameDefault,
        textTheme: TextTheme(
          headline1: HeadingTextStyle.copyWith(color: Colors.white),
          headline2: TitleTextStyle.copyWith(color: Colors.white),
          bodyText1: BodyTextStyle.copyWith(color: Colors.white),
          caption: CaptionTextStyle.copyWith(color: Colors.white),
        ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          buttonColor: CustomColors.lightGrey,
        ));
  }
}
