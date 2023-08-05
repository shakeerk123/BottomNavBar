import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/cart_tab.dart';
import '../view/home_tab.dart';
import '../view/profile_tab.dart';
import '../view/statistics_tab.dart';



class MainWrapperController extends GetxController {
  late PageController pageController;


 //creates a reactive  integer variable named currentPage with an initial value of 0. 
 //It uses the obs extension provided by the GetX library.
  RxInt currentPage = 0.obs;


//creates a reactive boolean variable named isDarkTheme with an initial value of false. 
// used to determine whether the app is currently in dark mode. 
  RxBool isDarkTheme = false.obs;



  List<Widget> pages = [
    const HomeTab(),
    const CartTab(),
    const StatisticsTab(),
    const ProfileTab(),
  ];

 //t returns the current theme mode based on whether the app is in
 // dark mode or light mode using the Get.isDarkMode feature from the GetX library.
  ThemeMode get theme => Get.isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void switchTheme(ThemeMode mode) {//allows  to switch between light and dark themes by calling
    Get.changeThemeMode(mode);
  }

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }
  void animateToTab(int page) { 
    currentPage.value = page;
   pageController.animateToPage(page, //navigates to the specified page using a smooth animation
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease);
  }


// overridden method from the GetxController class that is called when the controller is initialized.'
// It initializes the pageController with an initial page of 0.
  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
