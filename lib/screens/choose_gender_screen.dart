import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:spotify_app/constant/app_colors.dart';
import 'package:spotify_app/gen/fonts.gen.dart';

import '../component/next_button_component.dart';
import '../component/text_field_component.dart';
import 'choose_name_screen.dart';

class ChooseGenderScreen extends StatelessWidget {
  ChooseGenderScreen({super.key});
final TextEditingController genderTextController = TextEditingController();
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
                'What’s your gender?',
                style: TextStyle(
                    fontFamily: FontFamily.avenirBold,
                    fontSize: 20,
                    color: AppColors.textColorWhite),
              ),
               TextFieldComponent(textEditingController: genderTextController,),
              const SizedBox(
                height: 20,
              ),
              NextButtonComponent(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChooseNameScreen(),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
