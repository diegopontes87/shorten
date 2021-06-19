import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shortly/shared/utils/screen_state/screen_state.dart';

class BaseController extends GetxController {
  ScreenState screenState = ScreenState.initialState;

  updateScreenState(ScreenState newScreenState) {
    screenState = newScreenState;
    update();
  }
}
