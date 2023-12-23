import 'package:flex_with_main_child/flex_with_main_child.dart';
import 'package:flutter/material.dart';
import 'package:forest_bank/features/onboarding/constants.dart';

class UnderlinedButton extends StatelessWidget {
  const UnderlinedButton({super.key, required this.text, this.onPressed});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final mainChildKey = GlobalKey();
    return GestureDetector(
      onTap: onPressed,
      child: ColumnWithMainChild(
        mainChildKey: mainChildKey,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            key: mainChildKey,
            text,
            style: const TextStyle(
                color: kButtonColor, fontSize: 18, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 3),
          Container(
            height: 4,
            color: kButtonColor,
          )
        ],
      ),
    );
  }
}
