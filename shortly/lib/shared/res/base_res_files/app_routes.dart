import 'package:get/route_manager.dart';
import 'package:shortly/core/presentation/home/bindings/home_bindings.dart';
import 'package:shortly/core/presentation/home/pages/home_page.dart';
import 'package:shortly/core/presentation/onboarding/page/onboarding_page.dart';
import 'package:shortly/core/presentation/welcome/page/welcome_page.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static List<GetPage> routes = [
    GetPage(
      name: initialRoute,
      page: () => WelcomePage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: onboarding,
      page: () => OnboardingPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: home,
      page: () => HomePage(),
      binding: HomeBindings(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}
