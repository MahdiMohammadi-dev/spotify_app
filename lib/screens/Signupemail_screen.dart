import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/constant/app_colors.dart';
import 'package:spotify_app/gen/fonts.gen.dart';
import 'package:spotify_app/screens/password_screen.dart';

import '../component/next_button_component.dart';
import '../component/text_field_component.dart';

class SignupEmailScreen extends StatelessWidget {
  const SignupEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: AppColors.textColorWhite),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Create account',
            style: TextStyle(
                fontFamily: FontFamily.avenirBold,
                color: AppColors.textColorWhite,
                fontSize: 16),
          ),
        ),
        body:  Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What’s your email?',
                style: TextStyle(
                    fontFamily: FontFamily.avenirBold,
                    fontSize: 20,
                    color: AppColors.textColorWhite),
              ),
              const TextFieldComponent(),
              const Text(
                'You’ll need to confirm this email later.',
                style: TextStyle(
                    fontFamily: FontFamily.avenirBold,
                    fontSize: 8,
                    color: AppColors.textColorWhite),
              ),
              const SizedBox(
                height: 35,
              ),
              NextButtonComponent(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PasswordScreen(),));
              },)
            ],
          ),
        ),
      ),
    );
  }
}

