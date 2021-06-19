import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly/core/presentation/home/controller/home_controller.dart';
import 'package:shortly/shared/base/models/medium_button_state_model.dart';
import 'package:shortly/shared/res/base_res_files/app_strings.dart';
import 'package:shortly/shared/widgets/atoms/text/app_text_widget.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';
import 'package:shortly/shared/widgets/molecules/cards/app_link_card_widget.dart';

class HomeHistoryPage extends GetWidget<HomeController> {
  final GlobalKey<AnimatedListState>? listKey;

  HomeHistoryPage({this.listKey});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => ListView(
        shrinkWrap: true,
        children: [
          AppTextWidget(
            width: Get.width,
            margin: EdgeInsets.only(top: 41.propHeight()),
            text: AppStrings.yourLinkHistoryTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          AnimatedList(
            physics: NeverScrollableScrollPhysics(),
            key: listKey,
            shrinkWrap: true,
            initialItemCount: controller.mediumButtonStateModelList.length,
            itemBuilder: (context, index, animation) {
              return _buildItem(context, index, animation);
            },
          ),
          Container(
            height: 200.propHeight(),
          )
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index, animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: AppLinkCardWidget(
        mediumButtonStateModel: controller.mediumButtonStateModelList[index],
        copyFunction: () => controller.copyTextFunction(
          controller.mediumButtonStateModelList[index].entity?.shortLink,
          index,
        ),
        deleteFunction: () => controller.deleteFromDB(
          controller.mediumButtonStateModelList[index].entity?.id,
          () => deleteAnimatedItem(
            context,
            index,
            controller.mediumButtonStateModelList,
          ),
          errorSnackBar,
        ),
      ),
    );
  }

  deleteAnimatedItem(BuildContext context, index, List<MediumButtonStateModel> list) async {
    listKey?.currentState?.removeItem(index, (_, animation) {
      animation.addListener(() {
        if (animation.isDismissed) {
          controller.cleanAndCkeckList(list, index);
        }
      });
      return _buildItem(context, index, animation);
    }, duration: const Duration(milliseconds: 500));
  }

  void errorSnackBar(String error) {
    Get.snackbar(AppStrings.error, error);
  }
}
