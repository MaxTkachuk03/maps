import 'package:flutter/material.dart';
import 'package:maps/pages/main_page.dart';
import 'package:maps/pages/screens/login_screen.dart';
import 'package:maps/pages/screens/main_view.dart';
import 'package:maps/pages/screens/profile_screen.dart';

class AppRouter {
  const AppRouter._();

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    //final Object? argument = settings.arguments;

    switch (settings.name) {
      case LoginPage.routeName:
        builder = (_) => const LoginPage();
        break;
      case MainPage.routeName:
        builder = (_) => const MainPage();
        break;
      case Profile.routeName:
        builder = (_) => const Profile();
        break;
      case MainView.routeName:
        builder = (_) => const MainView();
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }
    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}