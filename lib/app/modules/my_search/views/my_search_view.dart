import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_search_controller.dart';

class MySearchView extends GetView<MySearchController> {
  const MySearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MySearchView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MySearchView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
