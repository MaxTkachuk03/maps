import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maps/generated/l10n.dart';
import 'package:maps/pages/main_page.dart';
import 'package:maps/pages/screens/login_screen.dart';
import 'package:maps/resourses/colors.dart';
import 'package:maps/resourses/fonts.dart';
import 'package:maps/resourses/icons.dart';
import 'package:maps/services/google_sign_in_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
          _navigateToPage(
            LoginPage.routeName,
          );
      },
    );
    super.initState();
  }

  void _navigateToPage(String route) {
    Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
      route,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: AppColors.gradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).splashScreenText,
              maxLines: 1,
              style: const TextStyle(
                color: AppColors.snowWhite,
                fontWeight: AppFonts.bold,
                fontSize: 50.0,
                fontFamily: AppFonts.fontFamily,
                shadows: [
                  Shadow(
                    offset: Offset(0, 4),
                    blurRadius: 11.0,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            SvgPicture.asset(
              AppIcons.geo,
              color: AppColors.indigo,
            ),
          ],
        ),
      ),
    );
  }
}
