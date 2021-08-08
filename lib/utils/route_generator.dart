import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lhu_tibetan_music_app/bloc/auth_cubit.dart';
import 'package:lhu_tibetan_music_app/presentation/screens/home.dart';
import 'package:lhu_tibetan_music_app/presentation/screens/login_page.dart';
import 'package:lhu_tibetan_music_app/presentation/screens/on_boarding_page.dart';
import 'package:lhu_tibetan_music_app/presentation/screens/splash_screen_page.dart';
import 'package:lhu_tibetan_music_app/repository/auth_repository.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => SplashScreenPage());
      case '/on-board':
        return MaterialPageRoute(builder: (_) => OnBoardingPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
