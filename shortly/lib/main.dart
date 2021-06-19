import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly/shared/res/base_res_files/app_routes.dart';
import 'package:shortly/shared/res/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.routes,
    );
  }
}
