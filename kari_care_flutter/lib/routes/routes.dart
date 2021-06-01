import 'package:flutter/material.dart';
import 'package:kari_care_flutter/screens/screens.dart';

const HomeScreenRoute = "/";
const ProfileScreenRoute = "/profile";

RouteFactory routes() {
  return (settings) {
    Widget screen;

    switch (settings.name) {
      case HomeScreenRoute:
        screen = HomeScreen();
        break;
      case ProfileScreenRoute:
        screen = ProfileScreen();
        break;
      default:
        return null;
    }
    return MaterialPageRoute(builder: ((_) => screen));
  };
}
