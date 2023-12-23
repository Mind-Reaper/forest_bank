import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FixedRatioLoadingButton extends StatefulWidget {
  const FixedRatioLoadingButton(
      {super.key,
      required this.text,
      this.color,
      required this.onPressed,
      this.textColor,
      this.width = double.infinity});

  final String text;
  final Color? color;
  final Color? textColor;
  final Future<void> Function() onPressed;

  final double width;

  @override
  State<FixedRatioLoadingButton> createState() =>
      _FixedRatioLoadingButtonState();
}

class _FixedRatioLoadingButtonState extends State<FixedRatioLoadingButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: LayoutBuilder(builder: (context, constraints) {
        final height = (50 * constraints.maxWidth) / 320;
        return Stack(
          alignment: Alignment.center,
          children: [
          if(loading)  Lottie.asset('assets/onboarding/button_loading_animation.json',
                fit: BoxFit.fitWidth, width: constraints.maxWidth),
            Center(
              child: RawMaterialButton(
                constraints: BoxConstraints.expand(
                    width: constraints.maxWidth - 6, height: height - 2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                elevation: 0,
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  await widget.onPressed.call();
                  setState(() {
                    loading = false;
                  });
                },
                fillColor: widget.color ?? const Color(0xFFA0D400),
                child: Text(
                  widget.text,
                  style: TextStyle(
                      color: widget.color ?? Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
