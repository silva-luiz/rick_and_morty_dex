import 'package:flutter/material.dart';
import 'package:rick_and_morty_dex/modules/shared/colors/colors.dart';

class StrokedText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color strokeColor;
  final double strokeWidth;
  final Color fillColor;
  final FontWeight fontWeight;

  const StrokedText({
    super.key,
    required this.text,
    this.fontSize = 48,
    this.strokeColor = AppColors.secondaryTitleColor,
    this.strokeWidth = 6,
    this.fillColor = AppColors.primaryTitleColor,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'GetSchwifty',
            fontSize: fontSize,
            fontWeight: fontWeight,
            foreground:
                Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = strokeWidth
                  ..color = strokeColor,
          ),
        ),

        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'GetSchwifty',
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: fillColor,
          ),
        ),
      ],
    );
  }
}
