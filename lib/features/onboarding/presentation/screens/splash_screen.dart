import 'package:flutter/material.dart';
import 'package:forest_bank/core/routes.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    playAndNavigate();
  }

  Future<void> playAndNavigate() async {
    await animationController.forward().then((value) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.onboarding, (route) => route.isCurrent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/onboarding/splash.json',
        controller: animationController,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover);
  }
}
