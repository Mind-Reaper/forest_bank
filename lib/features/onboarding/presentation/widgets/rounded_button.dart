import 'package:flutter/material.dart';
import 'package:forest_bank/features/onboarding/constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, this.onPressed, required this.text});

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints(minHeight: 50, maxHeight: 50),
      elevation: 0,
      onPressed: onPressed,
      fillColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: kButtonColor,
          ),
        ),
      ),
    );
  }
}
