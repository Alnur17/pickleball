import 'package:get/get.dart';


class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  // final List<Widget> _screens = [
  //    HomeView(),
  //    Container(),
  //    Container(),
  //    Container(),
  // ];

  // Widget get currentScreen => _screens[selectedIndex.value];
  //
  // void changeTabIndex(int index) {
  //   selectedIndex.value = index;
  // }
}
