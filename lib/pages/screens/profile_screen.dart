import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maps/blocs/lat_long_bloc/lat_long_bloc.dart';
import 'package:maps/generated/l10n.dart';
import 'package:maps/resourses/borders.dart';
import 'package:maps/resourses/colors.dart';
import 'package:maps/resourses/fonts.dart';
import 'package:maps/resourses/icons.dart';
import 'package:maps/widgets/buttons/sign_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  static const String routeName = 'screens/profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  double randomNumber = Random().nextDouble() * 359.9;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return BlocBuilder<LatLongBloc, LatLongState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.blue,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: SvgPicture.asset(
              AppIcons.drawer,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              Container(
                height: h / 4,
                width: w / 2.3,
                decoration: const BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      41.0,
                    ),
                  ),
                ),
                child: Image.network(
                  FirebaseAuth.instance.currentUser!.photoURL!,
                ),
              ),
              const Spacer(),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(
                    10.0,
                  ),
                  fillColor: AppColors.blue,
                  filled: true,
                  focusedBorder: border,
                  enabledBorder: border,
                  border: border,
                  hintText: FirebaseAuth.instance.currentUser!.displayName!,
                  hintMaxLines: 1,
                  hintStyle: const TextStyle(
                    fontWeight: AppFonts.bold,
                    fontSize: 15.0,
                    fontFamily: AppFonts.fontFamily,
                  ),
                  counterText: S.of(context).name,
                  counterStyle: const TextStyle(
                    fontWeight: AppFonts.regular,
                    fontSize: 15.0,
                    fontFamily: AppFonts.fontFamily,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(
                    10.0,
                  ),
                  fillColor: AppColors.blue,
                  filled: true,
                  focusedBorder: border,
                  enabledBorder: border,
                  border: border,
                  hintText: FirebaseAuth.instance.currentUser!.email!,
                  hintMaxLines: 1,
                  hintStyle: const TextStyle(
                    fontWeight: AppFonts.bold,
                    fontSize: 15.0,
                    fontFamily: AppFonts.fontFamily,
                  ),
                  counterText: S.of(context).email,
                  counterStyle: const TextStyle(
                    fontWeight: AppFonts.regular,
                    fontSize: 15.0,
                    fontFamily: AppFonts.fontFamily,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(
                flex: 2,
              ),
              SignButton(
                onPressed: () {
                  setState(
                    () {
                      context.read<LatLongBloc>().add(
                            RememberEvent(
                              color: randomNumber,
                            ),
                          );
                    },
                  );
                },
                label: S.of(context).change,
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      );
    });
  }
}
