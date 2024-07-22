import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/gen/fonts.gen.dart';

import '../constant/app_colors.dart';

class TextFieldComponent extends StatelessWidget {
  final TextEditingController textEditingController ;
   TextFieldComponent({
    super.key,  required this.textEditingController,

  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style:  const TextStyle(
          fontFamily: FontFamily.avenirDemi, color: AppColors.textColorWhite),
      decoration: InputDecoration(
       suffixIcon: ValueListenableBuilder(
         valueListenable: textEditingController,
         builder: (context,  value, child) {
           if (value.text.isNotEmpty) {
             return Icon(Icons.check,color: AppColors.textColorWhite,);
           } else {
             return SizedBox();
           }
         },
       ),
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
