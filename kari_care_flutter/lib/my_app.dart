import 'package:flutter/material.dart';
import 'package:kari_care_flutter/routes/routes.dart';
import 'package:kari_care_flutter/themes/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kari Care',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      onGenerateRoute: routes(),
    );
  }
}
