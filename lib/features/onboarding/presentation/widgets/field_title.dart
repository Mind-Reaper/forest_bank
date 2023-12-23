import 'package:flutter/material.dart';
import 'package:forest_bank/features/onboarding/constants.dart';

class FieldTitle extends StatelessWidget {
  final String title;

  const FieldTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
                fontSize: 10, color: kButtonColor, fontWeight: FontWeight.w700),
          )),
    );
  }
}
