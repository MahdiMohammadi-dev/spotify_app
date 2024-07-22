import 'package:flutter/material.dart';
import 'package:spotify_app/screens/choose_artist_screen.dart';
import '../component/text_field_component.dart';
import '../constant/app_colors.dart';
import '../gen/fonts.gen.dart';

class ChooseNameScreen extends StatefulWidget {
  ChooseNameScreen({super.key});

  @override
  State<ChooseNameScreen> createState() => _ChooseNameScreenState();
}

List<String> options = [
  'Please send me news and offers from Spotify',
  'share my registration data with Spotify content providers for marketing'
];

class _ChooseNameScreenState extends State<ChooseNameScreen> {
  final TextEditingController nameTextController = TextEditingController();

  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
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
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What’s your name?',
                style: TextStyle(
                    fontFamily: FontFamily.avenirBold,
                    fontSize: 20,
                    color: AppColors.textColorWhite),
              ),
              TextFieldComponent(
                textEditingController: nameTextController,
              ),
              const Text(
                'This appears on your spotify profile',
                style: TextStyle(
                    fontFamily: FontFamily.avenirBold,
                    fontSize: 8,
                    color: AppColors.textColorWhite),
              ),
              const SizedBox(
                height: 35,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  color: AppColors.textfieldColorGrey,
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Text(
                      'By tapping on "Create account",you agree to the spotify Terms of Use',
                      style: TextStyle(
                          fontFamily: FontFamily.avenirBold,
                          fontSize: 12,
                          color: AppColors.textColorWhite))),
              const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text('Terms of Use',
                      style: TextStyle(
                          fontFamily: FontFamily.avenirBold,
                          fontSize: 13,
                          color: AppColors.greenColor))),
              const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text(
                      'To learn more about how Spotify collect, uses, shares, and protects your personal data, please see the Spotify Privacy Policy.',
                      style: TextStyle(
                          fontFamily: FontFamily.avenirBold,
                          fontSize: 13,
                          color: AppColors.textColorWhite))),
              const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text('Privacy Policy',
                      style: TextStyle(
                          fontFamily: FontFamily.avenirBold,
                          fontSize: 13,
                          color: AppColors.greenColor))),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Please send me news and offers from Spotify',
                          style: TextStyle(
                              fontFamily: FontFamily.avenirDemi,
                              fontSize: 12,
                              color: AppColors.textColorWhite),
                        ),
                        Radio(
                          activeColor: AppColors.greenColor,
                          value: options[0],
                          groupValue: currentOption,
                          onChanged: (value) {
                            setState(() {
                              currentOption = value.toString();
                              print("value is $value");
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Please send me news and offers from Spotify',
                          style: TextStyle(
                              fontFamily: FontFamily.avenirDemi,
                              fontSize: 12,
                              color: AppColors.textColorWhite),
                        ),
                        Radio(
                          activeColor: AppColors.greenColor,
                          value: options[1],
                          groupValue: currentOption,
                          onChanged: (value) {
                            setState(() {
                              currentOption = value.toString();
                              print("value is $value");
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.width * 0.3,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textColorWhite),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChooseArtistScreen(),
                    ));
                  },
                  child: const Center(
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                          fontFamily: FontFamily.avenirDemi,
                          color: AppColors.mainColor),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
