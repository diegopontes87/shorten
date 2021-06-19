import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly/core/presentation/home/pages/home_history_page.dart';
import 'package:shortly/core/presentation/home/controller/home_controller.dart';
import 'package:shortly/core/presentation/home/pages/home_presentation_page.dart';
import 'package:shortly/shared/res/base_res_files/app_strings.dart';
import 'package:shortly/shared/widgets/molecules/cards/app_bottom_action_card_widget.dart';

class HomePage extends GetWidget<HomeController> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Container(
          height: Get.height,
          color: Theme.of(context).colorScheme.surface,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: Get.height),
            child: Stack(
              children: [
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 500),
                  firstChild: HomePresentationPage(),
                  secondChild: HomeHistoryPage(listKey: listKey),
                  crossFadeState: controller.showFirstPage ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                ),
                AppBottomActionCardWidget(
                  controller: controller.textEditingController,
                  screenState: controller.screenState,
                  buttonFunction: () => controller.shortenLinkAction(
                    controller.textEditingController,
                    errorSnackBar,
                    () => insertAnimatedItem(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  insertAnimatedItem() {
    listKey.currentState?.insertItem(0, duration: const Duration(milliseconds: 500));
  }

  void errorSnackBar(String error) {
    Get.snackbar(AppStrings.error, error);
  }
}
