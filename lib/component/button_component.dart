import 'package:flutter/material.dart';
import 'package:spotify_app/gen/fonts.gen.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    super.key,
    required this.size,
    required this.label,
    required this.appColors,
    required this.textColor,
    required this.iconName,
  });

  final Size size;
  final label;
  final Color appColors;
  final Color textColor;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width - 50,
      height: size.height * 0.07,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: const BorderSide(color: Colors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(iconName),
            SizedBox(
              width: size.width * 0.11,
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: FontFamily.avenirBold,
                  fontSize: 16,
                  color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
