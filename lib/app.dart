import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forest_bank/core/routes.dart';
import 'package:forest_bank/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:forest_bank/features/onboarding/presentation/screens/signup_screen.dart';

import 'package:forest_bank/features/onboarding/presentation/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forest Bank',
      theme: ThemeData(
        fontFamily: 'Gotham',
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            iconTheme: IconThemeData(color: Colors.black)),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffA0D400)),
        primaryColor: const Color(0xffA0D400),
        splashColor: const Color(0xFF006838).withOpacity(0.3),
        scaffoldBackgroundColor: Colors.white,
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Color(0xFF006838))))),
        useMaterial3: false,
      ),
      routes: {
        Routes.splash: (_) => const SplashScreen(),
        Routes.onboarding: (_) => const OnboardingScreen(),
        Routes.signup: (_) => const SignUpScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
