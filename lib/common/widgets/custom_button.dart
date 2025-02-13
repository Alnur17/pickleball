import 'package:flutter/material.dart';
import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final String? imageAssetPath;
  final double? borderRadius;
  final List<Color>? gradientColors;  // Accept a list of colors

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textStyle,
    this.textColor,
    this.height = 48,
    this.width = double.infinity,
    this.borderColor,
    this.imageAssetPath,
    this.borderRadius = 40,
    this.gradientColors, // Accept gradientColors as an optional parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius!),
          border: Border.all(color: borderColor ?? AppColors.transparent),
          // Apply the default gradient if gradientColors is null
          gradient: gradientColors != null
              ? LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors!, // Use provided gradient colors
          )
              : LinearGradient(  // Default gradient if none is provided
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff007FF5), Color(0xff003A71)],
          ),
          color: null,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (imageAssetPath != null) ...[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    imageAssetPath!,
                    scale: 4,
                  ),
                ),
              ],
              Text(
                text,
                style: textStyle ?? h3.copyWith(
                  fontWeight: FontWeight.w700,
                  color: textColor ?? AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
