import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maps/generated/l10n.dart';
import 'package:maps/resourses/fonts.dart';
import 'package:maps/widgets/buttons/sign_button.dart';

Future areYouSureAboutNumber(BuildContext context) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              FirebaseAuth.instance.currentUser!.photoURL!,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              FirebaseAuth.instance.currentUser!.displayName!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: AppFonts.regular,
                fontFamily: AppFonts.fontFamily,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              30.0,
            ),
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        alignment: Alignment.center,
        actionsOverflowAlignment: OverflowBarAlignment.center,
        actionsOverflowButtonSpacing: 10,
        actions: [
          SignButton(
            label: S.of(context).back,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
