import 'package:flutter/material.dart';
import 'package:maps/resourses/colors.dart';
import 'package:maps/resourses/fonts.dart';

class SignButton extends StatelessWidget {
  const SignButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final void Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColors.lime,
      onPressed: onPressed,
      heroTag: label,
      label: Text(
        label,
        style: const TextStyle(
          fontWeight: AppFonts.bold,
          fontSize: 15.0,
          fontFamily: AppFonts.fontFamily,
        ),
      ),
    );
  }
}
