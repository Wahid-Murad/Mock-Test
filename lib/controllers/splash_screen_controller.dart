import 'dart:async';
import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/controllers/common_controller/global_controller.dart';

class SplashScreenController extends GetxController {
  final GlobalController _globalController = Get.find<GlobalController>();
  @override
  void onInit() {
    // TODO: implement onInit
    startSplashScreen();
    super.onInit();
  }

  Timer startSplashScreen() {
    _globalController.parentRoute.value = "splash-screen";
    var duration = const Duration(seconds: 5);
    return Timer(
      duration,
      () async {
        // if (_globalController.isLoggedIn.value) {
        //   Get.offNamed(krSplashScreen);
        //   Get.toNamed(krHome);
        //   Get.find<HomeController>().isHomePageLoading.value = true;
        //   //todo:: call home api
        // } else {
        //   Get.find<AuthenticationController>().resetLoginScreen();
        //   Get.offAllNamed(krLogin);
        // }
        Get.offAllNamed(krHomeScreen);
      },
    );
  }
}
