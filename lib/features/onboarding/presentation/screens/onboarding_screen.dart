import 'package:flutter/material.dart';
import 'package:forest_bank/core/routes.dart';
import 'package:forest_bank/features/onboarding/constants.dart';
import 'package:forest_bank/features/onboarding/presentation/widgets/circle_icon_button.dart';
import 'package:forest_bank/features/onboarding/presentation/widgets/rounded_button.dart';
import 'package:forest_bank/features/onboarding/presentation/widgets/underlined_button.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final pageController = PageController();

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
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    playAndNavigate();
    animationController.addListener(() {
      setState(() {});
    });
  }

  Future<void> playAndNavigate() async {
    await animationController.forward().then((value) async {
      final page = pageController.page?.toInt() ?? 0;
      if (page + 1 < onboardingPages.length) {
        await pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final page =
        pageController.hasClients ? pageController.page?.round() ?? 0 : 0;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              physics: const ClampingScrollPhysics(),
              controller: pageController,
              itemCount: onboardingPages.length,
              onPageChanged: (index) {
                animationController.reset();
                playAndNavigate();
              },
              itemBuilder: (context, index) {
                final onboardingPage = onboardingPages[index];
                return Stack(
                  children: [
                    Lottie.asset(
                        'assets/onboarding/${onboardingPage.animationAssetPath}',
                        height: double.infinity,
                        alignment: Alignment.centerRight,
                        fit: BoxFit.fitHeight),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 115,
                          ),
                          Text(
                            onboardingPage.titleBold,
                            style: TextStyle(
                                fontSize: 45,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            onboardingPage.titleThin,
                            style: TextStyle(
                                fontSize: 45,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                              width: 191,
                              child: Text(
                                onboardingPage.subtitle,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w300),
                              ))
                        ],
                      ),
                    )
                  ],
                );
              }),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      for (int i = 0; i < onboardingPages.length; i++)
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.6),
                          child: LinearProgressIndicator(
                            minHeight: 7,
                            value: i == page
                                ? animationController.value
                                : i > page
                                    ? 0
                                    : 1,
                            color: Theme.of(context).primaryColor,
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.3),
                          ),
                        )),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UnderlinedButton(
                        text: 'Skip',
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signup);
                        },
                      ),
                      AnimatedCrossFade(
                        crossFadeState: page + 1 >= onboardingPages.length
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 300),
                        firstChild: RoundedButton(
                          text: 'GET STARTED',
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signup);
                          },
                        ),
                        secondChild: CircleIconButton(
                          iconData: Icons.arrow_forward_ios,
                          onPressed: () async {
                            await pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.fastOutSlowIn);
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
