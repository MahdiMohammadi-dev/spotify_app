import 'package:flutter/material.dart';
import 'package:spotify_app/constant/app_colors.dart';
import 'package:spotify_app/gen/assets.gen.dart';
import 'package:spotify_app/gen/fonts.gen.dart';
import 'package:spotify_app/screens/Signupemail_screen.dart';

import '../component/button_component.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          //TODO:Image box with foreground Gradient
          Container(
            foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black,
              Colors.black.withOpacity(0.1),
            ], begin: Alignment.bottomCenter, end: Alignment.center)),
            width: double.infinity,
            height: 300,
            child: Image.asset(
              Assets.img.welcomeImage.path,
              fit: BoxFit.cover,
            ),
          ),
          //TODO:Background Gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black,
              Colors.black.withOpacity(0.5),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          //TODO:Spotify Logo with sub text
          Positioned(
            bottom: 320,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  Assets.img.spotifylogo.path,
                ),
                const Text(
                  "Millions of Songs.\n Free on Spotify.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: FontFamily.avenirBold,
                      fontSize: 28,
                      color: AppColors.textColorWhite),
                ),
              ],
            ),
          ),
          // TODO:Button's Sections
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Column(
              children: [
                SizedBox(
                  width: size.width - 50,
                  height: size.height * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignupEmailScreen(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.greenColor),
                    child: const Text(
                      'Sign up free',
                      style: TextStyle(
                          fontFamily: FontFamily.avenirBold,
                          fontSize: 16,
                          color: AppColors.mainColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ButtonComponent(
                  size: size,
                  label: "Continue with Google",
                  appColors: Colors.transparent,
                  textColor: AppColors.textColorWhite,
                  iconName: Assets.img.google.path,
                ),
                const SizedBox(
                  height: 15,
                ),
                ButtonComponent(
                  size: size,
                  label: "Continue with Facebook",
                  appColors: Colors.transparent,
                  textColor: AppColors.textColorWhite,
                  iconName: Assets.img.facebook.path,
                ),
                const SizedBox(
                  height: 15,
                ),
                ButtonComponent(
                  size: size,
                  label: "Continue with Apple",
                  appColors: Colors.transparent,
                  textColor: AppColors.textColorWhite,
                  iconName: Assets.img.apple.path,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                        fontFamily: FontFamily.avenirBold,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
