import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LanguageView extends GetView {
  const LanguageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LanguageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LanguageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
