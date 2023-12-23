import 'package:flutter/material.dart';
import 'package:forest_bank/features/onboarding/presentation/utils/onboarding_model.dart';

final onboardingPages = [
  OnboardingModel(
      titleBold: 'Fund',
      titleThin: 'Account',
      animationAssetPath: 'onboarding_1.json'),
  OnboardingModel(
      titleBold: 'Save',
      titleThin: 'Money',
      animationAssetPath: 'onboarding_2.json'),
  OnboardingModel(
      titleBold: 'Send',
      titleThin: 'Money',
      animationAssetPath: 'onboarding_3.json'),
  OnboardingModel(
      titleBold: 'Buy',
      titleThin: 'Airtime',
      animationAssetPath: 'onboarding_4.json'),
  OnboardingModel(
      titleBold: 'Pay',
      titleThin: 'Bills',
      animationAssetPath: 'onboarding_5.json'),
];

const kButtonColor = Color(0xFF006838);
const kBackgroundAccentColor = Color(0xffE3F2B3);
const kDeepGreen = Color(0xFF002E17);

final kInputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    hintStyle: TextStyle(
        color: const Color(0x563C2415).withOpacity(0.34),
        fontSize: 12,
        fontWeight: FontWeight.w300),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none));
