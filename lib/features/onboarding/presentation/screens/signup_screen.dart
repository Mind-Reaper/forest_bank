import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forest_bank/features/onboarding/constants.dart';
import 'package:forest_bank/features/onboarding/presentation/widgets/field_title.dart';
import 'package:forest_bank/features/onboarding/presentation/widgets/fixed_ratio_loading_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final genders = ['Female', 'Male', 'Optimus Prime'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              const SizedBox(height: 100),
              Container(
                  width: double.infinity,
                  height: 270,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage('assets/onboarding/signup_bg.png'))),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      color: kBackgroundAccentColor,
                    ),
                  )),
              Expanded(
                child: Container(
                  color: kBackgroundAccentColor,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Text(
                  "LET'S GET STARTED",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kDeepGreen),
                ),
                const SizedBox(height: 15),
                Text(
                  'Personal Information',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 3; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Container(
                          height: i == 0 ? 4 : 2,
                          width: 30,
                          color: kButtonColor.withOpacity(i == 0 ? 1 : 0.1),
                        ),
                      )
                  ],
                ),
                const Spacer(),
                const FieldTitle(title: 'First Name'),
                TextFormField(
                    decoration: kInputDecoration.copyWith(hintText: 'Daniel')),
                const SizedBox(height: 20),
                const FieldTitle(title: 'Last Name'),
                TextFormField(
                    decoration: kInputDecoration.copyWith(hintText: 'Onadipe')),
                const SizedBox(height: 20),
                const FieldTitle(title: 'Gender'),
                PopupMenuButton(
                  position: PopupMenuPosition.over,
                  offset: const Offset(1, 0),
                  itemBuilder: (_) {
                    return List.generate(
                        genders.length,
                        (index) => PopupMenuItem(
                                child: Text(
                              genders[index],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300),
                            )));
                  },
                  child: TextFormField(
                      enabled: false,
                      decoration: kInputDecoration.copyWith(
                          hintText: 'Select Gender',
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: kButtonColor,
                          ))),
                ),
                const SizedBox(height: 20),
                const FieldTitle(title: 'Date of Birth'),
                InkWell(
                  onTap: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now());
                  },
                  child: TextFormField(
                      enabled: false,
                      decoration: kInputDecoration.copyWith(
                          hintText: 'Select date',
                          suffixIcon: const Icon(
                            Icons.calendar_month_outlined,
                            size: 17,
                            color: kButtonColor,
                          ))),
                ),
                const SizedBox(height: 25),
                FixedRatioLoadingButton(
                    text: 'NEXT',
                    onPressed: () async {
                      await Future.delayed(const Duration(seconds: 5));
                    }),
                const SizedBox(height: 11),
                const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Have an account? ',
                        ),
                        TextSpan(
                            text: 'Login',
                            style: TextStyle(color: kButtonColor))
                      ],
                    ),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: kDeepGreen)),
                const SizedBox(
                  height: 32,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
