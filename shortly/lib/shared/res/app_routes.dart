import 'package:get/route_manager.dart';
import 'package:shortly/core/presentation/welcome/page/welcome_page.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static List<GetPage> routes = [
    GetPage(
      name: initialRoute,
      page: () => WelcomePage(),
    ),
  ];
}
