import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maps/generated/l10n.dart';
import 'package:maps/pages/main_page.dart';
import 'package:maps/resourses/colors.dart';
import 'package:maps/resourses/icons.dart';
import 'package:maps/services/google_sign_in_service.dart';
import 'package:maps/services/location_services.dart';
import 'package:maps/widgets/buttons/sign_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = 'screens/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 4,
              ),
              SvgPicture.asset(
                AppIcons.geo,
                height: 200,
                width: 200,
                color: AppColors.goldenrod,
              ),
              const Spacer(
                flex: 2,
              ),
              SignButton(
                onPressed: () {
                  GoogleSignInMethods().signInWithGoogle().whenComplete(
                    () {
                      OurLocation().permission();
                      Navigator.pushNamed(
                        context,
                        MainPage.routeName,
                      );
                    },
                  );
                },
                label: S.of(context).signIn,
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
