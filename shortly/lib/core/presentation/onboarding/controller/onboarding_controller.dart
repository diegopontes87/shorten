import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly/shared/base/structure/base_controller.dart';
import 'package:shortly/shared/res/app_routes.dart';

class OnboardingController extends BaseController {
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
