import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maps/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:maps/generated/l10n.dart';
import 'package:maps/pages/main_page.dart';
import 'package:maps/pages/screens/login_screen.dart';
import 'package:maps/pages/screens/profile_screen.dart';
import 'package:maps/resourses/colors.dart';
import 'package:maps/resourses/fonts.dart';
import 'package:maps/resourses/icons.dart';
import 'package:maps/services/google_sign_in_service.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
    required this.onTap,
  });

  final void Function(String) onTap;

  @override
  State<CustomDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<CustomDrawer> {
  void _onChanged(BuildContext context, String route) {
    widget.onTap(route);
    Timer(
      const Duration(seconds: 1),
      () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        child: Drawer(
          backgroundColor: AppColors.springGreen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _DrawerItem(
                onPressed: () {
                  _onChanged(
                    context,
                    MainPage.routeName,
                  );
                },
                icon: AppIcons.geo,
                label: S.of(context).map,
              ),
              _DrawerItem(
                onPressed: () {
                  _onChanged(
                    context,
                    Profile.routeName,
                  );
                },
                icon: AppIcons.profile,
                label: S.of(context).profile,
              ),
              _DrawerItem(
                onPressed: () {
                  GoogleSignInMethods().signOut();
                  _onChanged(
                    context,
                    LoginPage.routeName,
                  );
                },
                icon: AppIcons.exit,
                label: S.of(context).exit,
              ),
            ],
          ),
        ),
      );
    },);
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem(
      {required this.onPressed,
      required this.icon,
      required this.label,
      Key? key})
      : super(key: key);

  final void Function() onPressed;
  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: onPressed,
          icon: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SvgPicture.asset(
              icon,
              color: AppColors.gold,
            ),
          ),
          label: Text(
            label,
            style: const TextStyle(
              color: AppColors.lightSlateGray,
              fontFamily: AppFonts.fontFamily,
              fontSize: 30.0,
              fontWeight: AppFonts.regular,
            ),
          ),
        ),
      ],
    );
  }
}
