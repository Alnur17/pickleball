import 'package:flutter/material.dart';
import 'package:pickleball/common/app_text_style/styles.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';

class CustomRowItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final TextStyle? textStyle;
  final double imageScale;
  final Widget spacing;

  const CustomRowItem({
    super.key,
    required this.imagePath,
    required this.label,
    this.textStyle,
    this.imageScale = 4.0,
    this.spacing = sw8,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          scale: imageScale,
        ),
        spacing,
        Text(
          label,
          style: textStyle ?? h6,
        ),
      ],
    );
  }
}
