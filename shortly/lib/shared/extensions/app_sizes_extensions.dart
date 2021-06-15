import 'package:get/get.dart';

extension AppProportionalSizesExtension on int {
  static const prototypeHeight = 812;
  static const protypeWidth = 375;
  double propHeight() {
    return Get.height * (this / prototypeHeight);
  }

  double propWidth() {
    return Get.width * (this / protypeWidth);
  }
}
