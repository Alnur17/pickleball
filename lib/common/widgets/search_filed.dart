import 'package:flutter/material.dart';
import 'package:pickleball/common/app_images/app_images.dart';
import 'custom_textfield.dart';

class SearchFiled extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchFiled({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onChange: onChanged,
      preIcon: Image.asset(
        AppImages.searchTwo,
        scale: 4,
      ),
    );
  }
}
