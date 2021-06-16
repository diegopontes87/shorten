import 'package:get/get.dart';
import 'package:shortly/shared/base/structure/base_controller.dart';
import 'package:shortly/shared/res/app_routes.dart';

class WelcomeController extends BaseController {
  void goToOnboardingPage() {
    Get.toNamed(AppRoutes.onboarding);
  }
}
