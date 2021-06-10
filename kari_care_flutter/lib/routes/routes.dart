import 'package:flutter/material.dart';
import 'package:kari_care_flutter/screens/screens.dart';
import 'package:kari_care_flutter/screens/tab_screen.dart';

const TabScreenRoute = "/";
const HomeScreenRoute = "/home";
const HomeDetailScreenRoute = "/home/detail";
const ProfileScreenRoute = "/profile";

RouteFactory routes() {
  return (settings) {
    final Map<String, dynamic> aguments = settings.arguments;
    Widget screen;
    switch (settings.name) {
      case TabScreenRoute:
        screen = TabScreen();
        break;
      case HomeScreenRoute:
        screen = HomeScreen();
        break;
      case HomeDetailScreenRoute:
        screen = HomeDetailScreen(photo: aguments['photo']);
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
