import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../gen/fonts.gen.dart';

class NextButtonComponent extends StatelessWidget {

  final void Function()? onPressed;

  const NextButtonComponent({
    super.key,required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.textfieldColorGrey),
        child: const Text(
          'Next',
          style: TextStyle(
              fontFamily: FontFamily.avenirBold,
              fontSize: 15,
              color: AppColors.mainColor),
        ),
      ),
    );
  }
}
