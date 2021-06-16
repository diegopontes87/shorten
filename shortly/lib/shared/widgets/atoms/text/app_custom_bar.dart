import 'package:flutter/material.dart';
import 'package:shortly/shared/res/app_colors.dart';

import 'app_text_widget.dart';

class AppCustomBar extends StatelessWidget {
  final String? appBartitle;
  AppCustomBar({this.appBartitle});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparent,
      elevation: 0.0,
      title: AppTextWidget(
        text: appBartitle,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
