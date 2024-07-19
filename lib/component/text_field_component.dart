import 'package:flutter/material.dart';
import 'package:spotify_app/gen/fonts.gen.dart';

import '../constant/app_colors.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
          fontFamily: FontFamily.avenirDemi, color: AppColors.textColorWhite),
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textfieldColorGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  const BorderSide(color: AppColors.greenColor, width: 2.0))),
    );
  }
}
