import 'package:flutter/material.dart';
import 'package:forest_bank/features/onboarding/constants.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    this.onPressed,
    required this.iconData,
  });

  final VoidCallback? onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      constraints: const BoxConstraints(minHeight: 50, maxHeight: 50, maxWidth: 50, minWidth: 50),
      fillColor: Colors.white,
      onPressed: onPressed,
      shape: const CircleBorder(),
      child: Center(
        child: Icon(
          iconData,
          color: kButtonColor,
          size: 18,
        ),
      ),
    );
  }
}
