import 'package:flutter/material.dart';

import '../widgets/custom_row_header.dart';
import '../widgets/custom_row_item.dart';

class CustomNotificationSection extends StatelessWidget {
  final String title;
  final Widget toggleIcon;
  final List<Map<String, String>> items;
  final VoidCallback? onTap;

  const CustomNotificationSection({
    super.key,
    required this.title,
    required this.toggleIcon,
    required this.items,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRowHeader(
          title: title,
          subtitle: toggleIcon,
          onTap: onTap ?? () {},
        ),
        const SizedBox(height: 12),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CustomRowItem(
            imagePath: item['imagePath']!,
            label: item['label']!,
          ),
        )),
      ],
    );
  }
}
