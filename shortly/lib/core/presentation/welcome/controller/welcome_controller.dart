import 'package:get/get.dart';
import 'package:shortly/shared/res/app_routes.dart';

class WelcomeController extends GetxController {
  void changeToOnboardingPage() {
    Get.toNamed(AppRoutes.onboarding);
  }
}
