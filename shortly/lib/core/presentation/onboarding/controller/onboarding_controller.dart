import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shortly/shared/res/app_routes.dart';

class OnboardingController extends GetxController {
  int currentPageIndex = 0;
  final PageController viewPageController = PageController(initialPage: 0);

  void changePage(int currentPageIndex) {
    this.currentPageIndex = currentPageIndex;
    update();
  }

  void goToHomePage() {
    Get.toNamed(AppRoutes.home);
  }
}
