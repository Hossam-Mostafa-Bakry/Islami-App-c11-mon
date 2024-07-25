import 'package:flutter/material.dart';
import 'package:islami_app_c11_mon/core/theme/application_theme_data.dart';
import 'package:islami_app_c11_mon/layout/layout_view.dart';
import 'package:islami_app_c11_mon/moduls/splash/splash_view.dart';

// 1- read data from assets
// 2- localization (ar - en)
// 3- theme dark and light
// 4- state management

// 1- versioned files
// 2- unVersioned files
// 3- commit

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami App',
      theme: ApplicationThemeManager.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        LayOutView.routeName: (context) => const LayOutView(),
      },
    );
  }
}
